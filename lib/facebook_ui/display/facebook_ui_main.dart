import 'package:all_flutter/facebook_ui/display/screens/screens.dart';
import 'package:flutter/material.dart';

class FacebookUIMain extends StatelessWidget {
  const FacebookUIMain({super.key});
  static String routeName = 'facebook-ui';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: FacebookUIHomeScreen.routeName,
      routes: {
        FacebookUIHomeScreen.routeName: (_) => const FacebookUIHomeScreen(),
      },
    );
  }
}
