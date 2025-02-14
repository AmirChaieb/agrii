import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Effectuer l'opération d'inscription ici
      print("Name: $_name, Email: $_email, Password: $_password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.green, // Couleur de l'AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Bordure arrondie
            ),
            elevation: 8.0, // Ombre pour donner de la profondeur
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ajuste la hauteur au contenu
                  children: <Widget>[
                    Center(
                      child: Text(
                        'WELCOME TO OUR APPLICATION',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green, // Texte en vert
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30), // Espacement entre les éléments

                    // Champ Name avec bordure arrondie
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0), // Bordure arrondie
                        ),
                        filled: true,
                        fillColor: Colors.grey[100], // Couleur de fond
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                    SizedBox(height: 15), // Espacement entre les champs

                    // Champ Email avec bordure arrondie
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0), // Bordure arrondie
                        ),
                        filled: true,
                        fillColor: Colors.grey[100], // Couleur de fond
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
                    SizedBox(height: 15),

                    // Champ Password avec bordure arrondie
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0), // Bordure arrondie
                        ),
                        filled: true,
                        fillColor: Colors.grey[100], // Couleur de fond
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
                    SizedBox(height: 15),

                    // Champ Confirm Password avec bordure arrondie
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0), // Bordure arrondie
                        ),
                        filled: true,
                        fillColor: Colors.grey[100], // Couleur de fond
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value != _password) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    // Bouton d'inscription stylé
                    ElevatedButton(
                      onPressed: _signUp,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                        child: Text(
                          'Create',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Couleur du bouton
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Bordure arrondie
                        ),
                        elevation: 5.0, // Ombre pour un effet de relief
                      ),
                    ),
                    SizedBox(height: 20),

                    // Bouton pour retourner à la page de connexion
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Retour à l'écran de connexion
                      },
                      child: Text(
                        'Already have an account? Login',
                        style: TextStyle(color: Colors.green),
                      ),
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
