// Convert String into Sentence Case Function
String toSentenceCase(String text) {
  // ignore: unnecessary_null_comparison
  if (text == null || text.isEmpty) {
    return "";
  }

  // Split the text into words
  List<String> words = text.split(' ');

  // Capitalize the first letter of each word
  List<String> sentenceCaseWords = words.map((word) {
    if (word.isNotEmpty) {
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    } else {
      return "";
    }
  }).toList();

  // Join the words back together with spaces
  String sentenceCaseText = sentenceCaseWords.join(' ');

  return sentenceCaseText;
}
