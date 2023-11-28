class ChatModel {
  String chat = '';
  bool isGenerated = false;

  ChatModel({required this.chat, required this.isGenerated});

  ChatModel.fromJson(Map<String, dynamic> json) {
    chat = json['chat'] ?? '';
    isGenerated = json['isGenerated'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chat'] = chat;
    data['isGenerated'] = isGenerated;
    return data;
  }
}
