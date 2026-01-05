import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:intl/intl.dart';

class ContComp extends StatelessWidget {
  String tit;
  String des;
  final String trea;
  VoidCallback cc;
  ContComp(this.tit,this.des,this.trea,this.cc);
  

  @override
  Widget build(BuildContext context) {
        final hei = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: cc,
      child: Column(
        children: [
          SizedBox(height:20),
          Container(
            decoration: BoxDecoration(
            color: AppColors.colorcard,
            borderRadius: BorderRadius.circular(12)
      
            ),
            padding: EdgeInsets.all(10),
            width: wid*.9,
            height: hei*.1,
          
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(tit,style: TextStyle(color: AppColors.titlecolor),),
                ),
                SizedBox(height: 3,),
                FittedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(des,style: TextStyle(color: AppColors.subtitlecolor,fontSize: 14),),
                      ),
                      SizedBox(width: wid*.50,),
                      Text(trea,style: TextStyle(color: AppColors.subtitlecolor),),
                    ],
                  ),
                ),
      
              ],
      
            ),
          )
      
          
      
        ],
      ),
    );
  }
}