List<Map<String, dynamic>> chats = [
  {
    'id': 'chat_1',
    'userIds': ['user_1', 'user_2'],
    'messages': [
      {
        'messageId': 'message_1',
        'senderId': 'user_1',
        'content': 'Hey, how are you?',
        'receiverId': 'user_2',
        'createdAt': DateTime(2023, 08, 10, 10, 10, 10),
      },
      {
        'messageId': 'message_2',
        'senderId': 'user_2',
        'content': 'I am fine, thank you. And you?',
        'receiverId': 'user_2',
        'createdAt': DateTime(2023, 08, 10, 10, 10, 12),
      },
    ],
  },
  {
    'id': 'chat_2',
    'userIds': ['user_1', 'user_3'],
    'messages': [
      {
        'messageId': 'message_1',
        'senderId': 'user_1',
        'content': 'Hey, how are you, bro?',
        'receiverId': 'user_2',
        'createdAt': DateTime(2023, 08, 21, 03, 45, 41),
      },
      {
        'messageId': 'message_3',
        'senderId': 'user_3',
        'content': 'I am good! How about you?',
        'receiverId': 'user_2',
        'createdAt': DateTime(2023, 08, 21, 11, 23, 01),
      },
    ],
  },
];
