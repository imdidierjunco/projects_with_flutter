import 'package:flutter/material.dart';

import '../../home_projects.dart';
import 'screens/screens.dart';

class ListUserMain extends StatelessWidget {
  const ListUserMain({super.key});
  static String routeName = 'list-user';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        NewUserScreen.routeName: (_) => const NewUserScreen(),
        DetailUserScreen.routeName: (_) => const DetailUserScreen(),
        HomeProjectsScreen.routeName: (_) => const HomeProjectsScreen(),
      },
    );
  }
}
