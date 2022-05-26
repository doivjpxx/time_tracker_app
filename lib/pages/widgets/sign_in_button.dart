import 'package:flutter/material.dart';
import 'package:time_tracker/widgets/custom_material_button.dart';

class SignInButton extends CustomMaterialButton {
  SignInButton({
    super.key,
    required String text,
    required Color color,
    required Color textColor,
    required Function() onPressed,
  }) : super(
          color: color,
          height: 40.0,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 15.0),
          ),
        );
}
