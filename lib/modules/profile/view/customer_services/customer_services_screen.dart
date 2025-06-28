import 'package:flutter/material.dart';

import 'package:i_and_c_task2/core/constants/app_colors.dart';
import 'package:i_and_c_task2/core/widgets/customer_service_option_widget.dart';
import 'package:i_and_c_task2/core/widgets/reusable_divider.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: const Text(
          'Customer Service',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  r"Hello, I'am Here To Assist You",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ReusableDivider(),
            const Text(
              'We are here to assist you. How can we help today?',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 30),
            ReusableDivider(),
            CustomerServiceOptionWidget(
              title: 'How can we help you?',
              subtitle: "Support",
            ),
            const SizedBox(height: 10),
            ReusableDivider(),
            const SizedBox(height: 10),
            CustomerServiceOptionWidget(
              title: 'Help Center',
              subtitle: "General Information",
            ),
          ],
        ),
      ),
    );
  }
}
