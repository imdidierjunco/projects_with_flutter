import 'package:all_flutter/home_projects.dart';
import 'package:all_flutter/list_users/display/screens/screens.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'user-home';

  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Lista de usuarios',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pushNamed(
            context,
            HomeProjectsScreen.routeName,
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () =>
                Navigator.pushNamed(context, DetailUserScreen.routeName),
            title: const Text('Nombre'),
            subtitle: const Text('Email'),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'new_user');
        },
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
