import 'dart:convert'; 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoser/screens/about_screen.dart';
import '../widgets/base_screen.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  late Future<List<dynamic>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = _loadUsers();
  }
Future<List<dynamic>> _loadUsers() async {
  try {
    final String response = await rootBundle.loadString('assets/users.json');
    final List<dynamic> data = json.decode(response) as List<dynamic>; 
    return data; 
  } catch (e) {
    print('Error loading users: $e');
    return []; 
  }
}

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 2,
      showBottomNavBar: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'LISTE DES CONTACTS',
            style: TextStyle(
              color: Color.fromRGBO(76, 175, 80, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.green),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            _buildBackgroundImage(112.04, 96.6, -120, 'assets/images/background.png', 101.87, 100.08),
            _buildBackgroundImage(158.36, 383.1, 118.65, 'assets/images/background.png', 144.13, 141.59),
            _buildBackgroundImage(461.47, 315.62, 58.41, 'assets/images/background.png', 144.13, 141.59),
            _buildBackgroundImage(803.8, 363.16, 70.53, 'assets/images/background.png', 82.88, 81.42),

            FutureBuilder<List<dynamic>>(
              future: _usersFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final users = snapshot.data!;
                  return ListView.separated(
                    padding: EdgeInsets.all(16.0),
                    itemCount: users.length,
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return _buildUserCard(user);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error loading users'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage(double top, double left, double angle, String assetPath, double width, double height) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.rotate(
        angle: angle * 3.141592653589793 / 180,
        child: Opacity(
          opacity: 0.1,
          child: Image.asset(
            assetPath,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }

  Widget _buildUserCard(Map<String, dynamic> user) {
    return Container(
      width: 410,
      height: 169,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
              child: Image.asset(
                user['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user['name'],
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'but also the leap into electronic typesetting',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        width: 157,
                        height: 30,
                        padding: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.send, color: Colors.white, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Message',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 157,
                        height: 30,
                        padding: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AboutScreen()),
                            );
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                              Icon(Icons.info, color: Colors.green, size: 20),
                          SizedBox(width: 8),
                            Text(
                              'Consultation',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
