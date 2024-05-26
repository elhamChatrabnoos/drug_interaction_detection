import 'package:drug_intraction_detector_app/app/config/app_theme.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  final String hintText;
  final Icon? icon;
  final FormFieldValidator<dynamic>? validator;
  final dynamic value;
  final List<DropdownMenuItem<dynamic>>? items;
  final Function(dynamic)? onchange;

  const CustomDropDownButton({
    super.key,
    required this.items,
    required this.hintText,
    required this.onchange,
    this.icon,
    this.value,
    this.validator,
  });

  @override
  State<StatefulWidget> createState() => _BaBaDropDown();
}

class _BaBaDropDown extends State<CustomDropDownButton> {

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      style: const TextStyle(color: Colors.black),
      items: widget.items,
      value: widget.value,
      validator: widget.validator,
      onChanged: widget.onchange,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
              color: Colors.grey), // Adjust the border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
              color: Colors.grey), // Adjust the border color
        ),
        labelText: widget.hintText,
        labelStyle: TextStyle(fontSize: 12),
        contentPadding:
            const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        border: const OutlineInputBorder(),
        suffixIcon: widget.icon,
      ),
    );
  }
}
