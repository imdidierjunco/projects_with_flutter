import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/widgets.dart';

class FacebookUIHomeScreen extends StatefulWidget {
  static String routeName = 'facebook-ui-home';
  const FacebookUIHomeScreen({super.key});

  @override
  State<FacebookUIHomeScreen> createState() => _FacebookUIHomeScreen();
}

class _FacebookUIHomeScreen extends State<FacebookUIHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 140,
        leading: SvgPicture.asset(
          'assets/facebook_ui/logos/logo.svg',
          color: Colors.blueAccent,
          width: 140,
        ),
        actions: const [
          CircleButton(
            colorDecoration: Colors.grey,
            icon: Icons.search,
          ),
          SizedBox(
            width: 10,
          ),
          CircleButton(
            colorDecoration: Colors.red,
            icon: Icons.notifications,
          ),
          SizedBox(
            width: 10,
          ),
          CircleButton(
            colorDecoration: Colors.lightBlue,
            icon: Icons.people,
            showBadge: true,
          ),
          SizedBox(
            width: 10,
          ),
          CircleButton(
            colorDecoration: Colors.blue,
            icon: Icons.messenger_sharp,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ).copyWith(
          top: 17,
        ),
        children: const [
          WhatIsOnYourMind(),
          QuickAction(),
        ],
      ),
    );
  }
}
