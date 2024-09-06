import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spendly/data/category_input_data.dart';
import 'package:spendly/screens/add_expense/components/gradient_formfield.dart';
import 'package:spendly/screens/add_expense/components/gradient_savebutton.dart';

class ExpenseInputFields extends StatefulWidget {
  const ExpenseInputFields({
    super.key,
    required TextEditingController expenseController,
    required TextEditingController categoryController,
    required TextEditingController dateController,
    required TextEditingController noteController,
  })  : _expenseController = expenseController,
        _categoryController = categoryController,
        _noteController = noteController,
        _dateController = dateController;

  final TextEditingController _expenseController;
  final TextEditingController _categoryController;
  final TextEditingController _noteController;
  final TextEditingController _dateController;

  @override
  State<ExpenseInputFields> createState() => _ExpenseInputFieldsState();
}

class _ExpenseInputFieldsState extends State<ExpenseInputFields> {
  DateTime selectedDate = DateTime.now();
  ColorList? selectedColor;
  IconList? selectedIcon;

  @override
  void initState() {
    setState(() {
      widget._dateController.text = DateFormat('dd/MM/yyyy').format(
        DateTime.now(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ExpenseInput Field
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: GradientTextFormField(
            controller: widget._expenseController,
          ),
        ),

        // Gap
        const SizedBox(height: 30),

        // CategoryInput Field
        TextFormField(
          readOnly: true,
          controller: widget._categoryController,
          textAlignVertical: TextAlignVertical.center,
          decoration: customInputDecorationWithSuffixIcon(
            "Category",
            const Icon(CupertinoIcons.list_bullet_below_rectangle, size: 15),
            const Icon(CupertinoIcons.add_circled_solid, size: 15),
          ),
          onTap: () {
            showDialog(
              context: (context),
              builder: (context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Dialog Title
                      const Text(
                        "Create a Category",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),

                      // Gap
                      const SizedBox(height: 15),

                      // Category Name
                      TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        readOnly: true,
                        decoration: customInputDecoration(
                          "Category Name",
                          const Icon(CupertinoIcons.pen),
                        ),
                      ),

                      // Gap
                      const SizedBox(height: 15),

                      // Dropdown IconList
                      StatefulBuilder(
                        builder: (BuildContext context, setState) {
                          return DropdownMenu<IconList>(
                            hintText: "Icon",
                            leadingIcon: selectedIcon?.icon ??
                                const Icon(
                                  CupertinoIcons.burst,
                                  color: Colors.grey,
                                ),
                            width: MediaQuery.of(context).size.width * 0.6,
                            dropdownMenuEntries: IconList.values.map<DropdownMenuEntry<IconList>>(
                              (IconList icon) {
                                return DropdownMenuEntry<IconList>(
                                  value: icon,
                                  label: icon.label,
                                  leadingIcon: icon.icon,
                                );
                              },
                            ).toList(),
                            inputDecorationTheme: InputDecorationTheme(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onSelected: (IconList? icon) {
                              setState(() {
                                selectedIcon = icon;
                              });
                            },
                          );
                        },
                      ),

                      // Gap
                      const SizedBox(height: 15),

                      // Dropdown ColorList
                      StatefulBuilder(
                        builder: (BuildContext context, setState) {
                          return DropdownMenu<ColorList>(
                            hintText: "Color",
                            leadingIcon: Icon(
                              CupertinoIcons.paintbrush,
                              color: selectedColor?.color ?? Colors.grey,
                            ),
                            width: MediaQuery.of(context).size.width * 0.6,
                            dropdownMenuEntries: ColorList.values.map<DropdownMenuEntry<ColorList>>(
                              (ColorList color) {
                                return DropdownMenuEntry<ColorList>(
                                  value: color,
                                  label: color.label,
                                  // enabled: color.label != 'Grey',
                                  style: MenuItemButton.styleFrom(
                                    foregroundColor: color.color,
                                  ),
                                );
                              },
                            ).toList(),
                            inputDecorationTheme: InputDecorationTheme(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onSelected: (ColorList? color) {
                              setState(() {
                                selectedColor = color;
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),

        // Gap
        const SizedBox(height: 20),

        // TitleInput Field
        TextFormField(
          controller: widget._noteController,
          textAlignVertical: TextAlignVertical.center,
          decoration: customInputDecoration(
            "Title",
            const Icon(
              CupertinoIcons.paperclip,
              size: 15,
            ),
          ),
        ),

        // Gap
        const SizedBox(height: 20),

        // DateInputField
        TextFormField(
          readOnly: true,
          controller: widget._dateController,
          onTap: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now().subtract(const Duration(days: 31)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
            );

            if (newDate != null) {
              setState(() {
                widget._dateController.text = DateFormat("dd/MM/yyyy").format(newDate);
                selectedDate = newDate;
              });
            }
          },
          textAlignVertical: TextAlignVertical.center,
          decoration: customInputDecoration(
            "Date",
            const Icon(
              CupertinoIcons.calendar,
              size: 15,
            ),
          ),
        ),

        // Gap
        const SizedBox(height: 30),

        // Save Expense Button
        const SaveButton(),
      ],
    );
  }

  InputDecoration customInputDecorationWithSuffixIcon(
    String hintText,
    Widget prefixIcon,
    Widget suffixIcon,
  ) {
    return InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: const TextStyle(fontWeight: FontWeight.w300),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    );
  }

  InputDecoration customInputDecoration(String hintText, Widget prefixIcon) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: const TextStyle(fontWeight: FontWeight.w300),
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    );
  }
}
