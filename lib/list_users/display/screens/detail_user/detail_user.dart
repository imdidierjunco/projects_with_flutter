import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailUserScreen extends StatelessWidget {
  static String routeName = 'detail-user';

  const DetailUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            _infoUser(),
            const SizedBox(
              height: 15,
            ),
            _title('Lista de posts'),
            _listPost(context),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: null,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  Card _listPost(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: ListView.separated(
          itemCount: 8,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemBuilder: (context, index) {
            return const ListTile(
              leading: Icon(
                Icons.file_copy,
                color: Colors.blueAccent,
              ),
              title: Text('Nombre del post'),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
            );
          },
        ),
      ),
    );
  }

  Card _infoUser() {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          _item(
            Icons.person,
            'Nombre',
          ),
          _item(
            Icons.mail,
            'Correo',
          ),
          _item(
            Icons.supervised_user_circle_rounded,
            'Sexo',
          ),
          _item(
            Icons.circle,
            'Activo',
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
