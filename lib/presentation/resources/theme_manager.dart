
import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/font_manager.dart';
import 'package:tut_app/presentation/resources/styles_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    //main color
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.gery1,
    splashColor: ColorManager.lightPrimary,

     //card theme
    cardTheme : CardTheme(
      color: ColorManager.white,
    elevation: AppSize.s4,
    shadowColor: ColorManager.gery,),

    //appBar
    appBarTheme: AppBarTheme(
      color: ColorManager.primary,
      shadowColor: ColorManager.lightPrimary,
      elevation: AppSize.s4,
      centerTitle: true,
      foregroundColor: ColorManager.white,
      titleTextStyle: semiBoldTextStyle(color: ColorManager.white,fontSize:FontSizeManager.s16 )
    ),
    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.gery1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary
    ),
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: regularTextStyle(
          color: ColorManager.white,fontSize: FontSizeManager.s17
        ),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)
        ),
      ),
    ),
    //text theme
    textTheme: TextTheme(
      displayLarge: semiBoldTextStyle(color: ColorManager.darkGery,fontSize: FontSizeManager.s16),
      headlineLarge: semiBoldTextStyle(color: ColorManager.darkGery,fontSize: FontSizeManager.s16),
      headlineMedium: regularTextStyle(color: ColorManager.darkGery,fontSize: FontSizeManager.s16),
      titleMedium: mediumTextStyle(color: ColorManager.primary,fontSize: FontSizeManager.s16),
      bodyLarge: regularTextStyle(color: ColorManager.gery,),
      bodySmall : regularTextStyle(color: ColorManager.gery1,),
    ),
    //inputDecorationTheme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: regularTextStyle(color: ColorManager.gery,fontSize: FontSizeManager.s16),
      labelStyle:mediumTextStyle(color: ColorManager.gery,fontSize: FontSizeManager.s16),
      errorStyle:regularTextStyle(color: ColorManager.error,),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(
          color: ColorManager.gery,
          width: AppSize.s1_5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
      ),
    )


  );
}