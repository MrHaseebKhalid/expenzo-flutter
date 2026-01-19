import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/screens/auth/initialize/welcome.dart";
import "package:expenzo/screens/widgets/sub_category_box.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_button.dart";
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
                MyAppBar1(titleText: "Set Budget", titleFontSize: 19),
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
                getVerSpace(30),

                SubCategoryBox(
                  iconPath: R.icons.foodIcon,
                  text: "Food",
                  textSize: 13,
                  textColor: R.colors.primaryColor,
                  hintText: "340",
                  iconSize: 30,
                ),
                getVerSpace(5),

                SubCategoryBox(
                  iconPath: R.icons.transportIcon,
                  text: "Transport",
                  textSize: 13,
                  textColor: R.colors.transportColor,
                  hintText: "210",
                  iconSize: 30,
                ),
                getVerSpace(5),

                SubCategoryBox(
                  iconPath: R.icons.billsIcon,
                  text: "Bills",
                  textSize: 13,
                  textColor: R.colors.billsColor,
                  hintText: "350",
                  iconSize: 29,
                ),
                getVerSpace(5),

                SubCategoryBox(
                  iconPath: R.icons.shoppingIcon,
                  text: "Shopping",
                  textSize: 13,
                  textColor: R.colors.shoppingColor,
                  hintText: "120",
                  iconSize: 30,
                ),
                getVerSpace(5),

                SubCategoryBox(
                  iconPath: R.icons.healthIcon,
                  text: "Health",
                  textSize: 13,
                  textColor: R.colors.healthColor,
                  hintText: "120",
                  iconSize: 29,
                ),
                getVerSpace(5),

                SubCategoryBox(
                  iconPath: R.icons.entertainmentIcon,
                  text: "Entertainment",
                  textSize: 12,
                  textColor: R.colors.entertainmentColor,
                  hintText: "50",
                  iconSize: 35,
                ),
                getVerSpace(5),

                SubCategoryBox(
                  iconPath: R.icons.othersIcon,
                  text: "Others",
                  textSize: 13,
                  textColor: R.colors.othersColor,
                  hintText: "70",
                  iconSize: 37,
                ),
                getVerSpace(20),
                getSimpleRichText([
                  TextSpan(
                    text: "Note : ",
                    style: R.textStyle.semiBoldInter().copyWith(
                      color: R.colors.redColor,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: R.strings.noteForBudget,
                    style: R.textStyle.regularInter().copyWith(
                      color: R.colors.redColor,
                    ),
                  ),
                ]),

                getVerSpace(30),
                MyButton(buttonText: "Set Budget", onTap: () {

                  Constant.moveToNext(context, Welcome());
                }),
                getVerSpace(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
