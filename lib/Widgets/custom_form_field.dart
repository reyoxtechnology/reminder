//Custom FormField
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';

//Custom FormField
class CustomFormField extends StatelessWidget {
  final String? labelText;
  final Color? textColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? cursorColor;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final double? cursorHeight;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final double? height;
  final Color? backgroundColor;
  final double? width;
  final double? elevation;
  final bool? filled;
  final String? hintText;
  final Color? hintColor;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  const CustomFormField({Key? key, this.labelText, this.textColor, this.focusedBorderColor, this.enabledBorderColor, @required this.validator, this.cursorColor, this.prefixIcon, this.suffixIcon, this.keyboardType, this.textInputAction, this.cursorHeight, this.controller, this.height, this.backgroundColor, this.width, this.elevation, this.inputFormatters, this.filled, this.onSaved, this.hintText, this.hintColor, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28))),
      elevation: elevation ?? 3,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(28), color: backgroundColor ?? AppTheme.white,),
        width: width ?? double.maxFinite, height: height ?? 66,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 5),
          child: TextFormField(
            onChanged: onChanged,
            onSaved: onSaved,
            inputFormatters: inputFormatters,
            controller: controller,
            textCapitalization: TextCapitalization.sentences,
            cursorHeight: cursorHeight ?? 22.0,
            textInputAction: TextInputAction.next,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                filled: filled,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: enabledBorderColor ?? AppTheme.black, width: 0.7)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: focusedBorderColor ?? AppTheme.black, width: 0.7)),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                isDense: true,
                hintText: hintText,
                hintStyle: TextStyle(color: hintColor ?? AppTheme.grey, fontSize: 18, fontWeight: FontWeight.w400, fontFamily: "DMSans"),
                contentPadding: EdgeInsets.all(15),
                labelText: labelText,
                labelStyle:
                TextStyle(color: textColor ?? AppTheme.grey, fontSize: 12, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
            cursorColor: cursorColor ?? AppTheme.black,
            validator: validator,
          ),
        ),
      ),
    );
  }
}

//Password FormField
class CustomPasswordFormField extends StatefulWidget {
  final String? labelText;
  final Color? textColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? cursorColor;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final double? cursorHeight;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double? elevation;
  final String? hintText;
  final Color? hintColor;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  const CustomPasswordFormField({Key? key, this.labelText, this.textColor, this.focusedBorderColor, this.enabledBorderColor, @required this.validator, this.cursorColor, this.prefixIcon, this.keyboardType, this.textInputAction, this.cursorHeight, this.controller, this.width, this.height, this.backgroundColor, this.elevation, this.inputFormatters, this.hintText, this.hintColor, this.onChanged}) : super(key: key);

  @override
  _CustomPasswordFormFieldState createState() => _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28))),
      elevation: widget.elevation ?? 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: widget.backgroundColor ?? AppTheme.white,
        ),
        height: widget.height ?? 66,
        width: widget.width ?? double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,top: 5),
          child: TextFormField(
            onChanged: widget.onChanged,
            inputFormatters: widget.inputFormatters,
            controller: widget.controller,
            textCapitalization: TextCapitalization.sentences,
            obscureText: isObscured,
            cursorHeight: widget.cursorHeight ?? 22.0,
            textInputAction: TextInputAction.done,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                    borderSide: BorderSide(color: widget.enabledBorderColor ?? AppTheme.black, width: 0.7)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                    borderSide: BorderSide(color: widget.focusedBorderColor ?? AppTheme.black, width: 0.7)),
                prefixIcon: widget.prefixIcon,
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  icon: Icon(
                    isObscured ? Icons.visibility_off : Icons.visibility, size: 20, color: AppTheme.grey,),
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(15),
                hintText: widget.hintText,
                labelText: widget.labelText,
                hintStyle: TextStyle(color: widget.hintColor ?? AppTheme.grey, fontSize: 18, fontWeight: FontWeight.w400, fontFamily: "DMSans"),
                labelStyle:
                TextStyle(color: widget.textColor ?? AppTheme.grey, fontSize: 12, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
            cursorColor: widget.cursorColor ?? AppTheme.black,
            validator: widget.validator,
          ),
        ),
      ),
    );
  }
}
