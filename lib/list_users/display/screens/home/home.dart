import 'package:all_flutter/home_projects.dart';
import 'package:all_flutter/list_users/display/screens/screens.dart';
import 'package:all_flutter/list_users/services/http.dart';
import 'package:flutter/material.dart';

class ListUserHomeScreen extends StatefulWidget {
  static String routeName = 'user-home';

  const ListUserHomeScreen({super.key});
  @override
  State<ListUserHomeScreen> createState() => _ListUserHomeScreen();
}

class _ListUserHomeScreen extends State<ListUserHomeScreen> {
  final HttpService _httpService = HttpService();
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
      body: FutureBuilder(
        future: _httpService.getAllUsers(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final user = snapshot.data![index];
                    return ListTile(
                      onTap: () => Navigator.pushNamed(
                        context,
                        DetailUserScreen.routeName,
                        arguments: user,
                      ),
                      title: Text(user.name!),
                      subtitle: Text(user.email!),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.greenAccent,
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            NewUserScreen.routeName,
          );
        },
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
