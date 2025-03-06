import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../core/utils/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.focusNode,
    this.paddingTop = 0,
    this.label,
    this.controller,
    this.onTap,
    this.prefixIcon,
    this.readOnly,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText,
    this.isPassword = false,
    this.onChanged,
    this.fillColor,
    this.maxLines,
    this.minLines,
    this.textColor = Colors.white,
    required this.name,
    this.inputFormatters,
    this.height,
    this.hintSize,
    this.border,
    this.errorMessage,
    this.onSubmit,
    this.initialValue,
    this.validator,
  });

  final String? label;
  final String hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final bool? obscureText;
  final bool isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onTap;
  final Function(String? value)? onChanged;
  final Function(String? value)? onSubmit;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Color textColor;
  final int? maxLines;
  final int? minLines;
  final double paddingTop;
  final String name;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final double? height;
  final double? hintSize;
  final double? border;
  final String? errorMessage;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          FormBuilderTextField(
            name: widget.name,
            initialValue: widget.initialValue,
            focusNode: widget.focusNode,
            maxLines: widget.maxLines ?? 1,
            minLines: widget.maxLines ?? 1,
            textCapitalization: TextCapitalization.words,
            inputFormatters: widget.inputFormatters ?? [],
            validator: widget.validator ?? FormBuilderValidators.required(),
            keyboardType: widget.keyboardType,
            readOnly: widget.readOnly ?? false,
            obscureText: widget.isPassword ? isObscured : false,
            controller: widget.controller,
            onTap: widget.onTap,
            onChanged: widget.onChanged,
            cursorColor: Colors.white,
            onSubmitted: widget.onSubmit,
            style: TextStyle(color: widget.textColor),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: widget.paddingTop,
                left: 10,
                right: 10,
              ),
              prefixIcon: widget.prefixIcon,
              suffixIcon:
                  widget.isPassword
                      ? InkWell(
                        onTap: () {
                          setState(() {
                            isObscured = !isObscured;
                          });
                        },
                        borderRadius: BorderRadius.circular(6),
                        child:
                            isObscured
                                ? Transform.scale(
                                  scaleX: -1,
                                  child: const Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                                )
                                : const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                ),
                      )
                      : widget.suffixIcon,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: widget.hintSize ?? 17,
                color: cGrey,
              ),
              label:
                  widget.label != null
                      ? Text(
                        widget.label!,
                        style: const TextStyle(color: cGrey, fontSize: 13),
                      )
                      : null,
              filled: true,
              fillColor: widget.fillColor ?? Colors.transparent,
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: cPrimary),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: cGrey),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          widget.errorMessage != null
              ? const Padding(
                padding: EdgeInsets.only(left: 8.0, top: 4, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: Colors.red, size: 12),
                    SizedBox(width: 4),
                  ],
                ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}
