import 'package:all_flutter/list_users/data/models/item_dropdown.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  final List<ItemDropdown> list;
  final String label;

  const DropdownWidget({super.key, required this.list, required this.label});
  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  ItemDropdown? _select;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              widget.label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: const EdgeInsets.only(
              left: 12,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: DropdownButton(
              hint: const Text('Seleccione'),
              isExpanded: true,
              underline: const SizedBox(),
              value: _select,
              items: widget.list.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item.label),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _select = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
