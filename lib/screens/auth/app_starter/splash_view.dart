import "package:expenzo/base/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/provider/auth_provider.dart";
import "package:expenzo/utils/routes.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../../resources/resources.dart";

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    final authProvider = context.read<AuthProvider>();

    if (authProvider.isAuthenticated) {
      // User is logged in, navigate to main app
      Constant.navigateToRoute(context, Routes.appView);
    } else {
      // User is not logged in, navigate to opener
      Constant.navigateToRoute(context, Routes.opener);
    }
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
                Image.asset(
                  R.images.appLogo,
                  scale: FetchPixels.getScale(),
                  height: FetchPixels.getPixelHeight(200),
                ),
                Positioned(
                  bottom: 5,
                  right: 7,

                  child: simpleText(
                    R.strings.appLogoText,

                    style: R.textStyle.boldInter().copyWith(
                      color: R.colors.secondaryColor,
                      fontSize: 13,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ],
            ),
            getVerSpace(120),
          ],
        ),
      ),
    );
  }
}
