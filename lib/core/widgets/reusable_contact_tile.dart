import 'package:flutter/material.dart';
import 'package:i_and_c_task2/core/constants/app_colors.dart';

class ReusalbeContactTile extends StatelessWidget {
  const ReusalbeContactTile({
    super.key,
    this.icon,
    this.image,
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.onTap,
  });
  final IconData? icon;
  final String? image;
  final String title;
  final String subtitle;
  final String actionLabel;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading:
            icon != null
                ? Container(
                  height: 70,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.secondaryColor,
                  ),
                  child: Icon(icon, color: Colors.black),
                )
                : Container(
                  height: 70,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.secondaryColor,
                  ),
                  child: Image.asset(image!, fit: BoxFit.scaleDown),
                ),
        title: Text(title),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subtitle),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                ),
                onPressed: onTap,
                child: Text(
                  actionLabel,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
