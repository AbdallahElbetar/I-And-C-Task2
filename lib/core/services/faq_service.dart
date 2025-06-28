import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:i_and_c_task2/data/models/faq_model.dart';

class FaqService {
  static Future<List<FaqModel>> fetchFaqs() async {
    final snapshot = await FirebaseFirestore.instance.collection('faqs').get();

    return snapshot.docs.map((doc) {
      return FaqModel.fromMap(doc.data());
    }).toList();
  }
}
