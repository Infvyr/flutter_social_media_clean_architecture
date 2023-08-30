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
        'createdAt': "2023-08-21T03:45:41.000Z"
      },
      {
        'messageId': 'message_2',
        'senderId': 'user_2',
        'content': 'I am fine, thank you. And you?',
        'receiverId': 'user_2',
        'createdAt': "2023-08-21T03:46:11.000Z",
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
        'createdAt': "2023-08-12T06:54:21.000Z",
      },
      {
        'messageId': 'message_3',
        'senderId': 'user_3',
        'content': 'I am good! How about you?',
        'receiverId': 'user_2',
        'createdAt': "2023-08-12T07:00:00.000Z",
      },
    ],
  },
];
