import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_back_button.dart";
import "package:flutter/material.dart";

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  final List<FAQItem> _faqs = [
    FAQItem(
      question: "How do I create a new budget?",
      answer:
          "To create a new budget, go to the Dashboard screen and tap on the 'Set Budget' button. You can set your monthly budget amount and track your expenses against it.",
    ),
    FAQItem(
      question: "Can I export my expense data?",
      answer:
          "Yes, you can export your expense data in CSV format. Go to Profile > Export Data and choose the date range you want to export.",
    ),
    FAQItem(
      question: "How do I categorize my expenses?",
      answer:
          "When adding a new expense, you can select from predefined categories like Food, Transport, Bills, Shopping, etc. You can also create custom categories in the settings.",
    ),
    FAQItem(
      question: "Is my data secure?",
      answer:
          "Yes, we use industry-standard encryption to protect your data. Your financial information is stored securely and never shared with third parties without your consent.",
    ),
    FAQItem(
      question: "How do I delete an expense?",
      answer:
          "To delete an expense, go to the Transactions section, tap on the expense you want to delete, and select the delete option from the menu.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyBackButton(onTap: () => Navigator.pop(context)),
        title: simpleText(
          "FAQs",
          style: R.textStyle.boldInter().copyWith(fontSize: 20),
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
              style: R.textStyle.boldInter().copyWith(fontSize: 18),
            ),
            getVerSpace(25),
            ..._faqs.asMap().entries.map((entry) {
              final index = entry.key;
              final faq = entry.value;
              return _buildFAQItem(faq, index);
            }),
            getVerSpace(30),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(FAQItem faq, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(15)),
      decoration: BoxDecoration(
        color: R.colors.whiteColor,
        borderRadius: BorderRadius.circular(FetchPixels.getPixelWidth(16)),
        border: Border.all(color: R.colors.lightGreyColor, width: 1),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(20),
          vertical: FetchPixels.getPixelHeight(15),
        ),
        childrenPadding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(20),
          vertical: FetchPixels.getPixelHeight(15),
        ),
        title: simpleText(
          faq.question,
          style: R.textStyle.semiBoldInter().copyWith(fontSize: 15),
        ),
        iconColor: R.colors.primaryColor,
        collapsedIconColor: R.colors.primaryColor,
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
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
