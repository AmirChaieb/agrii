import 'package:flutter/material.dart';
import 'package:yoser/screens/BiensAgricoles_screen.dart';
import 'package:yoser/screens/service_screen.dart';
import 'package:yoser/widgets/base_screen.dart';
import 'package:yoser/screens/IntrantAgricoles_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 0,
      showBottomNavBar: true,
      shouldNavigate: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Categories',
            style: TextStyle(
              color: Color.fromRGBO(76, 175, 80, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildDetailedCategory(
                context,
                'Biens agricoles',
                'Agriculture Farming',
                'assets/images/6.png',
                'but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                BiensAgricolesScreen(),
              ),
              const SizedBox(height: 16),
              _buildDetailedCategory(
                context,
                'Services',
                'Agriculture Farming',
                'assets/images/2.png',
                'but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                ServiceScreen(), // for now b3ad nbdlha service
              ),
              const SizedBox(height: 16),
              _buildDetailedCategory(
                context,
                'Intrant agricoles',
                'Agriculture Farming',
                'assets/images/3.png',
                'but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                IntrantListScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailedCategory(
    BuildContext context,
    String title,
    String subtitle,
    String imagePath,
    String description,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(8)),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color.fromRGBO(252, 175, 9, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
