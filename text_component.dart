import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';

class TextComponent extends StatelessWidget {
  String text;
   TextComponent( this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 24,fontWeight: FontWeight.w700,
        
      ),
      
    );
  }
}