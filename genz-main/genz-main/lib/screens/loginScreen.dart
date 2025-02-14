import 'package:flutter/material.dart';
import 'signup_screen.dart'; // Importez la page d'inscription
import 'home_screen.dart'; // Importez la page d'accueil

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Effectuer l'opération de connexion ici
      print("Email: $_email, Password: $_password");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), // Navigation vers HomeScreen
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          // Pour permettre le défilement si le clavier est affiché
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Bordure arrondie pour la carte
            ),
            elevation: 8.0, // Ombre pour donner un effet de profondeur
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ajuste la hauteur au contenu
                  children: <Widget>[
                    // Ajout d'un texte centré en haut du formulaire
                    Text(
                      'WELCOME TO OUR APPLICATION', // Texte à afficher
                      style: TextStyle(
                        fontSize: 24.0, // Taille de la police
                        fontWeight: FontWeight.bold, // Gras
                        color: Colors.green, // Couleur du texte
                      ),
                      textAlign: TextAlign.center, // Centrer le texte
                    ),
                    SizedBox(height: 30), // Espace entre le texte et le formulaire

                    // Champ Email avec forme
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0), // Bordure arrondie pour le champ
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    SizedBox(height: 15), // Espace entre les champs

                    // Champ Password avec forme
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0), // Bordure arrondie pour le champ
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!;
                      },
                    ),
                    SizedBox(height: 20),

                    // Bouton de Connexion
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Bouton en vert
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Bordure arrondie pour le bouton
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 50.0, // Largeur du bouton
                          vertical: 15.0, // Hauteur du bouton
                        ),
                      ),
                      child: Text('Login'),
                    ),
                    SizedBox(height: 20),

                    // Bouton pour aller à la page d'inscription
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text('Don\'t have an account? Sign Up'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
