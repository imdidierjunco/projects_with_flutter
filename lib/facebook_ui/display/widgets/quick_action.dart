import 'package:flutter/material.dart';

import 'widgets.dart';

class QuickAction extends StatelessWidget {
  const QuickAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
        top: 15,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Row(
          children: const [
            QuickButton(
              color: Color(0xffAEE2A4),
              icon: Icons.photo,
              title: 'Gallery',
            ),
            SizedBox(
              width: 15,
            ),
            QuickButton(
              color: Color(0xff2880D4),
              icon: Icons.people,
              title: 'Tag Friends',
            ),
            SizedBox(
              width: 15,
            ),
            QuickButton(
              color: Color(0xffFB7171),
              icon: Icons.video_call,
              title: 'Live',
            ),
          ],
        ),
      ),
    );
  }
}
