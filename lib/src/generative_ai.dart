import 'package:generative_ai/src/message.dart';

abstract class GenerativeAiModel {
  /// Given a prompt, returns a response.
  Future<String?> prompt(String prompt);
  Future<String?> promptWithContext(List<Message> messages);
}

class GenerativeAiModelConfig {
  final String model;
  final String apiKey;

  GenerativeAiModelConfig({
    required this.model,
    required this.apiKey,
  });
}
