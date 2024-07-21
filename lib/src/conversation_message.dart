enum MessageAuthor { user, ai }

/// Represents a message in a LLM conversation.
class ConversationMessage {
  final String text;
  final MessageAuthor author;

  ConversationMessage(this.text, this.author);
}
