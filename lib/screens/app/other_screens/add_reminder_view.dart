import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_back_button.dart";
import "package:flutter/material.dart";

class AddReminderView extends StatefulWidget {
  const AddReminderView({super.key});

  @override
  State<AddReminderView> createState() => _AddReminderViewState();
}

class _AddReminderViewState extends State<AddReminderView> {
  final TextEditingController _reminderNameController = TextEditingController();
  final TextEditingController _finalDateController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _reminderNameController.dispose();
    _finalDateController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _finalDateController.text = "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year.toString().substring(2)}";
      });
    }
  }

  Widget _buildFormField({
    required String title,
    required IconData icon,
    required String placeholder,
    required TextEditingController controller,
    bool isDateField = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        simpleText(
          title,
          style: R.textStyle.semiBoldInter().copyWith(fontSize: 14),
        ),
        getVerSpace(8),
        GestureDetector(
          onTap: isDateField ? () => _selectDate(context) : null,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: FetchPixels.getPixelWidth(15),
              vertical: FetchPixels.getPixelHeight(12),
            ),
            decoration: BoxDecoration(
              color: R.colors.lightGreyColor,
              borderRadius: BorderRadius.circular(
                FetchPixels.getPixelWidth(25),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: R.colors.dimTextColor,
                  size: FetchPixels.getPixelHeight(20),
                ),
                getHorSpace(12),
                Expanded(
                  child: TextField(
                    controller: controller,
                    enabled: !isDateField,
                    decoration: InputDecoration(
                      hintText: placeholder,
                      hintStyle: R.textStyle.mediumInter().copyWith(
                        fontSize: 14,
                        color: R.colors.dimTextColor,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    style: R.textStyle.mediumInter().copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyBackButton(
          onTap: () => Navigator.pop(context),
        ),
        title: simpleText(
          "Add Reminder",
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
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  simpleText(
                    "Never miss an important expense",
                    style: R.textStyle.mediumInter().copyWith(fontSize: 14),
                  ),
                  getHorSpace(5),
                  Icon(
                    Icons.notifications_outlined,
                    color: R.colors.primaryColor,
                    size: FetchPixels.getPixelHeight(18),
                  ),
                ],
              ),
              getVerSpace(25),
              _buildFormField(
                title: "Reminder name",
                icon: Icons.alarm,
                placeholder: "e.g., Electricity bill",
                controller: _reminderNameController,
              ),
              getVerSpace(20),
              _buildFormField(
                title: "Final date",
                icon: Icons.calendar_today,
                placeholder: "e.g., 24/04/2025",
                controller: _finalDateController,
                isDateField: true,
              ),
              getVerSpace(20),
              _buildFormField(
                title: "Category",
                icon: Icons.category,
                placeholder: "e.g., Bills",
                controller: _categoryController,
              ),
              getVerSpace(20),
              _buildFormField(
                title: "Description (optional)",
                icon: Icons.description,
                placeholder: "e.g., San Francisco House March bill",
                controller: _descriptionController,
              ),
              getVerSpace(30),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: FetchPixels.getPixelHeight(16),
                ),
                decoration: BoxDecoration(
                  color: R.colors.primaryColor,
                  borderRadius: BorderRadius.circular(
                    FetchPixels.getPixelWidth(25),
                  ),
                ),
                child: Center(
                  child: simpleText(
                    "Add Reminder",
                    style: R.textStyle.boldInter().copyWith(
                      fontSize: 16,
                      color: R.colors.bgColor,
                    ),
                  ),
                ),
              ),
              getVerSpace(30),
            ],
          ),
        ),
      ),
    );
  }
}
