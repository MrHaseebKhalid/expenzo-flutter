import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:pinput/pinput.dart";
import "../../resources/resources.dart";
import "fetch_pixels.dart";

// To add Vertical Space:
Widget getVerSpace(double value) {
  return SizedBox(height: FetchPixels.getPixelHeight(value));
}

// To add horizontal Space:
Widget getHorSpace(double value) {
  return SizedBox(width: FetchPixels.getPixelWidth(value));
}

Widget simpleText(
  String text, {
  TextStyle? style,
  bool? softWrap,
  int? maxLines,
  TextOverflow? overflow,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textScaler: TextScaler.linear(FetchPixels.getTextScale()),
    style: style ?? R.textStyle.regularInter(),
    softWrap: softWrap,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
  );
}

Widget getSimpleRichText(List<InlineSpan> children) {
  return RichText(
    textScaler: TextScaler.linear(FetchPixels.getTextScale()),

    text: TextSpan(style: R.textStyle.regularInter(), children: children),
  );
}

Widget getTextFieldText(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.only(left: FetchPixels.getPixelWidth(10)),
      child: Text(
        text,
        textScaler: TextScaler.linear(FetchPixels.getTextScale()),
        style: R.textStyle.mediumInter().copyWith(fontSize: 14),
      ),
    ),
  );
}

Widget getSignOptions(String svgImagePath, {GestureTapCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(4),
      alignment: Alignment.center,
      width: FetchPixels.getPixelWidth(50),
      height: FetchPixels.getPixelHeight(50),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: BoxBorder.all(color: R.colors.primaryColor, width: 2.0),
      ),
      child: SvgPicture.asset(svgImagePath, alignment: Alignment.center),
    ),
  );
}

PinTheme getPinTheme({Color? color}) {
  return PinTheme(
    height: FetchPixels.getPixelHeight(55.74),
    width: FetchPixels.getPixelWidth(55.74),
    textStyle: R.textStyle.semiBoldInter().copyWith(
      fontSize: 22,
      color: R.colors.secondaryColor,
    ),
    decoration: BoxDecoration(
      border: BoxBorder.all(
        color: color ?? R.colors.primaryColor,
        width: (color == null) ? 2 : 3,
      ),
      borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(12.0)),
    ),
  );
}

Widget circularIcon({
  required String iconPath,
  required GestureTapCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,

    child: Padding(
      padding: EdgeInsets.all(FetchPixels.getPixelWidth(5)),
      child: Container(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(8)),
        height: FetchPixels.getPixelHeight(40),
        width: FetchPixels.getPixelWidth(40),
        decoration: BoxDecoration(
          color: R.colors.lightGreyColor,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(iconPath),
      ),
    ),
  );
}
