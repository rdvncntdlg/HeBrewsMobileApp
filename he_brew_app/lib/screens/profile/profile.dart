import 'package:flutter/material.dart';
import 'package:he_brew_app/screens/login/login_screen.dart';
import 'package:he_brew_app/constants.dart';
import 'package:he_brew_app/screens/profile/widgets/address.dart';
import 'package:he_brew_app/screens/profile/widgets/order.dart';
import 'package:he_brew_app/screens/profile/widgets/payment_method.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = 'John Doe'; // Example initial values
  String _username = '@eyykamuna'; // Example initial values

  @override
  Widget build(BuildContext context) {
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
          Text(
            _name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            _username,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildFeatureBox(
                  icon: Icons.payment,
                  title: 'Payment Methods',
                  subtitle: 'Manage your payment options',
                  onTap: () {
                    Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) => const PaymentMethodsScreen()));
                  },
                ),
                const SizedBox(height: 16),
                _buildFeatureBox(
                  icon: Icons.location_on,
                  title: 'Address',
                  subtitle: 'Manage your addresses',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddressScreen()));
                  },
                ),
                const SizedBox(height: 16),
                _buildFeatureBox(
                  icon: Icons.shopping_bag,
                  title: 'My Orders',
                  subtitle: 'View your order history',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderScreen()));
                     
                  },
                ),
                const SizedBox(height: 16),
                _buildEditProfileButton(context), // Added Edit Profile button
                const SizedBox(height: 16),
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

  Widget _buildFeatureBox({required IconData icon, required String title, String? subtitle, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }

  Widget _buildEditProfileButton(BuildContext context) {
    return _buildFeatureBox(
      icon: Icons.edit,
      title: 'Edit Profile',
      onTap: () {
        // Show Edit Profile dialog
        _showEditProfileDialog(context);
      },
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: _name);
    TextEditingController usernameController = TextEditingController(text: _username);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save changes and update profile details
                setState(() {
                  _name = nameController.text;
                  _username = usernameController.text;
                });
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _handleLogout(BuildContext context) {
    // Perform any necessary cleanup, such as clearing user data
    // Navigate to the sign-in screen and clear the navigation stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }
}