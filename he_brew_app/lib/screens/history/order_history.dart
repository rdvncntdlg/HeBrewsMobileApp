import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'sample_data.dart';

<<<<<<< HEAD
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key});
=======
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
>>>>>>> 740eb4bb15a86b9bf59ca392ba756c5530a50ab1

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and slide animation
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from below the screen
      end: Offset.zero, // End at the original position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text(
          'Order History',
          style: TextStyle(
            fontWeight: FontWeight.bold,
=======
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Order History',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
>>>>>>> 740eb4bb15a86b9bf59ca392ba756c5530a50ab1
          ),
        ),
      ),
      body: SlideTransition(
        position: _slideAnimation,
        child: ListView.builder(
          itemCount: sampleHistory.length,
          itemBuilder: (context, index) {
            final item = sampleHistory[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(item.orderDetails),
                subtitle: Text(item.date),
                trailing: Text(
                  '₱${item.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
