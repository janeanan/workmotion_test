import 'dart:ui';
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            ),
            child: Center(
              child: TextButton(
                onPressed: widget.onTap,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: Text(widget.textBTN),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
