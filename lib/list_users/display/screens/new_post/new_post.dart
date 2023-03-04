import 'package:all_flutter/list_users/display/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NewPostScreen extends StatelessWidget {
  static String routeName = 'new-post';

  const NewPostScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nuevo post',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: const [
            TextFieldWidget(
              label: 'Título',
              placeholder: 'Título',
              icon: Icons.title,
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              label: 'Contenido',
              placeholder: 'Contenido',
              isTextArea: true,
            ),
            Spacer(),
            ButtonWidget()
          ],
        ),
      ),
    );
  }
}
