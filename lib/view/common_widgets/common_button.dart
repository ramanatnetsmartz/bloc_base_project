import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final Color color;
  final Widget text;
  final Function onTap;

  const CommonButton({
    Key? key,
    required this.color,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: text,
    );
  }
}