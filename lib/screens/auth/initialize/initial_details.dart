import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/screens/widgets/set_budget.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:expenzo/widgets/my_list_tile.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../../../base/resizer/constant.dart";
import "../../../base/resizer/fetch_pixels.dart";
import "../../../resources/resources.dart";

class InitialDetails extends StatelessWidget {
  const InitialDetails({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getVerSpace(70),
                Row(
                  children: [
                    simpleText(
                      "Set Your preferences",
                      style: R.textStyle.semiBoldInter().copyWith(fontSize: 19),
                    ),
                    getHorSpace(10),
                    SvgPicture.asset(R.icons.parameterIcon, height: 15),
                  ],
                ),
                getVerSpace(10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: simpleText("Enter the following parameters"),
                ),
                getVerSpace(40),
                MyListTile(
                  titleText: "Theme",
                  titleIconPath: R.icons.colorPaletteIcon,
                  trailingText: "Light",
                  onTap: () {},
                ),
                getVerSpace(5),
                MyListTile(
                  titleText: "Currency",
                  titleIconPath: R.icons.currencyChangeIcon,
                  trailingText:
                      ""
                      "\$USD",
                  onTap: () {},
                ),
                getVerSpace(5),
                MyListTile(
                  titleText: "Time format",
                  titleIconPath: R.icons.clockIcon,
                  trailingText: "DD/MM/YYYY",
                  onTap: () {},
                ),
                getVerSpace(15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: getSimpleRichText([
                      TextSpan(
                        text: "Note: ",
                        style: R.textStyle.semiBoldInter().copyWith(
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: "You can also customize them in settings.",
                        style: R.textStyle.mediumInter().copyWith(fontSize: 12),
                      ),
                    ]),
                  ),
                ),
                getVerSpace(300),
                MyButton(buttonText: "Continue", onTap: () {
                  Constant.moveToNext(context, SetBudget());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
