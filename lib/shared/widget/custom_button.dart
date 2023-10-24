import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../consatant/ColorConstant.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double height;
  final double width;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? fontColor;
  final Color? borderColor;

  const CustomButton(this.text, this.onTap,
      {this.height = 45, this.width = double.infinity, this.fontSize= 20,
        this.backgroundColor = CustomColor.primaryGreen,this.fontColor = CustomColor.white,this.borderColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(8),
      color: backgroundColor,
      child: InkWell(
        onTap: () {
          Timer(const Duration(milliseconds: 300), (){
            onTap();
          });
        },
        borderRadius: BorderRadius.circular(8),
        splashColor: CustomColor.clickColor,
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: borderColor!),borderRadius: BorderRadius.circular(8)),
            height: height,
            width: width,
            child: Center(
                child: Text(text,
                    style: TextStyle(color: fontColor,fontSize: fontSize,fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center))),
      ),
    );
  }
}
