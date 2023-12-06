import 'package:flutter/material.dart';
import 'package:warecheap/widgets/wcCore.dart';

class wcTextField {
  static Widget tField({Icon? icon, String? label, String? hint}) {
    return Card(
      elevation: 2.0,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: icon,
          prefixIconColor: const Color.fromARGB(255, 169, 179, 139),
          filled: true,
          fillColor: wcColors.bgTertiary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          labelText: label ?? 'Label',
          hintText: hint ?? label,
          labelStyle: const TextStyle(
            color: wcColors.secondaryText,
          ),
        ),
      ),
    );
  }
}
