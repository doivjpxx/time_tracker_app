import 'package:flutter/material.dart';
import 'package:time_tracker/widgets/custom_material_button.dart';

class SignInButton extends CustomMaterialButton {
  final String imageLink;

  SignInButton({
    super.key,
    required String text,
    required Color color,
    required Color textColor,
    this.imageLink = '',
    required Function() onPressed,
  })  : assert(text != ''),
        super(
          color: color,
          height: 50.0,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              imageLink != ''
                  ? Image.asset(imageLink)
                  : const SizedBox(
                      width: 30.0,
                    ),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 15.0),
              ),
              const Opacity(
                opacity: 0,
                child: SizedBox(
                  width: 30.0,
                ),
              )
            ],
          ),
        );
}
