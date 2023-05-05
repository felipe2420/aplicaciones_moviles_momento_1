
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final TextEditingController textEditingController;
  final String label;

  const CustomDatePicker({super.key, required this.textEditingController, required this.label});

  @override
  State<StatefulWidget> createState() => _CustomDatePicker();
}

class _CustomDatePicker extends State<CustomDatePicker> {

  @override
  void initState() {
    widget.textEditingController.text = "";
    super.initState();
  }

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
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  String formattedDate = DateFormat('yMMMMd').format(pickedDate);
                  setState(() {
                    widget.textEditingController.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
            )
          ],
        )
    );
  }
}