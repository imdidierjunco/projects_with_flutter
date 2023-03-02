import 'package:flutter/material.dart';

import 'widgets.dart';

class QuickAction extends StatelessWidget {
  const QuickAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          QuickButton(
            color: Color(0xffAEE2A4),
            icon: Icons.photo,
            title: 'Gallery',
          ),
          QuickButton(
            color: Color(0xff2880D4),
            icon: Icons.people,
            title: 'Tag Friends',
          ),
          QuickButton(
            color: Color(0xffFB7171),
            icon: Icons.video_call,
            title: 'Live',
          ),
        ],
      ),
    );
  }
}
