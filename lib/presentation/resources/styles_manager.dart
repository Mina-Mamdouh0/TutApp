

import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize,Color color,FontWeight fontWeight){
  return TextStyle(
    fontSize: fontSize,
    color:color ,
    fontWeight:fontWeight ,
    fontFamily: FontConstant.fontFamily
  );
}

//bold
TextStyle boldTextStyle({double fontSize =FontSizeManager.s12,required Color color}){
  return _getTextStyle(fontSize, color, FontWeightManager.bold);
}

//semiBold
TextStyle semiBoldTextStyle({double fontSize =FontSizeManager.s12,required Color color}){
  return _getTextStyle(fontSize, color, FontWeightManager.semiBold);
}

//medium
TextStyle mediumTextStyle({double fontSize =FontSizeManager.s12,required Color color}){
  return _getTextStyle(fontSize, color, FontWeightManager.medium);
}

//regular
TextStyle regularTextStyle({double fontSize =FontSizeManager.s12,required Color color}){
  return _getTextStyle(fontSize, color, FontWeightManager.regular);
}

//light
TextStyle lightTextStyle({double fontSize =FontSizeManager.s12,required Color color}){
  return _getTextStyle(fontSize, color, FontWeightManager.light);
}