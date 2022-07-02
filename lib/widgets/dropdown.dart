import 'package:flutter/material.dart';

class dropDownContainer extends StatefulWidget {
  final TextEditingController quantityCtrl;
  final List<String> quantity;
  const dropDownContainer({Key? key,required this.quantityCtrl,required this.quantity}) : super(key: key);

  @override
  State<dropDownContainer> createState() => _dropDownContainerState();
}

class _dropDownContainerState extends State<dropDownContainer> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.quantityCtrl.text,
      isExpanded: true,
      onChanged: (String? value) {
        setState(() {
          widget.quantityCtrl.text = value!;
        });
      },
      validator: (String? value) {
        if (value == null) {
          return "Required";
        } else {
          return null;
        }
      },
      items: widget.quantity.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
          ),
        );
      }).toList(),
    );
  }
}
