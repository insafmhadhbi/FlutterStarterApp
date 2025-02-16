// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:first_flutter/pages/weather.page.dart';
// import 'package:first_flutter/pages/quiz.dart';
// import 'package:first_flutter/pages/counter_page.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page d\'Accueil'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundImage: AssetImage('assets/profile.jpg'), // Update with your image path
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Mhadhbi Insaf',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.wb_sunny),
//               title: Text('Weather'),
//               onTap: () => Get.to(() => Weather()), // Navigation using GetX
//             ),
//             ListTile(
//               leading: Icon(Icons.quiz),
//               title: Text('Quiz'),
//               onTap: () => Get.to(() => Quiz()), // Navigation using GetX
//             ),
//             ListTile(
//               leading: Icon(Icons.add),
//               title: Text('Counter Page'),
//               onTap: () => Get.to(() => CounterPage()), // Navigation to CounterPage
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Text('Bienvenue sur la page d\'accueil!'),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter/pages/weather.page.dart';
import 'package:first_flutter/pages/quiz.dart';
import 'package:first_flutter/pages/counter_page.dart';

class HomePage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d\'Accueil'),
        actions: [
          // Logout button
          if (FirebaseAuth.instance.currentUser != null)
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.snackbar("Déconnexion", "Vous êtes déconnecté(e).",
                    snackPosition: SnackPosition.BOTTOM);
              },
            )
        ],
      ),
      drawer: FirebaseAuth.instance.currentUser != null
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/profile.jpg'), // Update with your image path
                        ),
                        SizedBox(height: 10),
                        Text(
                          FirebaseAuth.instance.currentUser?.email ?? 'Utilisateur',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Weather'),
                    onTap: () => Get.to(() => Weather()), // Navigation using GetX
                  ),
                  ListTile(
                    leading: Icon(Icons.quiz),
                    title: Text('Quiz'),
                    onTap: () => Get.to(() => Quiz()), // Navigation using GetX
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Counter Page'),
                    onTap: () => Get.to(() => CounterPage()), // Navigation to CounterPage
                  ),
                ],
              ),
            )
          : null,
      body: FirebaseAuth.instance.currentUser == null
          ? LoginForm(
              emailController: emailController,
              passwordController: passwordController,
            )
          : Center(
              child: Text('Bienvenue ${FirebaseAuth.instance.currentUser?.email}!'),
            ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginForm({required this.emailController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Mot de passe'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
                Get.snackbar("Succès", "Connexion réussie!",
                    snackPosition: SnackPosition.BOTTOM);
              } catch (e) {
                Get.snackbar("Erreur", e.toString(),
                    snackPosition: SnackPosition.BOTTOM);
              }
            },
            child: Text('Se connecter'),
          ),
          TextButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
                Get.snackbar("Succès", "Inscription réussie!",
                    snackPosition: SnackPosition.BOTTOM);
              } catch (e) {
                Get.snackbar("Erreur", e.toString(),
                    snackPosition: SnackPosition.BOTTOM);
              }
            },
            child: Text('Créer un compte'),
          ),
        ],
      ),
    );
  }
}
