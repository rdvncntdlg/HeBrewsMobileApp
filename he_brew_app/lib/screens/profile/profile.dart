import 'package: he_brew_app/screen/login/login_screen.dart';
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

          // List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildFeatureBox(
                  icon: Icons.payment,
                  title: 'Payment Methods',
                  subtitle: 'Manage your payment options',
                  onTap: () {
                    // Navigate to Payment Methods Screen
                  },
                ),
                const SizedBox(height: 16), // Space between boxes
                _buildFeatureBox(
                  icon: Icons.location_on,
                  title: 'Address',
                  subtitle: 'Manage your addresses',
                  onTap: () {
                    // Navigate to Address Screen
                  },
                ),
                const SizedBox(height: 16), // Space between boxes
                _buildFeatureBox(
                  icon: Icons.shopping_bag,
                  title: 'My Orders',
                  subtitle: 'View your order history',
                  onTap: () {
                    // Navigate to My Orders Screen
                  },
                ),
                const SizedBox(height: 16), // Space between boxes
                _buildFeatureBox(
                  icon: Icons.logout,
                  title: 'Log Out',
                  onTap: () {
                    _handleLogout(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleLogout(BuildContext context) {
    // Perform any necessary cleanup, such as clearing user data
    // Navigate to the sign-in screen and clear the navigation stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPage
