class ChatContactModel {
  final String name;
  final String profilepic;
  final String contactId;
  final DateTime timesent;
  final String lastMessage;

  ChatContactModel(
      {required this.name,
      required this.profilepic,
      required this.contactId,
      required this.timesent,
      required this.lastMessage});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'profilepic': profilepic,
      'contactId': contactId,
      'timesent': timesent.millisecondsSinceEpoch,
      'lastMessage': lastMessage,
    };
  }

  factory ChatContactModel.fromMap(Map<String, dynamic> map) {
    return ChatContactModel(
      name: map['name'] ?? '',
      profilepic: map['profilepic'] ?? '',
      contactId: map['contactId'] ?? '',
      timesent: DateTime.fromMillisecondsSinceEpoch(map['timesent']),
      lastMessage: map['lastMessage'] ?? '',
    );
  }
}
