import 'package:flutter/material.dart';

class InputTextFormField extends TextFormField {
  InputTextFormField({
    super.key,
    String? label,
    super.minLines,
    super.maxLines,
    super.validator,
    super.inputFormatters,
    super.onSaved,
  }) : super(
          decoration: InputDecoration(
            label: (label != null) ? Text(label) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              gapPadding: 4,
            ),
          ),
        );
}
