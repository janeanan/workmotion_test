import 'package:flutter/material.dart';

class MyBTN extends StatefulWidget {
  final String textBTN;
  final Function() onTap;

  const MyBTN({super.key, required this.textBTN, required this.onTap});

  @override
  State<MyBTN> createState() => _MyBTNState();
}

class _MyBTNState extends State<MyBTN> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber,
        ),
        child: TextButton(onPressed: widget.onTap, child: Text(widget.textBTN)),
      ),
    );
  }
}
