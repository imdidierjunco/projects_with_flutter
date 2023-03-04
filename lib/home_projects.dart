import 'package:flutter/material.dart';

import 'list_projects.dart';

class HomeProjectsScreen extends StatefulWidget {
  static String routeName = 'home-projects';

  const HomeProjectsScreen({super.key});
  @override
  State<HomeProjectsScreen> createState() => _HomeProjectsScreenState();
}

class _HomeProjectsScreenState extends State<HomeProjectsScreen> {
  ListProject listProjects = ListProject();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        title: const Text(
          'Lista de proyectos',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.separated(
        itemCount: listProjects.projects.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => Navigator.pushNamed(
                context, listProjects.projects[index].routeName),
            title: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                listProjects.projects[index].name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                listProjects.projects[index].details,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
