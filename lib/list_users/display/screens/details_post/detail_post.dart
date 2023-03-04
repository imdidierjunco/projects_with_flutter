import 'package:flutter/material.dart';

class DetailPostScreen extends StatelessWidget {
  static String routeName = 'details-post';

  const DetailPostScreen({super.key});

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
          'Detalle del post',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _itemCard(
              'Título del post',
              'titulo del post',
            ),
            const SizedBox(
              height: 15,
            ),
            _itemCard(
              'Contenido del post',
              'contenido del post',
            ),
          ],
        ),
      ),
    );
  }

  Column _itemCard(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Text(
                text,
              ),
            ),
          ),
        )
      ],
    );
  }
}
