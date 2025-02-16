import 'package:yoser/screens/contact_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:yoser/screens/factuer.dart';
import 'package:yoser/screens/home_screen.dart';
import 'package:yoser/screens/about_screen.dart';
import 'package:yoser/screens/personnalisation_screen.dart';
import '../screens/addpostproduct.dart';
import '../widgets/custom_bottom_nav_bar.dart';

import 'package:yoser/screens/panier_screen.dart';



class BaseScreen extends StatelessWidget {
  final int currentIndex;
  final Widget child;
  final bool showBottomNavBar; 
  final bool shouldNavigate; 

  const BaseScreen({
    Key? key,
    required this.currentIndex,
    required this.child,
    this.showBottomNavBar = true,
    this.shouldNavigate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: showBottomNavBar ? CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (shouldNavigate) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            } else if (index == 4) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              );
            }else if (index == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ContactListScreen()),
              );
            }

            else if (index == 3) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PanierScreen()),
              );
            }
            else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Addpostproduct()),
              );
            }


          }
        },
      ) : null,
    );
  }
}
