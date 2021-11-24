import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
class CustomPictureButton extends StatelessWidget {
  final String? image;
  final String? btnTitle;
  final void Function()? onTap;
  final double? elevation;
  const CustomPictureButton({Key? key, this.image, this.btnTitle, this.onTap, this.elevation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(onTap: onTap,
          child: Card(elevation: elevation ?? 2, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(padding: const EdgeInsets.all(5.0),
              child: Container( width: 119, height: 94, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.asset(image!, fit: BoxFit.cover,),),),),),
        SizedBox(height: 10,),
        Text(btnTitle!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, fontFamily: "DMSans", color: AppTheme.black),),
      ],
    );
  }
}
