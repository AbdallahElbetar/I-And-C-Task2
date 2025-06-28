import 'package:flutter/material.dart';
import 'package:i_and_c_task2/core/constants/app_colors.dart';
import 'package:i_and_c_task2/modules/profile/controller/home_faq_controller.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({super.key, required this.controller});

  final HelpFaqController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: AppColors.primaryColor.withAlpha(102),

        hintText: 'Search',
        hintStyle: const TextStyle(color: AppColors.primaryColor),

        suffixIcon: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.secondaryColor.withAlpha(100),
          ),
          child: const Icon(Icons.filter_list, color: AppColors.secondaryColor),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25), // مدور أكتر
          borderSide: BorderSide.none, // بدون حافة
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),

      onChanged: (value) {
        controller.searchQuery.value = value;
      },
    );
  }
}
