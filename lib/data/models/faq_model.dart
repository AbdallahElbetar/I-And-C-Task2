class FaqModel {
  final String question;
  final String answer;
  final String category;

  FaqModel({
    required this.question,
    required this.answer,
    required this.category,
  });

  factory FaqModel.fromMap(Map<String, dynamic> map) {
    return FaqModel(
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
      category: map['category'] ?? '',
    );
  }
}
