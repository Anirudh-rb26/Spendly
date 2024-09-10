import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spendly/data/category_input_data.dart';
import 'package:spendly/presentation/add_expense_popup/components/gradient_formfield.dart';
import 'package:spendly/components/input_decoration.dart';
import 'package:spendly/presentation/add_expense_popup/components/new_category_dialog.dart';

class ExpenseInputFields extends StatefulWidget {
  TextEditingController expenseController;
  TextEditingController categoryController;
  TextEditingController categoryColorController;
  TextEditingController dateController;
  TextEditingController noteController;
  TextEditingController newCategoryController;
  final Function(CategoryList?, ColorList?) onSelectionChanged;

  ExpenseInputFields({
    super.key,
    required this.expenseController,
    required this.categoryController,
    required this.categoryColorController,
    required this.dateController,
    required this.noteController,
    required this.newCategoryController,
    required this.onSelectionChanged,
  });

  @override
  State<ExpenseInputFields> createState() => _ExpenseInputFieldsState();
}

class _ExpenseInputFieldsState extends State<ExpenseInputFields> {
  DateTime selectedDate = DateTime.now();
  CategoryList? _selectedIcon;
  ColorList? _selectedColor;

  @override
  void initState() {
    setState(() {
      widget.dateController.text = DateFormat('dd/MM/yyyy').format(
        DateTime.now(),
      );
    });
    super.initState();
  }

  void _updateOnSelection() {
    widget.onSelectionChanged(_selectedIcon, _selectedColor);
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
            controller: widget.expenseController,
          ),
        ),

        // Gap
        const SizedBox(height: 30),

        // TitleInput Field
        TextFormField(
          controller: widget.noteController,
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

        // Select ExpenseIcon
        DropdownMenu<CategoryList>(
          hintText: "Icon",
          leadingIcon: _selectedIcon?.icon ??
              const Icon(
                CupertinoIcons.burst,
                color: Colors.grey,
              ),
          trailingIcon: IconButton(
            onPressed: () {
              createCategoryDialog(
                context,
                widget.newCategoryController,
                _selectedColor,
                _selectedIcon,
              );
            },
            icon: const Icon(CupertinoIcons.add_circled),
          ),
          width: MediaQuery.of(context).size.width,
          controller: widget.categoryController,
          dropdownMenuEntries: CategoryList.values.map<DropdownMenuEntry<CategoryList>>(
            (CategoryList icon) {
              return DropdownMenuEntry<CategoryList>(
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
          onSelected: (CategoryList? icon) {
            setState(() {
              _selectedIcon = icon;
              // _selectedColor = color;
              _updateOnSelection();
            });
          },
        ),

        // Gap
        const SizedBox(height: 20),

        // Select ExpenseColor
        DropdownMenu<ColorList>(
          hintText: "Color",
          leadingIcon: const Icon(CupertinoIcons.paintbrush),
          width: MediaQuery.of(context).size.width,
          controller: widget.categoryColorController,
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
              _selectedColor = color;
              _updateOnSelection();
            });
          },
        ),

        // Gap
        const SizedBox(height: 20),

        // DateInputField
        TextFormField(
          readOnly: true,
          controller: widget.dateController,
          onTap: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now().subtract(const Duration(days: 31)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
            );

            if (newDate != null) {
              setState(() {
                widget.dateController.text = DateFormat("dd/MM/yyyy").format(newDate);
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
      ],
    );
  }
}
