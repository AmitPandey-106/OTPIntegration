import 'package:flutter/material.dart';

void main() {
  runApp(DoodleHomesApp());
}

class DoodleHomesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoodleHomesPage(),
    );
  }
}

class DoodleHomesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFD9A8E1), // Background color similar to the image
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Top Logo
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0xFFE8E8E8), // Greyish background for logo
                        ),
                        Image.asset(
                          'assets/doodle_logo.png', // Replace with your logo asset
                          width: 80,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // House Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/house_image.png', // Replace with your image asset
                    width: 300,
                  ),
                ),
                SizedBox(height: 20),
                // Text Below Image
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Explore the New Era of Booking and Services',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                // Bottom Logo
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0xFFE8E8E8), // Greyish background for logo
                        ),
                        Image.asset(
                          'assets/doodle_logo.png', // Replace with your logo asset
                          width: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ),
        );
    }
}