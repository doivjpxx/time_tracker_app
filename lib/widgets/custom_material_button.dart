import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final Widget child;
  final double height;
  final Color color;
  final double borderRadius;
  final Function()? onPressed;

  const CustomMaterialButton(
      {super.key,
      required this.child,
      required this.color,
      this.borderRadius = 4.0,
      required this.onPressed,
      this.height = 50.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: MaterialButton(
        disabledColor: Colors.grey.shade400,
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
