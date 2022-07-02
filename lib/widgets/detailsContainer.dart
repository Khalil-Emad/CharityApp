import 'package:flutter/material.dart';

class detailsContainer extends StatefulWidget {
  final detailsCtrl;
  const detailsContainer({Key? key, required this.detailsCtrl})
      : super(key: key);

  @override
  State<detailsContainer> createState() => _detailsContainerState();
}

class _detailsContainerState extends State<detailsContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .9,
      height: size.height * .2,
      child: TextField(
        controller: widget.detailsCtrl,
        decoration: InputDecoration(
          labelText: 'Product Details',
        ),
        expands: true,
        minLines: null,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        maxLength: 200,
      ),
    );
  }
}
