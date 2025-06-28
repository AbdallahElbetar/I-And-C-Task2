import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:i_and_c_task2/core/constants/app_colors.dart';
import 'package:i_and_c_task2/modules/profile/controller/home_faq_controller.dart';

class ReusableChoiceChip extends StatelessWidget {
  const ReusableChoiceChip({
    super.key,
    required this.label,
    required this.controller,
  });

  final HelpFaqController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = controller.activeMainFilter.value == label;

      return ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.secondaryColor,
          ),
        ),
        selected: isSelected,
        onSelected: (_) => controller.setMainFilter(label),
        selectedColor: AppColors.secondaryColor,
        backgroundColor: AppColors.primaryColor.withAlpha(102),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(
            color:
                isSelected ? AppColors.secondaryColor : AppColors.primaryColor,
          ),
        ),
        showCheckmark: false,
      );
    });
  }
}
