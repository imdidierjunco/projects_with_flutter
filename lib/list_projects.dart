import 'package:all_flutter/projects.dart';
import 'project_model.dart';

class ListProject {
  List<ProjectModel> projects = [
    ProjectModel(
      name: 'Lista de usuarios',
      details:
          'Listar, eliminar y agregar usuarios, además consumirlos de una API',
      routeName: ListUserMain.routeName,
    ),
    ProjectModel(
      name: 'Facebook UI',
      details: 'Diseño de la UI de Facebook',
      routeName: FacebookUIMain.routeName,
    ),
  ];
}
