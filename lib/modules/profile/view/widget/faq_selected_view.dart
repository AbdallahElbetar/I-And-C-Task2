import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:i_and_c_task2/core/constants/app_colors.dart';
import 'package:i_and_c_task2/core/widgets/reusable_divider.dart';
import 'package:i_and_c_task2/core/widgets/reusable_filter_chip.dart';
import 'package:i_and_c_task2/core/widgets/reusable_text_field.dart';
import 'package:i_and_c_task2/modules/profile/controller/home_faq_controller.dart';

class FaqSelectedView extends StatelessWidget {
  final HelpFaqController controller;

  const FaqSelectedView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Wrap(
            spacing: 8,
            children: [
              ReusableFilterChip(label: 'General', controller: controller),
              ReusableFilterChip(label: 'Account', controller: controller),
              ReusableFilterChip(label: 'Services', controller: controller),
            ],
          ),
        ),
        const SizedBox(height: 10),

        ReusableTextField(controller: controller),
        const SizedBox(height: 10),
        const ReusableDivider(),

        Expanded(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.secondaryColor,
                ),
              ); // ✅ Loading indicator
            }

            final faqs = controller.filteredFaqs;
            if (faqs.isEmpty) {
              return const Center(
                child: Text(
                  'No matching FAQs found.',
                  style: TextStyle(fontSize: 16, color: AppColors.primaryColor),
                ),
              );
            }

            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8.0),
              itemCount: faqs.length,
              separatorBuilder: (_, __) => const ReusableDivider(),
              itemBuilder: (context, index) {
                final faq = faqs[index];
                return Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text(faq.question),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(faq.answer),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
