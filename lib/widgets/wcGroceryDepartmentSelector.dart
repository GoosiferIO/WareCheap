import 'package:flutter/material.dart';
import 'package:warecheap/widgets/wcCore.dart';

class GroceryDepartmentSelector extends StatefulWidget {
  @override
  _GroceryDepartmentSelectorState createState() =>
      _GroceryDepartmentSelectorState();
}

class _GroceryDepartmentSelectorState extends State<GroceryDepartmentSelector> {
  String? selectedDepartment;

  // grocery department list
  List<String> groceryDepartments = [
    'Produce',
    'Meat & Seafood',
    'Dairy & Eggs',
    'Bakery',
    'Frozen Foods',
    'Dry Goods & Pasta',
    'Canned Goods',
    'Snacks',
    'Beverages',
    'International Foods',
    'Breakfast & Cereal',
    'Coffee & Tea',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      elevation: 2.0,
      color: wcColors.bgTertiary,
      child: Container(
        width: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 18, 10, 18),
              child: Icon(Icons.category, color: wcColors.linkText),
            ),
            DropdownButton<String>(
              dropdownColor: wcColors.bgTertiary,
              //underline: Container(),
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              value: selectedDepartment,
              hint: const Text('Select Department',
                  style: TextStyle(
                    color: wcColors.secondaryText,
                  )),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDepartment = newValue;
                });
              },
              items: groceryDepartments
                  .map<DropdownMenuItem<String>>((String department) {
                return DropdownMenuItem<String>(
                  value: department,
                  child: Text(department,
                      style: const TextStyle(
                        color: wcColors.secondaryText,
                        fontWeight: FontWeight.normal,
                      )),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
