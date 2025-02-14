import 'package:flutter/material.dart';
import 'package:yoser/widgets/base_screen.dart';

class PersonnalisationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 1,
      showBottomNavBar: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'PAGE DE PERSONNALISATION',
            style: TextStyle(
              color: Color.fromRGBO(76, 175, 80, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
         
        ),
        
        body: Column(
          children: [
            SizedBox(height: 40), // Espacement entre les sections
           Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5.0),
  child: Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 5,
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image en cercle à gauche
        ClipOval(
          child: Image.asset(
            'assets/images/1.png',  // Chemin de l'image
            width: 60.0,             // Largeur de l'image
            height: 60.0,            // Hauteur de l'image
            fit: BoxFit.cover,       // Adapter l'image pour qu'elle couvre tout l'espace
          ),
        ),
        SizedBox(width: 16), // Espacement entre l'image et le texte
        // Texte à droite de l'image
        Expanded(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yosri ben ali',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
            ],
          ),
        ),
      ],
    ),
  ),
),
SizedBox(height: 40),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espacer les deux blocs
    children: [
      // Premier bloc
      Expanded(
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image en cercle à gauche
               Icon(Icons.list, color: Colors.green, size: 20),
                        SizedBox(width: 8),
              SizedBox(width: 16), // Espacement entre l'image et le texte
              // Texte à droite de l'image
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    Text(
                      'LISTE DES CONTACTS',
                      style: TextStyle(
                        fontSize: 12.0,
                       fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 10), // Espace entre les deux blocs

      // Deuxième bloc (identique au premier)
      Expanded(
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image en cercle à gauche
               Icon(Icons.favorite, color: Colors.green, size: 20),
                        SizedBox(width: 8),
              SizedBox(width: 16), // Espacement entre l'image et le texte
              // Texte à droite de l'image
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FAVORITE',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
              
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
),

SizedBox(height: 10),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espacer les deux blocs
    children: [
      // Premier bloc
      Expanded(
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image en cercle à gauche
               Icon(Icons.info, color: Colors.green, size: 20),
                        SizedBox(width: 8),
              SizedBox(width: 16), // Espacement entre l'image et le texte
              // Texte à droite de l'image
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    Text(
                      'INFO',
                      style: TextStyle(
                        fontSize: 12.0,
                       fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 10), // Espace entre les deux blocs

      // Deuxième bloc (identique au premier)
      Expanded(
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
               Icon(Icons.history, color: Colors.green, size: 20),
                        SizedBox(width: 8),
              SizedBox(width: 16), // Espacement entre l'image et le texte
              // Texte à droite de l'image
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HISTORIQUE',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
              
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
),
SizedBox(height: 60), // Espacement entre les sections
        Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5.0),
  child: Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 5,
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icône à gauche
        Icon(Icons.settings, color: Colors.green, size: 20),
       
        SizedBox(width: 16), // Espacement entre l'icône et le texte
        
        // Texte au centre
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PARAMETRES GENERALE',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        
        // Icône à droite
        Icon(Icons.check_box, color: Colors.green, size: 20),
      ],
    ),
  ),
),

SizedBox(height: 20), // Espacement entre les sections
           Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5.0),
  child: Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 5,
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Icon(Icons.nights_stay, color: Colors.green, size: 20),
        SizedBox(width: 16), // Espacement entre l'image et le texte
        // Texte à droite de l'image
        Expanded(
          child: Column(
           
            children: [
              Text(
                'MODE SOMBRE',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              
            ],
          ),
        ),
      ],
    ),
  ),
),
SizedBox(height: 20), // Espacement entre les sections
           Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5.0),
  child: Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 5,
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Icon(Icons.key, color: Colors.green, size: 20),
        SizedBox(width: 16), // Espacement entre l'image et le texte
        // Texte à droite de l'image
        Expanded(
          child: Column(
           
            children: [
              Text(
                'CONFIDIALITE',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              
            ],
          ),
        ),
      ],
    ),
  ),
),
SizedBox(height: 20), // Espacement entre les sections
           Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5.0),
  child: Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 5,
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Icon(Icons.help_outline, color: Colors.green, size: 20),
        SizedBox(width: 16), // Espacement entre l'image et le texte
        // Texte à droite de l'image
        Expanded(
          child: Column(
           
            children: [
              Text(
                'AIDE',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              
            ],
          ),
        ),
      ],
    ),
  ),
),
SizedBox(height: 140),
   Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5.0),
  child: Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 5,
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Icon(Icons.logout, color: Colors.white, size: 20),
       
        SizedBox(width: 16), // Espacement entre l'image et le texte
        // Texte à droite de l'image
        Expanded(
          child: Column(
           
            children: [
              Text(
                'DECONNECTER',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              
            ],
          ),
        ),
      ],
    ),
  ),
)
          ],
        ),
      ),
    );
  }
}