import 'package:flutter/material.dart';
import 'package:he_brew_app/screens/profile/widgets/add_address_screen.dart'; // Import your AddAddressScreen

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigate to AddAddressScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddAddressScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildAddressTile(
            title: 'Home',
            subtitle: 'P. Aguila, Cuta, Batangas City 4200',
          ),
          const SizedBox(height: 16),
          _buildAddressTile(
            title: 'Work',
            subtitle: 'Uranus St., Alangilan, Batangas City 4200',
          ),
          // Add more addresses as needed
        ],
      ),
    );
  }

  Widget _buildAddressTile({
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
