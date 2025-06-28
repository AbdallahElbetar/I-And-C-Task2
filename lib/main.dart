import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:i_and_c_task2/modules/profile/view/customer_services/customer_services_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(IAndCTask2());
}

class IAndCTask2 extends StatelessWidget {
  const IAndCTask2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(primarySwatch: Colors.blue),
        home: const CustomerServiceScreen(),
      ),
    );
  }
}
