import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../app/config/app_size.dart';
import '../../../../app/global_widgets/custom_text_field.dart';

class DateField extends StatelessWidget {
  const DateField({super.key, required this.hintText, required this.textController});

  final String hintText;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onTap: () async {
        DateTime? date = await showDatePicker(
          context: context,
          firstDate: DateTime(2021),
          lastDate: DateTime(2035),
        );

        if (date != null) {
          textController.text =
              DateFormat('yyyy-MM-dd').format(date);
        }
      },
      readOnly: true,
      controller: textController,
      enableBorder: true,
      labelText: hintText,
      labelStyle: const TextStyle(fontSize: AppSize.medium_1),
      width: 300,
    );
  }
}
