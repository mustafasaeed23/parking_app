import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_app/core/theme/Colors.dart';
import 'package:parking_app/core/theme/Styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool? obscureText;
  final bool? autofocus;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final bool? readOnly;
  final bool? showCursor;
  final TextStyle? hintStyle;
  final Color? textColor;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final autofillHints;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  final bool? expands;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? textSize;
  final TextAlign? textAlign;
  final FontWeight? textWeight;
  final FocusNode? focusNode;
  final InputBorder? errorBorder;
  final bool isTextDirectionReversed;
  final void Function()? onEditingComplete;
  const CustomTextFormField(
      {super.key,
      this.controller,
      this.onEditingComplete,
      this.isTextDirectionReversed = false,
      this.textAlign,
      this.padding,
      this.textColor,
      this.textWeight,
      this.textSize,
      this.hintStyle,
      this.hintText,
      this.labelText,
      this.backgroundColor,
      this.helperText,
      this.borderColor,
      this.borderWidth,
      this.errorText,
      this.obscureText = false,
      this.autofocus = false,
      this.autocorrect = true,
      this.enableSuggestions = true,
      this.readOnly = false,
      this.showCursor,
      this.maxLength,
      this.keyboardType,
      this.textInputAction,
      this.onChanged,
      this.validator,
      this.borderRadius,
      this.onSaved,
      this.inputFormatters,
      this.prefixIcon,
      this.suffixIcon,
      this.enabled,
      this.autofillHints,
      this.contentPadding,
      this.expands,
      this.maxLines,
      this.minLines,
      this.onFieldSubmitted,
      this.buildCounter,
      this.scrollPhysics,
      this.onTap,
      this.errorBorder,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        cursorColor: textColor ?? AppColors.blackColor,
        onEditingComplete: onEditingComplete,
        textAlign: textAlign ?? TextAlign.end,
        style: getBoldWhite15Style().copyWith(
          color: AppColors.blackColor,
          fontSize: 12.sp,
        ),
        autofillHints: autofillHints,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        autovalidateMode: AutovalidateMode.onUnfocus,
        controller: controller,
        obscureText: obscureText!,
        autofocus: autofocus!,
        autocorrect: autocorrect!,
        enableSuggestions: enableSuggestions!,
        readOnly: readOnly!,
        showCursor: showCursor,
        maxLength: maxLength,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onChanged: onChanged,
        validator: validator,
        onSaved: onSaved,
        textDirection: TextDirection.rtl,
        inputFormatters: inputFormatters,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          errorStyle: getBoldWhite15Style().copyWith(color: Colors.red),
          labelStyle: hintStyle,
          fillColor: backgroundColor ?? Colors.transparent,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: borderWidth == null
                ? BorderSide.none
                : BorderSide(
                    color: Colors.black,
                    width: borderWidth!,
                  ),
            borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          ),
          border: OutlineInputBorder(
            borderSide: borderWidth == null
                ? BorderSide.none
                : BorderSide(
                    color: Colors.black,
                    width: borderWidth!,
                  ),
            borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          ),

          ///on error
          errorBorder: errorBorder ??
              OutlineInputBorder(
                borderSide: borderWidth == null
                    ? BorderSide.none
                    : BorderSide(
                        color: Colors.white,
                        width: borderWidth!,
                      ),
                borderRadius: borderRadius ?? BorderRadius.circular(10.r),
              ),

          ///wna dayes 3leeh
          focusedBorder: OutlineInputBorder(
            borderSide: borderWidth == null
                ? BorderSide.none
                : BorderSide(
                    color: Colors.white,
                    width: borderWidth!,
                  ),
            borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: borderWidth == null
                ? BorderSide.none
                : BorderSide(
                    color: borderColor ?? Colors.grey.shade500,
                    width: borderWidth!,
                  ),
            borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          ),
          labelText: labelText,
          hintStyle: hintStyle,
          hintText: hintText,
          helperText: helperText,
          errorText: errorText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabled: enabled ?? true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        ),
        expands: expands ?? false,
        maxLines: maxLines ?? 1,
        minLines: minLines,
        onFieldSubmitted: onFieldSubmitted,
        scrollPhysics: scrollPhysics,
        onTap: onTap,
        focusNode: focusNode,
      ),
    );
  }
}
