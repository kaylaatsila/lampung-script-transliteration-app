class Transliteration {
  int? transliterationID = 0;
  String inputPath = '';
  String outputPath = '';
  String outputName = '';
  String timestamp = '';

  Transliteration({
    required this.inputPath, 
    required this.outputPath, 
    required this.outputName, 
    required this.timestamp
  });

  Transliteration.withId(this.transliterationID, this.inputPath, this.outputPath, this.outputName, this.timestamp);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map['input_path'] = inputPath;
    map['output_path'] = outputPath;
    map['output_name'] = outputName;
    map['timestamp'] = timestamp;

    return map;
  }

  Transliteration.fromMap(Map<String, dynamic> map){
    transliterationID = map['id'];
    inputPath = map['input_path'];
    outputPath = map['output_path'];
    outputName = map['output_name'];
    timestamp = map['timestamp'];
  }
}
