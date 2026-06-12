import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  final Set<int> _expandedIndices = <int>{};
  final List<FAQItem> _faqs = [
    FAQItem(
      question: "what is Expenzo?",
      answer:
          "Expenzo is a personal finance management application that helps you track your expenses, set budgets, and manage your financial goals efficiently.",
    ),
    FAQItem(
      question: "How to use the Expenzo?",
      answer:
          "Simply sign up, add your expenses by category, set monthly budgets, and track your spending through the dashboard. You can also view analytics to understand your spending patterns.",
    ),
    FAQItem(
      question: "How to change the password of account?",
      answer:
          "Go to Settings > Account Security > Change Password. Enter your current password and create a new one to secure your account.",
    ),
    FAQItem(
      question: "How to export the data from Expenzo?",
      answer:
          "Navigate to Profile > Export Data, select the date range and data type you want to export, and choose your preferred format (CSV or PDF).",
    ),
    FAQItem(
      question: "What I can manage in the Expenzo?",
      answer:
          "You can manage expenses, budgets, categories, reminders, transactions, and view detailed analytics. The app helps you stay on top of your financial health.",
    ),
  ];

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
            child: MyAppBar1(titleText: "FAQs", titleFontSize: 19),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(10),
                vertical: FetchPixels.getPixelHeight(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  simpleText(
                    "Frequently Asked Questions (FAQs)",
                    style: R.textStyle.mediumInter().copyWith(
                      fontSize: 14,
                      color: R.colors.dimTextColor,
                    ),
                  ),
                  getVerSpace(10),
                  simpleText(
                    "Get Answer to your questions here ✨",
                    style: R.textStyle.boldInter().copyWith(fontSize: 15),
                  ),
                  getVerSpace(25),
                  ..._faqs.asMap().entries.map((entry) {
                    final index = entry.key;
                    final faq = entry.value;
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: FetchPixels.getPixelWidth(10),
                      ),
                      child: _buildFAQItem(faq, index),
                    );
                  }),
                  getVerSpace(30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(FAQItem faq, int index) {
    final isExpanded = _expandedIndices.contains(index);
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(16)),
      decoration: BoxDecoration(
        color: R.colors.whiteColor,
        borderRadius: BorderRadius.circular(FetchPixels.getPixelWidth(16)),
        border: Border.all(color: R.colors.primaryColor, width: 1),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          shape: const Border(),
          collapsedShape: const Border(),
          tilePadding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(20),
            vertical: FetchPixels.getPixelHeight(5),
          ),
          childrenPadding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(20),
            vertical: FetchPixels.getPixelHeight(15),
          ),
          title: simpleText(
            faq.question,
            style: R.textStyle.mediumInter().copyWith(
              fontSize: 15,
              color: R.colors.textColor,
            ),
          ),
          iconColor: R.colors.primaryColor,
          collapsedIconColor: R.colors.primaryColor,
          trailing: AnimatedRotation(
            turns: isExpanded ? 0.50 : 0,
            duration: const Duration(milliseconds: 300),
            child: SvgPicture.asset(
              R.icons.downArrowIcon,
              width: FetchPixels.getPixelWidth(8),
              height: FetchPixels.getPixelHeight(8),
              colorFilter: ColorFilter.mode(
                R.colors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          onExpansionChanged: (expanded) {
            setState(() {
              if (expanded) {
                _expandedIndices.add(index);
              } else {
                _expandedIndices.remove(index);
              }
            });
          },
          children: [
            simpleText(
              faq.answer,
              style: R.textStyle.mediumInter().copyWith(
                fontSize: 14,
                color: R.colors.dimTextColor,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
