import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spendly/data/category_input_data.dart';
import 'package:spendly/components/input_decoration.dart';

Future<dynamic> createCategoryDialog(
  BuildContext context,
  TextEditingController newCategoryNameController,
  ColorList? selectedColor,
  CategoryList? selectedIcon,
) {
  return showDialog(
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
              controller: newCategoryNameController,
              decoration: customInputDecoration(
                "Category Name",
                const Icon(CupertinoIcons.list_bullet_below_rectangle),
              ),
            ),

            // Gap
            const SizedBox(height: 15),

            // Dropdown IconList
            StatefulBuilder(
              builder: (BuildContext context, setState) {
                return DropdownMenu<CategoryList>(
                  hintText: "Icon",
                  leadingIcon: selectedIcon?.icon ??
                      const Icon(
                        CupertinoIcons.burst,
                        color: Colors.grey,
                      ),
                  width: MediaQuery.of(context).size.width * 0.6,
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

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Save Data
                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
