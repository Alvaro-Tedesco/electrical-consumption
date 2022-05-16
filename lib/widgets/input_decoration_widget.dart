import 'package:electrical_comsuption/themes/app_colors.dart';
import 'package:electrical_comsuption/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputDecorationWidget extends StatelessWidget {
  final TextInputType? textInputType;
  final String? label;
  final List<TextInputFormatter>? inputFormatters;
  final bool passwordVisible;
  final VoidCallback? onPressed;
  final bool isPassword;
  final TextEditingController? controller;
  final TextStyle? style;

  const InputDecorationWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.textInputType,
    this.style,
    this.inputFormatters,
    this.onPressed,
    this.isPassword = false,
    this.passwordVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword ? !passwordVisible : false,
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      controller: controller,
      style: AppTextStyles.defaultStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20, right: isPassword ? 0 : 20),
        labelText: label,
        labelStyle: style ?? AppTextStyles.defaultStyleB,
        suffixIcon: isPassword
            ? Visibility(
                visible: isPassword,
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: onPressed,
                  ),
                ),
              )
            : null,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: AppColors.primary),
          borderRadius: BorderRadius.all(
            Radius.circular(80),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 5, color: AppColors.primary),
          borderRadius: BorderRadius.all(
            Radius.circular(80),
          ),
        ),
      ),
    );
  }
}
