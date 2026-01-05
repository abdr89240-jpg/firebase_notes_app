import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
class ContainerComponent extends StatelessWidget {
  String text;
  final double? width;
  final double? height;


  ContainerComponent(this.text,this.width,this.height);

  @override
  Widget build(BuildContext context) {
    
    
    return Container(
      
      alignment: Alignment.center,
      width: width,
      height: height,
      
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(5),
    
    
      ),child: Text(text,style: TextStyle(color: AppColors.textcontainer,fontSize: 16,fontWeight: FontWeight.w600),),
    
    
    );
  }
}