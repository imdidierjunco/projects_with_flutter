import 'package:flutter/material.dart';

import 'widgets.dart';

class QuickButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  const QuickButton({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color.withOpacity(0.25),
      ),
      child: Row(
        children: [
          CircleButton(
            colorDecoration: color,
            icon: icon,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
