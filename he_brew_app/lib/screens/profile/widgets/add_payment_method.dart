import 'package:flutter/material.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cardNumberController = TextEditingController();
    TextEditingController expiryDateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Payment Method'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
            decoration: const InputDecoration(
              labelText: 'Mobile Number',
              labelStyle: TextStyle(
                fontFamily: 'Poppins'
              ),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your mobile number';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Account Name',
              labelStyle: TextStyle(
                fontFamily: 'Poppins'
              ),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your account name';
              }
              return null;
            },
          ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _savePaymentMethod(context, cardNumberController.text, expiryDateController.text);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _savePaymentMethod(BuildContext context, String cardNumber, String expiryDate) {
    // Add logic to save the new payment method to backend or local storage
    // Optionally navigate back to PaymentMethodsScreen or handle navigation as per app flow
    Navigator.pop(context); // Close the AddPaymentMethodScreen after saving
  }
}
