import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String label;
  final IconData iconName;
  final TextInputType textInputType;

  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.label,
    required this.iconName,
    required this.textInputType
  });

  @override
  State<StatefulWidget> createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label),
          TextField(
            controller: widget.textEditingController,
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
              icon: Icon(widget.iconName),
            )
          )
        ],
      )
    );
  }

}