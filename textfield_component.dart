import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';

class TextfieldComponent extends StatelessWidget {
  
  String hent;
  String text;
  int maxlen=1;
  final TextEditingController controller; 
TextfieldComponent(this.text,this.hent,this
.controller);
  @override
  Widget build(BuildContext context) {
        final wid=MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wid*.12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(text,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.whiteColor),),
        SizedBox(height: 5,),
        TextFormField(
          controller:controller ,
          style: TextStyle(fontSize: 16.2,color: Colors.white),
          maxLines: maxlen,
          decoration: InputDecoration(
          hintText: hent,
          
          hintStyle: TextStyle(
            color: AppColors.hentColor,
            fontSize: 16,fontWeight: FontWeight.w400,
          ),
      
          fillColor: AppColors.textFiledColor,
          filled: true,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),)
      
      
      
      ],),
    );
  }
}