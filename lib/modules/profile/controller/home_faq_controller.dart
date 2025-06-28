import 'dart:developer';

import 'package:get/get.dart';
import 'package:i_and_c_task2/core/services/faq_service.dart';
import 'package:i_and_c_task2/data/models/faq_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpFaqController extends GetxController {
  // 🟦 State
  var faqs = <FaqModel>[].obs;
  var selectedFilters = <String>[].obs;
  var searchQuery = ''.obs;
  var activeMainFilter = 'FAQ'.obs;
  var isLoading = true.obs;

  // 🟩 Lifecycle
  @override
  void onInit() {
    super.onInit();
    loadFaqs();
  }

  // 🟨 Data Fetching
  Future<void> loadFaqs() async {
    try {
      isLoading.value = true;
      faqs.value = await FaqService.fetchFaqs();
    } catch (e) {
      log("❌ Error loading FAQs: $e");
      Get.snackbar("Error", "Failed to load FAQs from Firestore");
    } finally {
      isLoading.value = false;
    }
  }

  // 🟪 Filtering Logic
  List<FaqModel> get filteredFaqs {
    return faqs.where((faq) {
      final matchesFilter =
          selectedFilters.isEmpty || selectedFilters.contains(faq.category);
      final matchesSearch = faq.question.toLowerCase().contains(
        searchQuery.value.toLowerCase(),
      );
      return matchesFilter && matchesSearch;
    }).toList();
  }

  void toggleFilter(String category) {
    if (selectedFilters.contains(category)) {
      selectedFilters.remove(category);
    } else {
      selectedFilters.add(category);
    }
  }

  void setMainFilter(String value) {
    activeMainFilter.value = value;
    selectedFilters.clear();
    searchQuery.value = '';
  }

  // 🟥 URL Launcher
  Future<void> urlLauncher(String url) async {
    final uri = Uri.parse(url);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar('Error', 'Could not launch $url');
      }
    } catch (e) {
      log("❌ URL Launch Error: $e");
      Get.snackbar('Error', 'Could not launch $url');
    }
  }
}
