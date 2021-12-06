import 'package:flutter/material.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';

class CustomButton extends StatelessWidget {
  final Color? decorationColor, borderColor, textColor;
  final Function()? onPressed;
  final String ? buttonText;
  final double? buttonRadius;
  final double? buttonHeight;
  final double? labelFontSize;
  final Color? buttonTextColor;
  final double? buttonWidth;
  const CustomButton({Key? key, this.decorationColor, this.borderColor, this.textColor, @required this.onPressed, this.buttonText, this.buttonRadius, this.buttonHeight, this.labelFontSize, this.buttonTextColor, this.buttonWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: buttonHeight ?? 45,
        width: buttonWidth ?? double.maxFinite,
        decoration: BoxDecoration(
            color: decorationColor ?? AppTheme.white,
            borderRadius: BorderRadius.all(Radius.circular(buttonRadius ?? 24.0)),
            border: Border.all(color: borderColor ?? AppTheme.white)),
        child: Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Material(
              color: Colors.transparent,
              child: Center(
                child: Text(
                  buttonText?? '',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontFamily: 'Inter', fontSize: labelFontSize ?? 16, fontWeight: FontWeight.w600, color: buttonTextColor ?? AppTheme.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}