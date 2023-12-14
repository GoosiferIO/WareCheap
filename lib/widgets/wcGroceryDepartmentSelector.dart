import 'package:flutter/material.dart';
import 'package:warecheap/widgets/wcCore.dart';

class GroceryDepartmentSelector extends StatefulWidget {
  final Function(String) onDeptUpdate;
  final String? deptartment;

  const GroceryDepartmentSelector(
      {Key? key, required this.onDeptUpdate, required this.deptartment})
      : super(key: key);
  @override
  _GroceryDepartmentSelectorState createState() =>
      _GroceryDepartmentSelectorState();
}

class _GroceryDepartmentSelectorState extends State<GroceryDepartmentSelector> {
  late String? selectedDepartment;

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
  void initState() {
    super.initState();
    selectedDepartment = widget.deptartment;
  }

  void _updateGroceryDepartment(String _dpt) {
    setState(() {
      selectedDepartment = _dpt;
    });
    widget.onDeptUpdate(selectedDepartment!);
  }

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
            const Padding(
              padding: EdgeInsets.fromLTRB(13, 18, 10, 18),
              child: Icon(Icons.category, color: wcColors.linkText),
            ),
            DropdownButton<String>(
              dropdownColor: wcColors.bgTertiary,
              //underline: Container(),
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              value: selectedDepartment,
              hint: const Text('Select Department',
                  style: TextStyle(
                    color: wcColors.secondaryText,
                  )),
              onChanged: (String? _dpt) => _updateGroceryDepartment(_dpt!),

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
