import 'package:flutter/material.dart';

import '../../models/dropdown_item_model.dart';

class CustomDropDownList extends StatefulWidget {
  final List<DropDownItemModel> list;
  final String label;
  DropDownItemModel? selectedValue;
  final Function(DropDownItemModel?) onChange;

  CustomDropDownList({super.key, required this.list, initialValueId, required this.label, required this.onChange}) {
    selectedValue = initialValueId != null
        ? list.firstWhere((e) => e.id == initialValueId)
        : list.first;

    if (initialValueId == null) {
      onChange(selectedValue);
    }
  }

  @override
  State<StatefulWidget> createState() => _CustomDropDownList();
}

class _CustomDropDownList extends State<CustomDropDownList> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.label),
            DropdownButton<DropDownItemModel>(
              value: widget.selectedValue,
              icon: const Icon(Icons.arrow_drop_down_outlined),
              elevation: 16,
              underline: Container(
                height: 2,
                color: Theme.of(context).primaryColor,
              ),
              onChanged: (DropDownItemModel? value) {
                setState(() {
                  widget.selectedValue = value;
                });
                widget.onChange(value);
              },
              items: widget.list.map<DropdownMenuItem<DropDownItemModel>>((value) {
                return DropdownMenuItem<DropDownItemModel>(
                  value: value,
                  child: Text(value.description),
                );
              }).toList(),
            )
          ],
        )
    );
  }
}