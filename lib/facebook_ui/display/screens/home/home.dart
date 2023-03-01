import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        actions: [
          _circleButton(
            Colors.grey,
            Icons.search,
          ),
          const SizedBox(
            width: 10,
          ),
          _circleButton(
            Colors.red,
            Icons.notifications,
          ),
          const SizedBox(
            width: 10,
          ),
          _circleButton(
            Colors.lightBlue,
            Icons.people,
          ),
          const SizedBox(
            width: 10,
          ),
          _circleButton(
            Colors.blue,
            Icons.messenger_sharp,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: const Center(
        child: Text('Hola Mundo'),
      ),
    );
  }

  Container _circleButton(Color colorDecoration, IconData icon) {
    return Container(
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
    );
  }
}
