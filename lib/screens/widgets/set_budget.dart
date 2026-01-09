import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/widgets/my_app_bar.dart";
import "package:expenzo/widgets/my_text_field.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "../../resources/resources.dart";

class SetBudget extends StatelessWidget {
  const SetBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: FetchPixels.getPixelHeight(20),
              horizontal: FetchPixels.getPixelWidth(25),
            ),
            child: Column(
              children: [
                getVerSpace(40),
                MyAppBar(titleText: "Set Budget", titleFontSize: 19),
                getVerSpace(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    simpleText("Set your first budget to continue to app."),
                    getHorSpace(5),
                    SvgPicture.asset(R.icons.walletIcon),
                  ],
                ),
                getVerSpace(30),
                getTextFieldText("Total budget"),
                getVerSpace(10),
                MyTextField(
                  context: context,
                  prefixSvgIconPath: R.icons.priceTagIcon,
                  prefixSvgIconColor: R.colors.iconColor,
                  prefixSvgIconSize: 22,
                  showText: "e.g., \$3400",
                  validator: (value) {},
                ),

                getVerSpace(40),
                Row(
                  children: [
                    simpleText(
                      "Sub Categories",
                      style: R.textStyle.boldInter().copyWith(
                        color: R.colors.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                    getHorSpace(5),
                    SvgPicture.asset(
                      R.icons.infoIcon,
                      width: 15,
                      colorFilter: ColorFilter.mode(
                        R.colors.primaryColor.withValues(
                          alpha: Constant.getOpacityValues(80),
                        ),
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
                getVerSpace(20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: simpleText(R.strings.subCategoryText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
