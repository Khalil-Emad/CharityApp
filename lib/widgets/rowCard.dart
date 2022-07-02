import 'package:flutter/material.dart';

class RowCard extends StatefulWidget {
  final String num;
  final String price;
  final Color color;
  RowCard(
      {Key? key, required this.num, required this.color, required this.price})
      : super(key: key);

  @override
  State<RowCard> createState() => RowCardState();
}

class RowCardState extends State<RowCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 15, bottom: 25, top: 30),
      height: size.height * .25,
      width: size.width * .4,
      decoration: BoxDecoration(
          color: widget.color,
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${widget.num} MEAL',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 45, 80),
                  fontSize: 22),
            ),
            Row(
              children: <Widget>[
                Text(
                  "${widget.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 2, 45, 80),
                      fontSize: 22),
                ),
                Text(
                  "/ a day",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: size.height * 0.06,
                width: size.width * 0.3,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    color: Colors.white),
                padding: const EdgeInsets.all(1),
                child: Text(
                  "View Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
