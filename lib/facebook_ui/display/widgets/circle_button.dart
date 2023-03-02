import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Color colorDecoration;
  final IconData icon;
  final bool showBadge;
  const CircleButton(
      {Key? key,
      required this.colorDecoration,
      required this.icon,
      this.showBadge = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorDecoration,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
          ),
          (showBadge)
              ? Positioned(
                  top: -2,
                  right: 0,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      border: Border.all(
                        width: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
