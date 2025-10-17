import 'package:hive/hive.dart';
part 'meditation_model.g.dart';

@HiveType(typeId: 0)
class MeditationContent {
  @HiveField(0)
  final String category;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final int duration;
  @HiveField(4)
  final String audioUrl;
  @HiveField(5)
  final String videoUrl;

  MeditationContent({
    required this.category,
    required this.name,
    required this.description,
    required this.duration,
    required this.audioUrl,
    required this.videoUrl,
  });

  // This method is used to convert the JSON data from the API into a Dart object.

  factory MeditationContent.fromJson(Map<String, dynamic> json) {
    return MeditationContent(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      audioUrl: json['audio_url'],
      videoUrl: json['video_url'],
    );
  }

  // This method is used to convert the Dart object into a JSON object that can be sent to the API.

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'duration': duration,
      'audio_url': audioUrl,
      'video_url': videoUrl,
    };
  }
}
