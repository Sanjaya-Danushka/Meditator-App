class MindfullExerciseModel {
  final String category;
  final String name;
  final String description;
  final List<String> instructions;
  final int duration;
  final String imagePath;
  final String instructionsUrl;

  MindfullExerciseModel({
    required this.category,
    required this.name,
    required this.description,
    required this.instructions,
    required this.duration,
    required this.imagePath,
    required this.instructionsUrl,
  });

  //methos to convert json data to MindfullExerciseModel
  factory MindfullExerciseModel.fromJson(Map<String, dynamic> json) {
    return MindfullExerciseModel(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      instructions: List<String>.from(json['instructions']),
      duration: json['duration'],
      imagePath: json['imagePath'],
      instructionsUrl: json['instructionsUrl'],
    );
  }

  //convert MindfullExerciseModel to json data
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'instructions': instructions,
      'duration': duration,
      'imagePath': imagePath,
      'instructionsUrl': instructionsUrl,
    };
  }

}
