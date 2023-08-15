import 'package:flutter/cupertino.dart';

// App Text Widget
Widget appText(
    {String? title,
    FontWeight? fontWeight,
    double? fontSize,
    double? letterSpacing,
    FontStyle? fontStyle,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    double? height,
    decoration,
    String? fontFamily,
    TextOverflow? textOverflow}) {
  return Text(title ?? '',
      textAlign: textAlign,
      style: TextStyle(
          height: height,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          decoration: decoration ?? TextDecoration.none),
      maxLines: maxLines,
      overflow: textOverflow ?? TextOverflow.ellipsis);
}
