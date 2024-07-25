import 'package:flutter/material.dart';
import 'package:he_brew_app/screens/profile/widgets/add_payment_method.dart'; // Import your AddPaymentMethodScreen

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigate to AddPaymentMethodScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddPaymentMethodScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPaymentMethodTile(
            icon: Icons.credit_card,
            title: 'Sheena Catacutan',
            subtitle: '09234829302',
          ),
          const SizedBox(height: 16),
          _buildPaymentMethodTile(
            icon: Icons.payment,
            title: 'Sean Luis Catacutan',
            subtitle: '09234829302',
          ),
          const SizedBox(height: 16),
          _buildPaymentMethodTile(
            icon: Icons.payment,
            title: 'Gwen Apuli',
            subtitle: '090123456789',
          ),
          // Add more payment methods as needed
        ],
      ),
    );
  }

  Widget _buildPaymentMethodTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

}
