import 'package:expenzo/screens/auth/sign%20in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../base/resizer/constant.dart';
import '../../../base/resizer/fetch_pixels.dart';
import '../../../base/resizer/widget_utils.dart';
import '../../../resources/resources.dart';
import '../../../widgets/my_button.dart';
import '../provider/auth_provider.dart';

class FirstOpener extends StatefulWidget {
  const FirstOpener({super.key});

  @override
  State<FirstOpener> createState() => _FirstOpenerState();
}

class _FirstOpenerState extends State<FirstOpener> {
  @override
  void initState() {
    final authProvider = context.read<AuthProvider>();
    authProvider.createOpenerController();
    authProvider.changeOpenerPageLoop();
    super.initState();
  }

  @override
  void dispose() {
    final authProvider = context.read<AuthProvider>();
    authProvider.disposeOpenerController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthProvider>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getVerSpace(80),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Constant.moveToNext(context, SignIn());
                  },
                  child: SizedBox(
                    height: FetchPixels.getPixelHeight(50),
                    width: FetchPixels.getPixelWidth(50),
                    child: simpleText(
                      "Skip",
                      style: R.textStyle.semiBoldInter().copyWith(
                        fontSize: 16,
                        color: R.colors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: R.colors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            getVerSpace(20),
        
            SizedBox(
              height: FetchPixels.getPixelHeight(500),
              child: PageView(
                controller: authProvider.openerPageController,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        R.images.firstOpenerImage,
                        scale: FetchPixels.getScale(),
                        height: 420,
                      ),
                      simpleText(
                        R.strings.firstOpenerText,
                        style: R.textStyle.mediumInter().copyWith(fontSize: 14),
                      ),
                      simpleText(
                        R.strings.firstOpenerTextBold,
                        style: R.textStyle.boldInter().copyWith(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        R.images.secondOpenerImage,
                        scale: FetchPixels.getScale(),
                        height: 420,
                      ),
                      simpleText(
                        R.strings.secondOpenerText,
                        style: R.textStyle.mediumInter().copyWith(fontSize: 14),
                      ),
                      simpleText(
                        R.strings.secondOpenerTextBold,
                        style: R.textStyle.boldInter().copyWith(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        
            getVerSpace(10),
        
            Selector<AuthProvider, int>(
              selector: (context, dataProvider) =>
                  dataProvider.currentOpenerValue,
              builder: (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 15,
                children: [
                  Container(
                    height:  FetchPixels.getPixelHeight((value == 0)? 12 : 9),
                    width: FetchPixels.getPixelWidth((value == 0)? 12 : 9),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (value == 0)? R.colors.primaryColor : R.colors.dimTextColor,
                    ),
                  ),
                  Container(
                    height: FetchPixels.getPixelHeight((value == 0)? 9 : 12),
                    width: FetchPixels.getPixelWidth((value == 0)? 9 : 12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (value == 1)? R.colors.primaryColor : R.colors.dimTextColor,
                    ),
                  ),
                ],
              ),
            ),
        
            getVerSpace(60),
            MyButton(buttonText: "Get Started", onTap: () {
              Constant.moveToNext(context, SignIn());
            }),
            getVerSpace(20)
          ],
        ),
      ),
    );
  }
}
