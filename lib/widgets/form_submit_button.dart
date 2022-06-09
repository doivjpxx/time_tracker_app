import 'package:flutter/material.dart';
import 'package:time_tracker/widgets/custom_material_button.dart';

class FormSubmitButton extends CustomMaterialButton {
  FormSubmitButton({
    super.key,
    required String text,
    required Color color,
    Function()? onPressed,
  }) : super(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          color: color,
          onPressed: onPressed,
          height: 44.0,
        );
}
