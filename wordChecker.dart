// Name: Usman Nadeem
// Roll Number: 2380247


void main() {
  List<String> sentences = [
    "this is a test this is",
    "hello hello world",
    "dart is fun fun fun"
  ];


  for (int i = 0; i < sentences.length; i++) {
    Map<String, int> frequency = {};


    List<String> words = sentences[i].split(" ");


    // Count word frequency
    for (String word in words) {
      frequency[word] = (frequency[word] ?? 0) + 1;
    }


    // Find highest frequency
    int maxFreq = 0;
    for (int count in frequency.values) {
      if (count > maxFreq) {
        maxFreq = count;
      }
    }


    // Collect words with highest frequency
    List<String> highestWords = [];
    frequency.forEach((word, count) {
      if (count == maxFreq) {
        highestWords.add(word);
      }
    });


    print("$highestWords (appears in line ${i + 1})");
  }
}
