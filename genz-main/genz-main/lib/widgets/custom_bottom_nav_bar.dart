import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/7.png'),
            color: _getIconColor(0),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/8.png'),
            color: _getIconColor(1),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/9.png'),
            color: _getIconColor(2),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/10.png'),
            color: _getIconColor(3),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/11.png'),
            color: _getIconColor(4),
          ),
          label: '',
        ),
      ],
    );
  }

  Color _getIconColor(int index) {
    return index == currentIndex ? Colors.green : Colors.grey;
  }
}
