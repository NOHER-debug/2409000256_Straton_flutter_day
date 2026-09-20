import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer_off_outlined, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No study sessions yet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Your finished sessions will appear here.'),
        ],
      ),
    );
  }
}
