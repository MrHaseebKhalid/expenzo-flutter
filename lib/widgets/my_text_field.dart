import "package:expenzo/screens/auth/provider/auth_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:provider/provider.dart";
import "../base/resizer/fetch_pixels.dart";
import "../resources/resources.dart";

class MyTextField extends StatelessWidget {
  final bool showButton;
  final bool moveNext;
  final int? eyeIconNumber;
  final int? eyeIconAllowNumber;
  final String? prefixSvgIconPath;
  final Color? prefixSvgIconColor;
  final double? prefixSvgIconSize;
  final double? textFormFieldWidth;
  final VoidCallback? onTapEyeButton;
  final ValueChanged<String>? onChanged;
  final String? showText;
  final FormFieldSetter<String>? onSaved;
  final TextEditingController? controller;
  final BuildContext context;
  final FormFieldValidator<String> validator;

  const MyTextField({
    super.key,
    this.showButton = false,
    this.moveNext = true,
    this.eyeIconNumber,
    this.eyeIconAllowNumber,
    this.prefixSvgIconPath,
    this.prefixSvgIconColor,
    this.prefixSvgIconSize,
    this.textFormFieldWidth,
    this.onTapEyeButton,
    this.onChanged,
    this.showText,
    this.onSaved,
    this.controller,
    required this.context,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<AuthProvider, (bool, bool)>(
      selector: (context, authProvider) {
        bool? item1Value;
        bool? item2Value;
        if (eyeIconNumber == 1) {
          item1Value = authProvider.eyeButton1;
        } else if (eyeIconNumber == 2) {
          item1Value = authProvider.eyeButton2;
        } else if (eyeIconNumber == 3) {
          item1Value = authProvider.eyeButton3;
        } else if (eyeIconNumber == 4) {
          item1Value = authProvider.eyeButton4;
        } else if (eyeIconNumber == 5) {
          item1Value = authProvider.eyeButton5;
        } else {
          item1Value = false;
        }
        if (eyeIconAllowNumber == 1) {
          item2Value = authProvider.eyeButtonAllow1;
        } else if (eyeIconAllowNumber == 2) {
          item2Value = authProvider.eyeButtonAllow2;
        } else if (eyeIconAllowNumber == 3) {
          item2Value = authProvider.eyeButtonAllow3;
        } else if (eyeIconAllowNumber == 4) {
          item2Value = authProvider.eyeButtonAllow4;
        } else if (eyeIconAllowNumber == 5) {
          item2Value = authProvider.eyeButtonAllow5;
        } else {
          item2Value = false;
        }
        return (item1Value, item2Value);
      },
      builder: (context, data, child) {
        final (eyeIconBool, iconAllowBool) = data;
        return SizedBox(
          width: FetchPixels.getPixelWidth(textFormFieldWidth ?? 350.0),
          height: FetchPixels.getPixelHeight(60),

          child: TextFormField(
            onChanged: onChanged,
            controller: controller,
            maxLines: 1,
            obscureText: eyeIconBool,

            textAlign: TextAlign.start,
            validator: validator,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            textInputAction: (moveNext) ? TextInputAction.next : null,
            style: R.textStyle.regularInter().copyWith(fontSize: 14),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: (prefixSvgIconPath != null)
                  ? Padding(
                      padding: EdgeInsets.all(FetchPixels.getPixelHeight(12)),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: FetchPixels.getPixelHeight(10),
                        ),
                        child: SvgPicture.asset(
                          prefixSvgIconPath!,
                          height: FetchPixels.getPixelHeight(
                            prefixSvgIconSize ?? 16,
                          ),
                          colorFilter: (prefixSvgIconColor != null)
                              ? ColorFilter.mode(
                                  prefixSvgIconColor!,
                                  BlendMode.srcIn,
                                )
                              : null,
                        ),
                      ),
                    )
                  : null,
              suffixIcon: (showButton)
                  ? Padding(
                      padding: EdgeInsets.only(
                        right: FetchPixels.getPixelWidth(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: IconButton(
                          onPressed: (iconAllowBool) ? onTapEyeButton : null,
                          icon: (iconAllowBool)
                              ? ((eyeIconBool)
                                    ? SvgPicture.asset(
                                        R.icons.eyeOffIcon,
                                        width: FetchPixels.getPixelWidth(20),
                                        height: FetchPixels.getPixelHeight(20),
                                        colorFilter: ColorFilter.mode(
                                          R.colors.textColor,
                                          BlendMode.srcIn,
                                        ),
                                      )
                                    : SvgPicture.asset(
                                        R.icons.eyeIcon,
                                        width: FetchPixels.getPixelWidth(15),
                                        height: FetchPixels.getPixelHeight(15),
                                        colorFilter: ColorFilter.mode(
                                          R.colors.textColor,
                                          BlendMode.srcIn,
                                        ),
                                      ))
                              : SvgPicture.asset(
                                  R.icons.eyeOffIcon,
                                  width: FetchPixels.getPixelWidth(20),
                                  height: FetchPixels.getPixelHeight(20),
                                ),
                        ),
                      ),
                    )
                  : null,
              enabledBorder: R.decoration.enabledBorder,
              focusedBorder: R.decoration.focusedBorder,
              errorBorder: R.decoration.errorBorder,
              focusedErrorBorder: R.decoration.errorBorder,

              filled: true,
              fillColor: R.colors.lightGreyColor,

              hintText: showText,
              hintStyle: R.textStyle.regularInter().copyWith(
                color: R.colors.hintTextColor,
                fontSize: 14,
              ),
            ),
            onSaved: onSaved,
          ),
        );
      },
    );
  }
}

// Provider side code :
//
// void changeEyeIcon({required int number}) {
//   if (number == 1) eyeButton1 = !eyeButton1;
//   if (number == 2) eyeButton2 = !eyeButton2;
//   if (number == 3) eyeButton3 = !eyeButton3;
//   if (number == 4) eyeButton4 = !eyeButton4;
//   if (number == 5) eyeButton5 = !eyeButton5;
//   update();
// }
//
// void changeEyeIconAllow({required int number, required bool value}) {
//   if (number == 1) eyeButtonAllow1 = value;
//   if (number == 2) eyeButtonAllow2 = value;
//   if (number == 3) eyeButtonAllow3 = value;
//   if (number == 4) eyeButtonAllow4 = value;
//   if (number == 5) eyeButtonAllow5 = value;
//   update();
// }
