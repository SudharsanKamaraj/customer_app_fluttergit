class ChatMessage{
  String messageContent;
  String messageType;
  String messageTime;
  ChatMessage({required this.messageContent, required this.messageType, required this.messageTime});
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Greetings!! from AMO TRUCK SERVICE, Now you can book our truck repair services from chat. I'm Natasha, How can I help you?", messageType: "receiver",messageTime: "10:25am"),
  ChatMessage(messageContent: "Hi, I’m leon. My truck got stuck here", messageType: "sender",messageTime: "10:31am"),
  ChatMessage(messageContent: "Which model truck is that", messageType: "receiver",messageTime: "10:34am"),
];