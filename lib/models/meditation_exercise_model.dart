class MeditationExerciseModel {
  final String category;
  final String name;
  final String description;
  final int duration;
  final String audioUrl;
  final String videoUrl;

  MeditationExerciseModel({
    required this.category,
    required this.name,
    required this.description,
    required this.duration,
    required this.audioUrl,
    required this.videoUrl,
  });

  factory MeditationExerciseModel.fromJson(Map<String, dynamic> json) {
    return MeditationExerciseModel(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      audioUrl: json['audioUrl'],
      videoUrl: json['videoUrl'],
    );
  }

  //convert MeditationExerciseModel to json data
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'duration': duration,
      'audioUrl': audioUrl,
      'videoUrl': videoUrl,
    };
  }
}
