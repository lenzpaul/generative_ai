abstract class GenerativeAiModel {
  /// Given a prompt, returns a response.
  Future<String?> prompt(String prompt);
}

class GenerativeAiModelConfig {
  final String model;
  final String apiKey;

  GenerativeAiModelConfig({
    required this.model,
    required this.apiKey,
  });
}
