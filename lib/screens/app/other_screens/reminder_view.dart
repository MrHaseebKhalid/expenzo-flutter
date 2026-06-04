import "dart:ui";

import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_back_button.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

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

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  DashedBorderPainter({
    required this.color,
    this.dashWidth = 8.0,
    this.dashSpace = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    final double radius = 12.0;

    // Draw rounded rectangle with dashes
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(radius),
      ),
    );

    final dashPath = _createDashedPath(path, dashWidth, dashSpace);
    canvas.drawPath(dashPath, paint);
  }

  Path _createDashedPath(Path source, double dashWidth, double dashSpace) {
    final Path dest = Path();
    for (final PathMetric metric in source.computeMetrics()) {
      double distance = 0.0;
      bool draw = true;
      while (distance < metric.length) {
        final double len = draw ? dashWidth : dashSpace;
        if (draw) {
          dest.addPath(
            metric.extractPath(distance, distance + len),
            Offset.zero,
          );
        }
        distance += len;
        draw = !draw;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace;
  }
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
          border: Border.all(color: R.colors.primaryColor, width: 2),
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
        Constant.navigateToRoute(context, '/reminder-details');
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
    return GestureDetector(
      onTap: () {
        Constant.navigateToRoute(context, '/add-reminder');
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(18)),
        decoration: BoxDecoration(
          color: R.colors.transparent,
          borderRadius: BorderRadius.circular(FetchPixels.getPixelWidth(12)),
        ),
        child: CustomPaint(
          painter: DashedBorderPainter(
            color: R.colors.primaryColor,
            dashWidth: 8.0,
            dashSpace: 4.0,
          ),
          child: Padding(
            padding: EdgeInsets.all(FetchPixels.getPixelWidth(2)),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyBackButton(onTap: () => Navigator.pop(context)),
        title: simpleText(
          "Reminders",
          style: R.textStyle.boldInter().copyWith(
            fontSize: 20,
            color: R.colors.primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: R.colors.bgColor,
      ),
      backgroundColor: R.colors.bgColor,
      body: SingleChildScrollView(
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
                Icon(
                  Icons.access_time,
                  color: R.colors.primaryColor,
                  size: FetchPixels.getPixelHeight(18),
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
                Icon(
                  Icons.add,
                  color: R.colors.primaryColor,
                  size: FetchPixels.getPixelHeight(24),
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
            getVerSpace(20),
            ...reminders.map((reminder) => _buildReminderCard(reminder)),
            getVerSpace(20),
            _buildAddReminderButton(),
            getVerSpace(30),
          ],
        ),
      ),
    );
  }
}
