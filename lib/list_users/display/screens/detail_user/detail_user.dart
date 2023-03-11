import 'package:all_flutter/list_users/display/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import '../../../services/http.dart';

class DetailUserScreen extends StatelessWidget {
  static String routeName = 'detail-user';

  const DetailUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Detalle del usuario',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text('Eliminar Usuario'),
                    content:
                        const Text('¿Seguro quiere eliminar este usuario?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Aceptar',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('Información del usuario'),
            _infoUser(user as UserModel),
            const SizedBox(
              height: 15,
            ),
            _title('Lista de posts'),
            _listPost(context, user.id!),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          Navigator.pushNamed(context, NewPostScreen.routeName);
        },
        child: const Icon(
          Icons.note_add,
        ),
      ),
    );
  }

  Card _listPost(BuildContext context, int idUser) {
    final HttpService httpService = HttpService();

    return Card(
      elevation: 5,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: FutureBuilder(
          future: httpService.getPostUser(idUser),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.separated(
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: (context, index) {
                      final post = snapshot.data![index];

                      return snapshot.data!.isNotEmpty
                          ? ListTile(
                              leading: const Icon(
                                Icons.file_copy,
                                color: Colors.blueAccent,
                              ),
                              title: Text(post.title!),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                              ),
                              onTap: () => Navigator.pushNamed(
                                context,
                                DetailPostScreen.routeName,
                                arguments: post,
                              ),
                            )
                          : const Center(
                              child: Text(
                                'No tiene post',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.greenAccent,
                    ),
                  );
          },
        ),
      ),
    );
  }

  Card _infoUser(UserModel user) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          _item(
            Icons.person,
            user.name!,
          ),
          _item(
            Icons.mail,
            user.email!,
          ),
          _item(
            Icons.supervised_user_circle_rounded,
            user.gender!,
          ),
          _item(
            Icons.circle,
            user.status!,
            true,
          ),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String text, [bool status = false]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: status == true ? Colors.green : Colors.blueAccent,
          size: 35,
        ),
        trailing: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
