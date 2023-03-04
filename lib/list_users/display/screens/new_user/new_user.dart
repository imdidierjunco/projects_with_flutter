import 'package:flutter/material.dart';
import '../../../data/models/models.dart';
import '../../widgets/widgets.dart';

class NewUserScreen extends StatefulWidget {
  static String routeName = 'new_user';

  const NewUserScreen({super.key});

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  final List<ItemDropdown> listSex = [
    ItemDropdown(label: 'Femenino', value: 'female'),
    ItemDropdown(label: 'Masculino', value: 'male'),
  ];

  final List<ItemDropdown> listStatus = [
    ItemDropdown(label: 'Activo', value: 'active'),
    ItemDropdown(label: 'Inactivo', value: 'inactive'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: true,
        title: const Text(
          'Agregar usuario',
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
            const TextFieldWidget(
              icon: Icons.person,
              label: 'Nombre',
              placeholder: 'Ingrese nombre',
            ),
            const SizedBox(
              height: 20,
            ),
            const TextFieldWidget(
              icon: Icons.mail,
              label: 'Correo',
              placeholder: 'Ingrese correo',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownWidget(
                  list: listSex,
                  label: 'Género',
                ),
                DropdownWidget(
                  list: listStatus,
                  label: 'Estado',
                )
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: const ButtonWidget(),
            )
          ],
        ),
      ),
    );
  }
}
