import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String placeholder;
  final IconData? icon;
  final bool isTextArea;
  const TextFieldWidget({
    super.key,
    required this.label,
    required this.placeholder,
    this.icon,
    this.isTextArea = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(15.0)),
          padding: const EdgeInsets.only(
            left: 12,
          ),
          child: TextField(
            maxLines: isTextArea ? 6 : 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: placeholder,
              suffixIcon: Icon(
                icon,
                color: Colors.blueAccent,
              ),
            ),
          ),
        )
      ],
    );
  }
}
