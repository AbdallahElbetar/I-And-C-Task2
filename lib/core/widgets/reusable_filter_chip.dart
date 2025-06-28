import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:i_and_c_task2/core/constants/app_colors.dart';
import 'package:i_and_c_task2/modules/profile/controller/home_faq_controller.dart';

class ReusableFilterChip extends StatelessWidget {
  const ReusableFilterChip({
    super.key,
    required this.label,
    required this.controller,
  });

  final HelpFaqController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return FilterChip(
        showCheckmark: false,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(
            color:
                controller.selectedFilters.contains(label)
                    ? AppColors.secondaryColor
                    : AppColors.primaryColor,
          ),
        ),
        label: Text(
          label,
          style: TextStyle(
            color:
                controller.selectedFilters.contains(label)
                    ? Colors.white
                    : AppColors.secondaryColor,
          ),
        ),
        selected: controller.selectedFilters.contains(label),
        onSelected: (_) => controller.toggleFilter(label),
        selectedColor: AppColors.secondaryColor,
        backgroundColor: AppColors.primaryColor.withAlpha(102),
      );
    });
  }
}
