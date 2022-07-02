import 'package:flutter/material.dart';

class textfieldContainer extends StatefulWidget {
  final nameCtrl;
  const textfieldContainer({Key? key,required this.nameCtrl}) : super(key: key);

  @override
  State<textfieldContainer> createState() => _textfieldContainerState();
}

class _textfieldContainerState extends State<textfieldContainer> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product name',
      ),
      keyboardType: TextInputType.text,
      controller:widget.nameCtrl,
      validator: (value) {
        return (value!.isEmpty) ? 'Required' : null;
      },
    );
  }
}
