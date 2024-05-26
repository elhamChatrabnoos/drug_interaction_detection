import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,
    this.onTap,
    this.readOnly,
    this.prefixText,
    this.onChanged,
    this.icon,
    this.correctFormat,
    this.obscureText,
    this.onTapIcon,
    this.hintText,
    this.initialValue,
    this.inputFormatters,
    this.checkValidation,
    this.fillColor,
    this.borderColor,
    this.labelText,
    this.borderRaduis,
    this.keyboardType,
    this.controller,
    this.fontSize,
    this.width,
    this.padding,
    this.height,
    this.suffixText,
    this.contentPadding,
    required this.enableBorder,
    this.fontWeight,
    this.textAlign,
    this.textColor,
    this.prefix,
    this.hintColor,
    this.margin,
    this.autofocus,
    this.prefixIcon,
    this.globalKey,
    this.maxLength,
    this.suffix,
    this.focusColor,
    this.suffixIcon,
    this.hintStyle,
    this.cursorColor,
    this.prefixStyle,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.textDirection,
    this.fixFieldLeftToRight,
    this.focusNode,
    this.textAlignVertical = TextAlignVertical.center,
    this.onFieldSubmitted, this.labelStyle, this.maxLines})
      : super(key: globalKey);

  final Function(String?)? onChanged;
  final Function()? onTapIcon;
  final bool? obscureText;
  final Icon? icon;
  final bool? correctFormat;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? value)? checkValidation;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderRaduis;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? padding;
  final int? maxLength;
  final String? suffixText;
  final EdgeInsetsGeometry? contentPadding;
  final bool enableBorder;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? textColor;
  final Color? hintColor;
  final Color? focusColor;
  final Widget? prefix;
  final double? margin;
  final bool? autofocus;
  final Widget? prefixIcon;
  final Widget? suffix;
  final GlobalKey? globalKey;
  final String? prefixText;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final bool? readOnly;
  final TextStyle? hintStyle;
  final Color? cursorColor;
  final TextStyle? prefixStyle;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final TextDirection? textDirection;
  final bool? fixFieldLeftToRight;
  final FocusNode? focusNode;
  final TextAlignVertical textAlignVertical;
  final VoidCallback? onFieldSubmitted;
  final TextStyle? labelStyle;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin ?? 0),
      alignment: Alignment.center,
      height: height,
      width: width,
      child: _buildTextFormField(context),
    );
  }

  TextFormField _buildTextFormField(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      focusNode: focusNode,
      readOnly: readOnly ?? false,
      onTap: onTap,
      key: globalKey,
      cursorColor: cursorColor,
      autofocus: autofocus ?? false,
      textAlignVertical: textAlignVertical,
      textAlign: textAlign ?? TextAlign.start,
      autovalidateMode: AutovalidateMode.disabled,
      style: TextStyle(
          fontSize: fontSize ?? 12, fontWeight: fontWeight, color: textColor),
      keyboardType: keyboardType,
      controller: controller,
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      onChanged: onChanged,
      validator: checkValidation,
      onFieldSubmitted: (value) =>
      onFieldSubmitted != null ? onFieldSubmitted!() : null,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        prefixIconConstraints: prefixIconConstraints,
        focusColor: focusColor ?? Colors.grey,
        isDense: true,
        contentPadding: contentPadding,
        suffixText: suffixText,
        suffix: suffix,
        suffixIconConstraints: suffixIconConstraints,
        labelText: labelText,
        labelStyle: labelStyle,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyle(color: hintColor),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: enableBorder ? 1 : 0, color: borderColor ?? Colors.grey),
            borderRadius: BorderRadius.circular(borderRaduis ?? 12)),
        border: InputBorder.none,
        filled: true,
        fillColor: fillColor ?? Theme
            .of(context)
            .scaffoldBackgroundColor,
        suffixIcon: suffixIcon ??
            InkWell(onTap: onTapIcon, child: icon ?? const SizedBox()),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: enableBorder ? Colors.red : fillColor ?? Colors.grey,
            ),
            borderRadius: BorderRadius.circular(borderRaduis ?? 10)),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1, color: enableBorder ? Colors.red : Colors.transparent),
          borderRadius: BorderRadius.circular(borderRaduis ?? 10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRaduis ?? 10),
          borderSide: BorderSide(
            color: borderColor ?? const Color.fromARGB(190, 145, 141, 141),
            width: 1,
          ),
        ),
        prefix: prefix,
        prefixStyle: prefixStyle,
        // contentPadding: EdgeInsets.symmetric(vertical: padding ?? 0),
      ),
      obscureText: obscureText != null ? obscureText! : false,
      maxLength: maxLength,
    );
  }
}
