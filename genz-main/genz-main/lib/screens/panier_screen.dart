import 'package:flutter/material.dart';
import 'package:yoser/widgets/base_screen.dart';

class PanierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 3,
      showBottomNavBar: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'PANIER',
            style: TextStyle(
              color: Color.fromRGBO(76, 175, 80, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.search,
                                color: Colors.grey), // Icône à droite
                          ),
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            // Implémenter la logique de recherche ici
                          },
                        ),
                      ),
                      SizedBox(height: 20), // Espacement après la recherche
                    ],
                  ),
                ),
              ),
              // Ajouter un premier item au panier
              panierItem(context, 'assets/images/13.jpg', 'Biens agricoles',
                  'but also the leap into electronic typesetting'),
              SizedBox(height: 20),
              // Ajouter un deuxième item au panier
              panierItem(context, 'assets/images/14.jpg', 'Biens agricoles',
                  'but also the leap into electronic typesetting'),
              SizedBox(height: 20),
              // Ajouter un troisième item au panier
              panierItem(context, 'assets/images/15.jpg', 'Biens agricoles',
                  'but also the leap into electronic typesetting'),
              SizedBox(height: 20),
              // Ajouter un quatrième item au panier
              panierItem(context, 'assets/images/15.jpg', 'Biens agricoles',
                  'but also the leap into electronic typesetting'),
            ],
          ),
        ),
      ),
    );
  }

  Widget panierItem(BuildContext context, String imagePath, String title,
      String description) {
    return Padding(
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
            // Image à gauche
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imagePath), // Chemin de votre image
                ),
              ),
            ),
            SizedBox(width: 16), // Espacement entre l'image et le texte
            // Texte à droite
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 5),
                  boutonAction(Icons.check_box, 'Affecter', Colors.green),
                  SizedBox(height: 5),
                  boutonAction(Icons.delete, 'Remove', Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget boutonAction(IconData icon, String label, Color color) {
    return Container(
      width: 157,
      height: 30,
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border:
            Border.all(color: color == Colors.green ? Colors.grey : Colors.red),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
