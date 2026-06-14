import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:expenzo/widgets/my_text_field.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.bgColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: FetchPixels.getPixelHeight(10),
              left: FetchPixels.getPixelWidth(20),
              bottom: FetchPixels.getPixelHeight(10),
            ),
            child: MyAppBar1(titleText: "Edit Profile", titleFontSize: 19),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(20),
                vertical: FetchPixels.getPixelHeight(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(20),
                  Center(
                    child: Container(
                      width: FetchPixels.getPixelWidth(100),
                      height: FetchPixels.getPixelHeight(100),
                      decoration: BoxDecoration(
                        color: R.colors.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(
                          FetchPixels.getPixelWidth(50),
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          R.icons.profileIcon1,
                          width: FetchPixels.getPixelWidth(50),
                          height: FetchPixels.getPixelHeight(50),
                          colorFilter: ColorFilter.mode(
                            R.colors.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                  getVerSpace(30),
                  simpleText(
                    "Full Name",
                    style: R.textStyle.semiBoldInter().copyWith(fontSize: 15),
                  ),
                  getVerSpace(10),
                  MyTextField(
                    prefixSvgIconPath: R.icons.profileIcon1,
                    showText: "John Doe",
                    controller: _nameController,
                    context: context,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  getVerSpace(20),
                  simpleText(
                    "Email Address",
                    style: R.textStyle.semiBoldInter().copyWith(fontSize: 15),
                  ),
                  getVerSpace(10),
                  MyTextField(
                    prefixSvgIconPath: R.icons.mailIcon,
                    showText: "john.doe@example.com",
                    controller: _emailController,
                    context: context,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      if (!value.contains('@')) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  getVerSpace(40),
                  MyButton(
                    buttonText: "Save Changes",
                    onTap: () {
                      // TODO: Save profile changes
                    },
                  ),
                  getVerSpace(30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
