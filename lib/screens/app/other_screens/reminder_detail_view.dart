import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class ReminderDetailView extends StatefulWidget {
  const ReminderDetailView({super.key});

  @override
  State<ReminderDetailView> createState() => _ReminderDetailViewState();
}

class _ReminderDetailViewState extends State<ReminderDetailView> {
  bool _isCompleted = false;

  Widget _buildInfoCard({
    required String label,
    required String value,
    required String iconPath,
    Color? valueColor,
  }) {
    return MyContainer(
      padding: EdgeInsets.symmetric(
        horizontal: FetchPixels.getPixelWidth(20),
        vertical: FetchPixels.getPixelHeight(20),
      ),
      margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(12)),
      child: Row(
        children: [
          Container(
            width: FetchPixels.getPixelWidth(40),
            height: FetchPixels.getPixelHeight(40),
            decoration: BoxDecoration(
              color: R.colors.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(
                FetchPixels.getPixelWidth(12),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: FetchPixels.getPixelWidth(20),
                height: FetchPixels.getPixelHeight(20),
                colorFilter: ColorFilter.mode(
                  R.colors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          getHorSpace(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                simpleText(
                  label,
                  style: R.textStyle.mediumInter().copyWith(
                    fontSize: 13,
                    color: R.colors.dimTextColor,
                  ),
                ),
                getVerSpace(4),
                simpleText(
                  value,
                  style: R.textStyle.boldInter().copyWith(
                    fontSize: 15,
                    color: valueColor ?? R.colors.textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard() {
    return MyContainer(
      padding: EdgeInsets.symmetric(
        horizontal: FetchPixels.getPixelWidth(20),
        vertical: FetchPixels.getPixelHeight(25),
      ),
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              simpleText(
                "Reminder Status",
                style: R.textStyle.semiBoldInter().copyWith(fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isCompleted = !_isCompleted;
                  });
                },
                child: Container(
                  width: FetchPixels.getPixelWidth(24),
                  height: FetchPixels.getPixelHeight(24),
                  decoration: BoxDecoration(
                    color: _isCompleted
                        ? R.colors.secondaryColor
                        : R.colors.transparent,
                    border: Border.all(
                      color: R.colors.primaryColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(
                      FetchPixels.getPixelWidth(6),
                    ),
                  ),
                  child: _isCompleted
                      ? Icon(
                          Icons.check,
                          color: R.colors.bgColor,
                          size: FetchPixels.getPixelHeight(16),
                        )
                      : null,
                ),
              ),
            ],
          ),
          getVerSpace(20),
          Container(
            height: FetchPixels.getPixelHeight(6),
            decoration: BoxDecoration(
              color: R.colors.lightGreyColor,
              borderRadius: BorderRadius.circular(FetchPixels.getPixelWidth(3)),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: _isCompleted ? 1.0 : 0.0,
              child: Container(
                decoration: BoxDecoration(
                  color: _isCompleted
                      ? R.colors.secondaryColor
                      : R.colors.primaryColor,
                  borderRadius: BorderRadius.circular(
                    FetchPixels.getPixelWidth(3),
                  ),
                ),
              ),
            ),
          ),
          getVerSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              simpleText(
                _isCompleted ? "Completed" : "Pending",
                style: R.textStyle.semiBoldInter().copyWith(
                  fontSize: 14,
                  color: _isCompleted
                      ? R.colors.secondaryColor
                      : R.colors.primaryColor,
                ),
              ),
              simpleText(
                _isCompleted ? "100%" : "0%",
                style: R.textStyle.boldInter().copyWith(
                  fontSize: 14,
                  color: _isCompleted
                      ? R.colors.secondaryColor
                      : R.colors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
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
            child: MyAppBar1(titleText: "Reminder details", titleFontSize: 19),
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
                  simpleText(
                    "Electricity Bill Reminder",
                    style: R.textStyle.mediumInter().copyWith(
                      fontSize: 14,
                      color: R.colors.dimTextColor,
                    ),
                  ),
                  getVerSpace(25),
                  _buildStatusCard(),
                  getVerSpace(25),
                  simpleText(
                    "Reminder Details",
                    style: R.textStyle.semiBoldInter().copyWith(fontSize: 17),
                  ),
                  getVerSpace(15),
                  _buildInfoCard(
                    label: "Reminder Name",
                    value: "Electricity Bill",
                    iconPath: R.icons.alarmClockIcon,
                  ),
                  _buildInfoCard(
                    label: "Final Date",
                    value: "24/04/2025",
                    iconPath: R.icons.calenderIcon,
                  ),
                  _buildInfoCard(
                    label: "Days Remaining",
                    value: "3 days",
                    iconPath: R.icons.clockIcon,
                    valueColor: R.colors.redColor,
                  ),
                  _buildInfoCard(
                    label: "Category",
                    value: "Bills",
                    iconPath: R.icons.categoryIcon,
                  ),
                  getVerSpace(20),
                  MyContainer(
                    padding: EdgeInsets.symmetric(
                      horizontal: FetchPixels.getPixelWidth(20),
                      vertical: FetchPixels.getPixelHeight(20),
                    ),
                    margin: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              R.icons.descriptionIcon,
                              width: FetchPixels.getPixelWidth(20),
                              height: FetchPixels.getPixelHeight(20),
                              colorFilter: ColorFilter.mode(
                                R.colors.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            getHorSpace(10),
                            simpleText(
                              "Description",
                              style: R.textStyle.semiBoldInter().copyWith(
                                fontSize: 14,
                                color: R.colors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        getVerSpace(12),
                        simpleText(
                          "This is the electricity bill of our model town house. Please pay it as early as possible to avoid any late payment charges.",
                          style: R.textStyle.mediumInter().copyWith(
                            fontSize: 13,
                            color: R.colors.textColor,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  getVerSpace(30),
                  Row(
                    children: [
                      Expanded(
                        child: MyButton(
                          buttonTextStyle: R.textStyle.boldInter().copyWith(
                            fontSize: 15,
                            color: R.colors.whiteTextColor,
                          ),
                          buttonText: "Edit Reminder",
                          onTap: () {
                            // TODO: Navigate to edit reminder
                          },
                        ),
                      ),
                      getHorSpace(15),
                      Expanded(
                        child: MyButton(
                          buttonTextStyle: R.textStyle.boldInter().copyWith(
                            fontSize: 15,
                            color: R.colors.whiteTextColor,
                          ),
                          buttonText: _isCompleted
                              ? "Mark Pending"
                              : "Mark Complete",
                          onTap: () {
                            setState(() {
                              _isCompleted = !_isCompleted;
                            });
                          },
                        ),
                      ),
                    ],
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
