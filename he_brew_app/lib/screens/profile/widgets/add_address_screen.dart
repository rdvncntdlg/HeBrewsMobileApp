import 'package:flutter/material.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController streetController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController zipCodeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
            decoration: const InputDecoration(
              labelText: 'Type',
              labelStyle: TextStyle(
                fontFamily: 'Poppins'
              ),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter address type';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Street',
              labelStyle: TextStyle(
                fontFamily: 'Poppins'
              ),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your street';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Barangay',
              labelStyle: TextStyle(
                fontFamily: 'Poppins'
              ),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your barangay';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'City',
              labelStyle: TextStyle(
                fontFamily: 'Poppins'
              ),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your city';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Zip Code',
              labelStyle: TextStyle(
                fontFamily: 'Poppins'
              ),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your zip code';
              }
              return null;
            },
          ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Save new address logic
                _saveAddress(context, streetController.text, cityController.text, zipCodeController.text);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveAddress(BuildContext context, String street, String city, String zipCode) {
    Navigator.pop(context);
  }
}
