import 'package:flutter/material.dart';
import 'package:he_brew_app/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: contentColor,
        title: const Text(
          "Profile",
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/profile/sheena.jpg'),
          ),
          // Name and Username
          const Text(
            'John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            '@eyykamuna',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 16), // Space between username and image

          // Circular Image

          const SizedBox(height: 16), // Space between image and list

          // List
          Expanded(
            child: ListView(
              children: List.generate(10, (index) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('Item ${index + 1}'),
                  subtitle: Text('Subtitle ${index + 1}'),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
