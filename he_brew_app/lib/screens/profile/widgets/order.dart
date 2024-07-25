import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildOrderTile(
            orderId: 'Order #12345',
            totalAmount: '\$100.00',
            onCancel: () {
              // Handle cancel order action
              _handleCancelOrder(context, 'Order #12345');
            },
          ),
          const SizedBox(height: 16),
          _buildOrderTile(
            orderId: 'Order #67890',
            totalAmount: '\$50.00',
            onCancel: () {
              // Handle cancel order action
              _handleCancelOrder(context, 'Order #67890');
            },
          ),
          // Add more orders as needed
        ],
      ),
    );
  }

  Widget _buildOrderTile({
    required String orderId,
    required String totalAmount,
    required VoidCallback onCancel,
  }) {
    return ListTile(
      title: Text(orderId),
      subtitle: Text('Total: $totalAmount'),
      trailing: ElevatedButton(
        onPressed: onCancel,
        child: const Text('Cancel'),
      ),
    );
  }

  void _handleCancelOrder(BuildContext context, String orderId) {
    // Show confirmation dialog before cancelling order
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel Order'),
          content: Text('Are you sure you want to cancel order: $orderId?'),
          actions: [
            TextButton(
              onPressed: () {
                // Perform cancel order logic here
                _performCancelOrder(context, orderId);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _performCancelOrder(BuildContext context, String orderId) {
    // Add logic to cancel the order (e.g., send cancellation request to backend)
    // Optionally show a success message or handle navigation as per app flow
    Navigator.pop(context); // Close the confirmation dialog
    // You can also update the UI or show a message that the order has been cancelled
  }
}
