import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/screens/auth/app_starter/opener.dart";
import "package:flutter/material.dart";
import "../../../resources/resources.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () async{
      await Constant.moveToNext(context, FirstOpener());
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: FetchPixels.getPixelWidth(270),
                  height: FetchPixels.getPixelHeight(200),
                ),
              Image.asset(R.images.appLogo, scale: FetchPixels.getScale(),
                height: FetchPixels.getPixelHeight(200),
              ),
                Positioned(
                    bottom: 5,
                    right: 7,
                    child: simpleText(R.strings.appLogoText,
                    style: R.textStyle.boldInter().copyWith(
                      color: R.colors.secondaryColor,
                      fontSize: 13,
                      letterSpacing: 3,

                    )
                    )),
              ],
            ),
            getVerSpace(120),
          ],
        ),
      ),
    );
  }
}
