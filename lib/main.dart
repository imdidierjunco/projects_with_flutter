import 'package:all_flutter/projects.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: HomeProjectsScreen.routeName,
      routes: {
        HomeProjectsScreen.routeName: (_) => const HomeProjectsScreen(),
        ListUserMain.routeName: (_) => const ListUserMain(),
      },
    );
  }
}
