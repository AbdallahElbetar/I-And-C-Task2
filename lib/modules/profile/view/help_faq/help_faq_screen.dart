import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_and_c_task2/core/constants/app_colors.dart';
import 'package:i_and_c_task2/core/widgets/reusable_divider.dart';

import 'package:i_and_c_task2/modules/profile/controller/home_faq_controller.dart';
import 'package:i_and_c_task2/core/widgets/reusable_choice_chip.dart';
import 'package:i_and_c_task2/modules/profile/view/widget/contact_us_view.dart';
import 'package:i_and_c_task2/modules/profile/view/widget/faq_selected_view.dart';

class HelpFaqScreen extends StatelessWidget {
  const HelpFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HelpFaqController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help & FAQs',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "How Can We Help You?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const ReusableDivider(),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableChoiceChip(controller: controller, label: 'FAQ'),
                const SizedBox(width: 30),
                ReusableChoiceChip(controller: controller, label: 'Contact Us'),
              ],
            ),

            Expanded(
              child: Obx(() {
                final selected = controller.activeMainFilter.value;

                if (selected == 'FAQ') {
                  return FaqSelectedView(controller: controller);
                } else {
                  return const ContactUsView();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
