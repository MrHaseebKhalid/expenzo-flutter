import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:expenzo/widgets/my_text_field.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class AddExpenseView extends StatefulWidget {
  const AddExpenseView({super.key});

  @override
  State<AddExpenseView> createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  final TextEditingController _expenseNameController = TextEditingController();
  final TextEditingController _expenseAmountController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final String _paymentMethod = "";
  final String _category = "";
  final String _expenseDate = "Today (default)";

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
            child: MyAppBar1(titleText: "Add Expense", titleFontSize: 19),
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
                        "Keep tracking of your spending",
                        style: R.textStyle.mediumInter().copyWith(
                          fontSize: 14,
                          color: R.colors.dimTextColor,
                        ),
                      ),
                      getHorSpace(10),
                      SvgPicture.asset(
                        R.icons.coinsIcon,
                        colorFilter: ColorFilter.mode(
                          R.colors.primaryColor,
                          BlendMode.srcIn,
                        ),
                        height: FetchPixels.getPixelHeight(16),
                      ),
                    ],
                  ),
                  getVerSpace(30),
                  getTextFieldText("Expense name"),
                  getVerSpace(10),
                  MyTextField(
                    prefixSvgIconPath: R.icons.alarmClockIcon,
                    showText: "e.g., Electricity bill",
                    controller: _expenseNameController,
                    context: context,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter expense name';
                      }
                      return null;
                    },
                  ),
                  getVerSpace(20),
                  getTextFieldText("Expense amount"),
                  getVerSpace(10),
                  MyTextField(
                    prefixSvgIconPath: R.icons.priceTagIcon,
                    showText: "e.g., \$23",
                    controller: _expenseAmountController,
                    context: context,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter expense amount';
                      }
                      return null;
                    },
                  ),
                  getVerSpace(20),
                  getTextFieldText("Payment method"),
                  getVerSpace(10),
                  _buildDropdownField(
                    placeholder: "Select payment method",
                    value: _paymentMethod,
                    iconPath: R.icons.paymentMethodIcon,
                    onTap: () {},
                  ),
                  getVerSpace(20),
                  getTextFieldText("Category"),
                  getVerSpace(10),
                  _buildDropdownField(
                    placeholder: "Select Category",
                    value: _category,
                    iconPath: R.icons.categoryIcon,
                    onTap: () {},
                  ),
                  getVerSpace(20),
                  getTextFieldText("Expense Date"),
                  getVerSpace(10),
                  _buildDropdownField(
                    placeholder: "Today (default)",
                    value: _expenseDate,
                    iconPath: R.icons.calenderIcon,
                    onTap: () {},
                  ),
                  getVerSpace(20),
                  getTextFieldText("Description (optional)"),
                  getVerSpace(10),
                  MyTextField(
                    prefixSvgIconPath: R.icons.descriptionIcon,
                    showText: "e.g., San Francisco House March bill",
                    controller: _descriptionController,
                    context: context,
                    validator: (value) {
                      return null;
                    },
                  ),
                  getVerSpace(40),
                  MyButton(buttonText: "Add Expense", onTap: () {}),
                  getVerSpace(30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String placeholder,
    required String value,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: FetchPixels.getPixelHeight(55),
        decoration: BoxDecoration(
          color: R.colors.lightGreyColor,
          borderRadius: BorderRadius.circular(FetchPixels.getPixelWidth(100)),
        ),
        child: Row(
          children: [
            getHorSpace(15),
            SvgPicture.asset(
              iconPath,
              width: FetchPixels.getPixelWidth(20),
              height: FetchPixels.getPixelHeight(20),
              colorFilter: ColorFilter.mode(
                R.colors.iconColor,
                BlendMode.srcIn,
              ),
            ),
            getHorSpace(10),
            Expanded(
              child: simpleText(
                value.isEmpty ? placeholder : value,
                style: R.textStyle.mediumInter().copyWith(
                  fontSize: 14,
                  color: value.isEmpty
                      ? R.colors.dimTextColor
                      : R.colors.textColor,
                ),
              ),
            ),
            SvgPicture.asset(
              R.icons.downArrowIcon,
              width: FetchPixels.getPixelWidth(8),
              height: FetchPixels.getPixelHeight(8),
              colorFilter: ColorFilter.mode(
                R.colors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            getHorSpace(25),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _expenseNameController.dispose();
    _expenseAmountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
