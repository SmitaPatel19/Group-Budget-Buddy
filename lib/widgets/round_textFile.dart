
import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextAlign titleAlign;
  final bool obscureText;
  const RoundTextField(
      {super.key,
        required this.title,
        this.titleAlign = TextAlign.left,
        this.controller,
        this.keyboardType,
        this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: titleAlign,
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 48,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.blue,),
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            keyboardType: keyboardType,
            obscureText: obscureText,
          ),
        )
      ],
    );
  }
}
