import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  const MyButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 148, 85, 80),
          borderRadius: BorderRadius.circular(40.00)),
      padding: const EdgeInsets.all(20.00),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10.00,
          ),
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
