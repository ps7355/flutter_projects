class exmodel {
  final String name;
  final String profilepic;
  final String contactId;
  final DateTime timesent;
  final String lastMessage;

  exmodel(
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
      'timesent': timesent,
      'lastMessage': lastMessage,
    };
  }

  factory exmodel.fromMap(Map<String, dynamic> map) {
    return exmodel(
        name: map['name'] ?? '',
        profilepic: map['profilepic'] ?? '',
        contactId: map['contactId'] ?? '',
        timesent: DateTime.fromMicrosecondsSinceEpoch(map['timesent']),
        lastMessage: map['lastMessage'] ?? '');
  }
}
