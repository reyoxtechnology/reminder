import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
class EditProfileTile extends StatefulWidget {
  final Widget? icon;
  final String? title;
  final void Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final TextEditingController? controller;
  final bool? filled;
  final String? hintText;
  final Color? hintColor;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final double? cursorHeight;
  final String? labelText;
  final Color? textColor;
  final Color? cursorColor;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const EditProfileTile({Key? key, this.icon, this.title, this.onSaved, this.inputFormatters, this.focusedBorderColor, this.enabledBorderColor, this.controller, this.filled, this.hintText, this.hintColor, this.textInputAction, this.keyboardType, this.cursorHeight, this.labelText, this.textColor, this.cursorColor, this.validator, this.prefixIcon, this.suffixIcon}) : super(key: key);

  @override
  _EditProfileTileState createState() => _EditProfileTileState();
}

class _EditProfileTileState extends State<EditProfileTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: (){},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: 60, width: MediaQuery.of(context).size.width,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            widget.icon!, SizedBox(width: 20,), Text(widget.title!, style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w600, fontSize: 12),),
            Expanded(child: TextFormField(
              onSaved: widget.onSaved,
              inputFormatters: widget.inputFormatters,
              controller: widget.controller,
              textCapitalization: TextCapitalization.sentences,
              cursorHeight: widget.cursorHeight ?? 22.0,
              textInputAction: TextInputAction.next,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                border: InputBorder.none,
                  filled: widget.filled,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  isDense: true,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(color: widget.hintColor ?? AppTheme.grey, fontSize: 18, fontWeight: FontWeight.w400, fontFamily: "DMSans"),
                  contentPadding: EdgeInsets.all(15),
                  labelText: widget.labelText,
                  labelStyle:
                  TextStyle(color: widget.textColor ?? AppTheme.grey, fontSize: 12, fontFamily: 'Lato', fontWeight: FontWeight.w400)),
              cursorColor: widget.cursorColor ?? AppTheme.black,
              validator: widget.validator,
            ),),
            Icon(Icons.arrow_forward_ios, color: AppTheme.green, size: 20,),
          ],),
        ),
      ),
    );
  }
}
