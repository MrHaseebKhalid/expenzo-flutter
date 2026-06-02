import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_back_button.dart";
import "package:flutter/material.dart";

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController _expenseNameController = TextEditingController();
  final TextEditingController _expenseAmountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final String _paymentMethod = "";
  final String _category = "";
  final String _expenseDate = "Today (default)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyBackButton(
          onTap: () => Navigator.pop(context),
        ),
        title: simpleText(
          "Add Expense",
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
                  "Keep track of your spending",
                  style: R.textStyle.semiBoldInter().copyWith(fontSize: 16),
                ),
                getHorSpace(8),
                Container(
                  width: FetchPixels.getPixelWidth(24),
                  height: FetchPixels.getPixelHeight(24),
                  decoration: BoxDecoration(
                    color: R.colors.primaryColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.attach_money,
                    size: FetchPixels.getPixelHeight(16),
                    color: R.colors.primaryColor,
                  ),
                ),
              ],
            ),
            getVerSpace(30),
            _buildInputField(
              label: "Expense name",
              icon: Icons.access_time,
              placeholder: "e.g., Electricity bill",
              controller: _expenseNameController,
            ),
            getVerSpace(20),
            _buildInputField(
              label: "Expense amount",
              icon: Icons.local_offer,
              placeholder: "e.g., \$23",
              controller: _expenseAmountController,
            ),
            getVerSpace(20),
            _buildDropdownField(
              label: "Payment method",
              icon: Icons.currency_exchange,
              placeholder: "Select payment method",
              value: _paymentMethod,
              onTap: () {},
            ),
            getVerSpace(20),
            _buildDropdownField(
              label: "Category",
              icon: Icons.grid_view,
              placeholder: "Select Category",
              value: _category,
              onTap: () {},
            ),
            getVerSpace(20),
            _buildDropdownField(
              label: "Expense Date",
              icon: Icons.calendar_today,
              placeholder: "Today (default)",
              value: _expenseDate,
              onTap: () {},
            ),
            getVerSpace(20),
            _buildInputField(
              label: "Description (optional)",
              icon: Icons.description,
              placeholder: "e.g., San Francisco House March bill",
              controller: _descriptionController,
            ),
            getVerSpace(40),
            SizedBox(
              width: double.infinity,
              height: FetchPixels.getPixelHeight(55),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: R.colors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      FetchPixels.getPixelWidth(16),
                    ),
                  ),
                  elevation: 0,
                ),
                child: simpleText(
                  "Add Expense",
                  style: R.textStyle.boldInter().copyWith(
                    fontSize: 16,
                    color: R.colors.whiteColor,
                  ),
                ),
              ),
            ),
            getVerSpace(30),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required IconData icon,
    required String placeholder,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        simpleText(
          label,
          style: R.textStyle.semiBoldInter().copyWith(fontSize: 14),
        ),
        getVerSpace(10),
        Container(
          height: FetchPixels.getPixelHeight(55),
          decoration: BoxDecoration(
            color: R.colors.lightGreyColor,
            borderRadius: BorderRadius.circular(
              FetchPixels.getPixelWidth(12),
            ),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: R.colors.iconColor,
                size: FetchPixels.getPixelHeight(20),
              ),
              hintText: placeholder,
              hintStyle: R.textStyle.mediumInter().copyWith(
                fontSize: 14,
                color: R.colors.dimTextColor,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(15),
                vertical: FetchPixels.getPixelHeight(15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required IconData icon,
    required String placeholder,
    required String value,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        simpleText(
          label,
          style: R.textStyle.semiBoldInter().copyWith(fontSize: 14),
        ),
        getVerSpace(10),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: FetchPixels.getPixelHeight(55),
            decoration: BoxDecoration(
              color: R.colors.lightGreyColor,
              borderRadius: BorderRadius.circular(
                FetchPixels.getPixelWidth(12),
              ),
            ),
            child: Row(
              children: [
                getHorSpace(15),
                Icon(
                  icon,
                  color: R.colors.iconColor,
                  size: FetchPixels.getPixelHeight(20),
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
                Icon(
                  Icons.keyboard_arrow_down,
                  color: R.colors.dimTextColor,
                  size: FetchPixels.getPixelHeight(20),
                ),
                getHorSpace(15),
              ],
            ),
          ),
        ),
      ],
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
