enum MessageAuthor { user, ai }

/// Represents a message in a LLM conversation.
class Message {
  final String text;
  final MessageAuthor author;

  Message(this.text, this.author);
}
