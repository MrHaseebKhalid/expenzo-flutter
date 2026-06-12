import "package:dotted_border/dotted_border.dart";
import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/utils/routes.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

enum ReminderStatus { completed, pending, overdue }

class ReminderItem {
  final String title;
  final ReminderStatus status;
  final String finalDate;
  final String daysLeft;
  bool isChecked;

  ReminderItem({
    required this.title,
    required this.status,
    required this.finalDate,
    required this.daysLeft,
    this.isChecked = false,
  });
}

class ReminderView extends StatefulWidget {
  const ReminderView({super.key});

  @override
  State<ReminderView> createState() => _ReminderViewState();
}

class _ReminderViewState extends State<ReminderView> {
  final List<ReminderItem> reminders = [
    ReminderItem(
      title: "Electricity bill",
      status: ReminderStatus.completed,
      finalDate: "21/04/2025",
      daysLeft: "3 days Left",
      isChecked: true,
    ),
    ReminderItem(
      title: "Water bill",
      status: ReminderStatus.completed,
      finalDate: "25/04/2025",
      daysLeft: "5 days Left",
      isChecked: true,
    ),
    ReminderItem(
      title: "Internet bill",
      status: ReminderStatus.pending,
      finalDate: "21/04/2025",
      daysLeft: "3 days Left",
      isChecked: false,
    ),
    ReminderItem(
      title: "Rent payment",
      status: ReminderStatus.overdue,
      finalDate: "15/04/2025",
      daysLeft: "0 days Left",
      isChecked: false,
    ),
  ];

  Widget _buildCheckbox({
    required bool isChecked,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: FetchPixels.getPixelWidth(24),
        height: FetchPixels.getPixelHeight(24),
        decoration: BoxDecoration(
          color: isChecked ? R.colors.primaryColor : R.colors.transparent,
          border: Border.all(color: R.colors.primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(FetchPixels.getPixelWidth(6)),
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                color: R.colors.bgColor,
                size: FetchPixels.getPixelHeight(16),
              )
            : null,
      ),
    );
  }

  Widget _buildReminderCard(ReminderItem reminder) {
    IconData? statusIcon;
    Color statusIconColor = R.colors.dimTextColor;

    switch (reminder.status) {
      case ReminderStatus.completed:
        statusIcon = Icons.check_box;
        statusIconColor = R.colors.secondaryColor;
        break;
      case ReminderStatus.pending:
        statusIcon = null;
        break;
      case ReminderStatus.overdue:
        statusIcon = Icons.warning;
        statusIconColor = const Color(0xFFFFC107);
        break;
    }

    return GestureDetector(
      onTap: () {
        Constant.navigateToRoute(context, Routes.reminderDetails);
      },
      child: MyContainer(
        padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(15),
          vertical: FetchPixels.getPixelHeight(15),
        ),
        margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(12)),
        child: Row(
          children: [
            _buildCheckbox(
              isChecked: reminder.isChecked,
              onTap: () {
                setState(() {
                  reminder.isChecked = !reminder.isChecked;
                });
              },
            ),
            getHorSpace(15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  simpleText(
                    reminder.title,
                    style: R.textStyle.boldInter().copyWith(fontSize: 14),
                  ),
                  getVerSpace(5),
                  Row(
                    children: [
                      simpleText(
                        "Status : ",
                        style: R.textStyle.mediumInter().copyWith(
                          fontSize: 12,
                          color: R.colors.dimTextColor,
                        ),
                      ),
                      if (statusIcon != null) ...[
                        Icon(
                          statusIcon,
                          size: FetchPixels.getPixelHeight(14),
                          color: statusIconColor,
                        ),
                        getHorSpace(4),
                      ],
                      simpleText(
                        reminder.status.name[0].toUpperCase() +
                            reminder.status.name.substring(1),
                        style: R.textStyle.mediumInter().copyWith(
                          fontSize: 12,
                          color: statusIconColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            getHorSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                simpleText(
                  "Final Date : ${reminder.finalDate}",
                  style: R.textStyle.mediumInter().copyWith(
                    fontSize: 11,
                    color: R.colors.dimTextColor,
                  ),
                ),
                getVerSpace(4),
                simpleText(
                  reminder.daysLeft,
                  style: R.textStyle.boldInter().copyWith(
                    fontSize: 12,
                    color: R.colors.redColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddReminderButton() {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        color: R.colors.primaryColor,

        strokeWidth: 1.5,
        dashPattern: [7, 4],
        padding: EdgeInsets.zero,
        radius: Radius.circular(FetchPixels.getPixelWidth(12)),
      ),
      child: GestureDetector(
        onTap: () {
          Constant.navigateToRoute(context, Routes.addReminder);
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: FetchPixels.getPixelHeight(14),
          ),
          decoration: BoxDecoration(
            color: R.colors.primaryColor.withValues(alpha: 0.09),
            borderRadius: BorderRadius.circular(FetchPixels.getPixelWidth(12)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: R.colors.primaryColor,
                size: FetchPixels.getPixelHeight(20),
              ),
              getHorSpace(8),
              simpleText(
                "Add Reminder",
                style: R.textStyle.semiBoldInter().copyWith(
                  fontSize: 14,
                  color: R.colors.primaryColor,
                ),
              ),
            ],
          ),
        ),
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
            child: MyAppBar1(titleText: "Reminders", titleFontSize: 19),
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
                  Row(
                    children: [
                      simpleText(
                        "Set reminders to be timely",
                        style: R.textStyle.mediumInter().copyWith(fontSize: 14),
                      ),
                      getHorSpace(5),
                      SvgPicture.asset(
                        R.icons.clockIcon,
                        colorFilter: ColorFilter.mode(
                          R.colors.primaryColor,
                          BlendMode.srcIn,
                        ),
                        width: FetchPixels.getPixelWidth(18),
                        height: FetchPixels.getPixelHeight(18),
                      ),
                    ],
                  ),
                  getVerSpace(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      simpleText(
                        "Your Reminders",
                        style: R.textStyle.boldInter().copyWith(
                          fontSize: 18,
                          color: R.colors.primaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Constant.navigateToRoute(context, Routes.addReminder);
                          // TODO: Navigate to add reminder screen
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            R.icons.plusIcon,
                            colorFilter: ColorFilter.mode(
                              R.colors.primaryColor,
                              BlendMode.srcIn,
                            ),
                            width: FetchPixels.getPixelWidth(18),
                            height: FetchPixels.getPixelHeight(18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  getVerSpace(8),
                  simpleText(
                    "Latest",
                    style: R.textStyle.mediumInter().copyWith(
                      fontSize: 12,
                      color: R.colors.dimTextColor,
                    ),
                  ),
                  getVerSpace(10),
                  ...reminders.map((reminder) => _buildReminderCard(reminder)),
                  getVerSpace(20),
                  _buildAddReminderButton(),
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
