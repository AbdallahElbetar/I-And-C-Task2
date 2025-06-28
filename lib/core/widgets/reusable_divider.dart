import 'package:flutter/material.dart';
import 'package:i_and_c_task2/core/constants/app_colors.dart';

class ReusableDivider extends StatelessWidget {
  const ReusableDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(color: AppColors.primaryColor);
  }
}
