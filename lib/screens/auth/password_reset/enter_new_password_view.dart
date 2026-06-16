import "package:expenzo/base/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/provider/auth_provider.dart";
import "package:expenzo/screens/auth/widgets/confirmation.dart";
import "package:expenzo/utils/routes.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../../resources/resources.dart";
import "../../../widgets/my_text_field.dart";

class EnterNewPasswordView extends StatelessWidget {
  const EnterNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.read<AuthProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: FetchPixels.getPixelHeight(10),
              left: FetchPixels.getPixelWidth(20),
              bottom: FetchPixels.getPixelHeight(10),
            ),
            child: MyAppBar1(
              titleText: "Enter New Password",
              titleFontSize: 19,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: FetchPixels.getPixelWidth(25),
                    vertical: FetchPixels.getPixelHeight(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(R.images.enterNewPasswordImage),
                      getVerSpace(20),
                      simpleText(
                        "Enter a strong password different from the previous one.",
                      ),
                      getVerSpace(20),
                      getTextFieldText("New Password"),
                      getVerSpace(10),
                      MyTextField(
                        prefixSvgIconPath: R.icons.passwordIcon,
                        moveNext: false,
                        showButton: true,
                        eyeIconNumber: 2,
                        eyeIconAllowNumber: 2,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            authProvider.changeEyeIconAllow(
                              number: 2,
                              value: true,
                            );
                          } else {
                            authProvider.changeEyeIconAllow(
                              number: 2,
                              value: false,
                            );
                          }
                        },
                        onTapEyeButton: () {
                          authProvider.changeEyeIcon(number: 2);
                        },
                        context: context,
                        validator: (value) {
                          return null;
                        },
                      ),
                      getVerSpace(20),
                      getTextFieldText("Confirm Password"),
                      getVerSpace(10),
                      MyTextField(
                        prefixSvgIconPath: R.icons.passwordIcon,
                        moveNext: false,
                        showButton: true,
                        eyeIconNumber: 3,
                        eyeIconAllowNumber: 3,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            authProvider.changeEyeIconAllow(
                              number: 3,
                              value: true,
                            );
                          } else {
                            authProvider.changeEyeIconAllow(
                              number: 3,
                              value: false,
                            );
                          }
                        },
                        onTapEyeButton: () {
                          authProvider.changeEyeIcon(number: 3);
                        },
                        context: context,
                        validator: (value) {
                          return null;
                        },
                      ),
                      getVerSpace(40),
                      MyButton(
                        buttonText: "Reset",
                        onTap: () {
                          Constant.moveToNext(
                            context,
                            Confirmation(
                              mainText:
                                  "You have changed your account password.",
                              buttonText: "Redirect to Sign in",
                              nextRoute: Routes.signIn,
                              subRichTextChildren: [
                                TextSpan(
                                  text: "Now, you can sign in to ",
                                  style: R.textStyle.mediumInter().copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: "Expenzo",
                                  style: R.textStyle.semiBoldInter().copyWith(
                                    fontSize: 16,
                                    color: R.colors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
