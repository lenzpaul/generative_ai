import 'package:generative_ai/generative_ai.dart';
import 'package:generative_ai/src/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Gemini implements GenerativeAiModel {
  final GeminiConfig config;
  late final GenerativeModel gemini;

  Gemini({required this.config}) {
    gemini = GenerativeModel(
      model: config.model,
      apiKey: config.apiKey,
    );
  }

  @override
  Future<String?> prompt(String prompt) async {
    final content = [Content.text(prompt)];
    final GenerateContentResponse response =
        await gemini.generateContent(content);

    return response.text;
  }

  /// Prompt wiht previous context
  @override
  Future<String?> promptWithContext(List<Message> messages) async {
    List<Content> content = messages.map((message) {
      switch (message.author) {
        case MessageAuthor.user:
          return Content.text(message.text);
        case MessageAuthor.ai:
          return Content.model([
            TextPart(message.text),
          ]);
      }
    }).toList();

    final GenerateContentResponse response =
        await gemini.generateContent(content);

    return response.text;
  }
}

class GeminiConfig extends GenerativeAiModelConfig {
  GeminiConfig({
    required super.model,
    required super.apiKey,
  });
}
