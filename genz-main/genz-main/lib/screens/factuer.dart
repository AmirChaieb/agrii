import 'package:flutter/material.dart';
import 'package:yoser/widgets/base_screen.dart';

class FactureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 1, // Set this as the index for navigation
      showBottomNavBar: true, // Ensure the bottom navigation bar is visible
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.green),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'FACTURE',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Biens Agricoles',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/1.png', // Replace with your image path
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildDetailRow('Quantité', '250', 'Kg'),
              const SizedBox(height: 10),
              _buildDetailRow('Prix Par Unité', '15', 'DT'),
              const SizedBox(height: 20),
              const Text(
                'Details De Achats',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              _buildDetailRow('Quantité', '250', 'Kg'),
              _buildDetailRow('Prix Par Unité', '15', 'DT'),
              _buildDetailRow('TVA 18%', '15', 'DT'),
              _buildDetailRow('Totale Facture', '236', 'DT'),
              const Spacer(),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add your button action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  label: const Text(
                    'Buy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, String unit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              unit,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
