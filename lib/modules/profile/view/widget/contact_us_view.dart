import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_and_c_task2/core/widgets/reusable_contact_tile.dart';
import 'package:i_and_c_task2/core/widgets/reusable_divider.dart';
import 'package:i_and_c_task2/modules/profile/controller/home_faq_controller.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final HelpFaqController controller = Get.put(HelpFaqController());

    return ListView(
      padding: const EdgeInsets.all(12.0),
      children: [
        ReusalbeContactTile(
          icon: null,
          image: "assets/images/customer_service_icon.png",
          title: 'Customer Service',
          subtitle: 'Call center: 19999',
          actionLabel: 'Simulate Call',
          onTap: () {
            controller.urlLauncher('tel:201028812566');
          },
        ),
        const ReusableDivider(),

        ReusalbeContactTile(
          icon: Icons.language,
          title: 'Website',
          subtitle: 'Visit our official website.',
          actionLabel: 'Open Website',
          onTap: () {
            controller.urlLauncher('https://www.i-c.com.sa/');
          },
        ),
        const ReusableDivider(),

        ReusalbeContactTile(
          icon: Icons.facebook,
          title: 'Facebook',
          subtitle: 'Message us on Facebook.',
          actionLabel: 'Open Facebook',
          onTap: () {
            controller.urlLauncher('https://www.facebook.com/');
          },
        ),
        const ReusableDivider(),

        ReusalbeContactTile(
          icon: null,
          image: "assets/images/icons8-whatsapp-25.png",
          title: 'WhatsApp',
          subtitle: 'Chat with us on WhatsApp.',
          actionLabel: 'Open WhatsApp',
          onTap: () {
            controller.urlLauncher('https://wa.me/201028812566');
          },
        ),
        const ReusableDivider(),

        ReusalbeContactTile(
          icon: null,
          image: "assets/images/icons8-instagram-25.png",
          title: 'Instagram',
          subtitle: 'Follow us on Instagram.',
          actionLabel: 'Open Instagram',
          onTap: () {
            controller.urlLauncher('https://www.instagram.com/');
          },
        ),
      ],
    );
  }
}
