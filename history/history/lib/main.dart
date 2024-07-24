import 'package:flutter/material.dart';
import 'sample_data.dart';

void main() {
  runApp(CoffeeShopApp());
}

class CoffeeShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      home: HistoryScreen(),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: ListView.builder(
        itemCount: sampleHistory.length,
        itemBuilder: (context, index) {
          final item = sampleHistory[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(item.orderDetails),
              subtitle: Text(item.date),
              trailing: Text(
                '\₱${item.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
