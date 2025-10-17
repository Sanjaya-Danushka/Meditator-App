import 'package:flutter/material.dart';
import 'package:meditation/models/sleep_content_model.dart';

class SleepContentProvider extends ChangeNotifier {
  List<SleepContent> _allSleepContents = [];
  List<SleepContent> sleepExercise = [];

  SleepContentProvider() {
    _allSleepContents = [
      SleepContent(
          category: "Sleep Stories",
          name: "The Starry Night",
          description:
              "This sleep story is designed to help you drift off into a peaceful sleep. It tells the tale of a serene night under a sky full of stars. As you listen, you will be guided to visualize the starry sky, the cool night air, and the gentle sounds of nature around you. The story is narrated in a calm and soothing voice, helping you to relax and let go of any tension or worries that may be keeping you awake.",
          duration: 20,
          audioUrl: "https://example.com/audio/the-starry-night.mp3"),
      SleepContent(
          category: "Relaxing Sounds",
          name: "Ocean Waves",
          description:
              "This sleep content features the soothing sounds of ocean waves, designed to help you relax and fall asleep more easily. The gentle rhythm of the waves can create a calming atmosphere, helping to drown out any background noise and allowing you to focus on the present moment. As you listen to the sound of the ocean, you can imagine yourself lying on a beach, feeling the cool breeze and the warm sand beneath you.",
          duration: 30,
          audioUrl: "https://example.com/audio/ocean-waves.mp3"),
      SleepContent(
          category: "Guided Sleep",
          name: "Deep Sleep Meditation",
          description:
              "This guided sleep meditation helps you relax and prepare for a restful night. Through gentle breathing exercises and progressive relaxation techniques, you will be guided to release the tension in your body and quiet your mind. The calming voice and soothing background music create a peaceful environment, helping you drift off into a deep and restorative sleep.",
          duration: 25,
          audioUrl: "https://example.com/audio/deep-sleep-meditation.mp3"),
      SleepContent(
          category: "Sleep Stories",
          name: "Moonlit Forest",
          description:
              "This sleep story takes you on a journey through a moonlit forest. As you walk along a peaceful path, you will be guided to observe the beauty of nature around you. The story is designed to calm your mind and help you feel more connected to the natural world. The soothing narration and gentle sounds of the forest create a tranquil atmosphere, perfect for bedtime.",
          duration: 20,
          audioUrl: "https://example.com/audio/moonlit-forest.mp3"),
      SleepContent(
          category: "Relaxing Sounds",
          name: "Rainfall",
          description:
              "This sleep content features the calming sound of gentle rainfall. The rhythmic patter of the rain can help you relax and unwind, creating a peaceful environment for sleep. The sound of rain has been shown to reduce stress and anxiety, making it easier for you to fall asleep and enjoy a restful night.",
          duration: 30,
          audioUrl: "https://example.com/audio/rainfall.mp3"),
      SleepContent(
          category: "Guided Sleep",
          name: "Bedtime Relaxation",
          description:
              "This guided meditation is designed to help you unwind and prepare for sleep. Through a series of gentle relaxation exercises, you will be guided to release the tension in your body and calm your mind. The soothing voice and peaceful background music create a relaxing atmosphere, helping you drift off into a restful sleep.",
          duration: 15,
          audioUrl: "https://example.com/audio/bedtime-relaxation.mp3"),
      SleepContent(
          category: "Sleep Stories",
          name: "Desert Dunes",
          description:
              "This sleep story takes you on a journey through a serene desert landscape. As you listen, you will be guided to visualize the vast, rolling dunes and the clear, starry sky above. The calming narration and gentle background music create a peaceful atmosphere, helping you relax and fall asleep.",
          duration: 20,
          audioUrl: "https://example.com/audio/desert-dunes.mp3"),
      SleepContent(
          category: "Relaxing Sounds",
          name: "Crackling Fireplace",
          description:
              "This sleep content features the soothing sound of a crackling fireplace. The gentle crackling of the fire can create a warm and cozy atmosphere, helping you relax and unwind. The sound of the fireplace can help drown out background noise, making it easier for you to fall asleep and enjoy a restful night.",
          duration: 30,
          audioUrl: "https://example.com/audio/crackling-fireplace.mp3"),
      SleepContent(
          category: "Guided Sleep",
          name: "Evening Wind Down",
          description:
              "This guided meditation is designed to help you wind down in the evening and prepare for sleep. Through a series of gentle relaxation exercises and breathing techniques, you will be guided to release the stress of the day and calm your mind. The soothing voice and peaceful background music create a relaxing atmosphere, helping you drift off into a restful sleep.",
          duration: 20,
          audioUrl: "https://example.com/audio/evening-wind-down.mp3"),
      SleepContent(
          category: "Sleep Stories",
          name: "Snowy Cabin",
          description:
              "This sleep story takes you to a cozy cabin in a snowy landscape. As you listen, you will be guided to visualize the serene beauty of the snow-covered surroundings and the warmth of the cabin. The calming narration and gentle background music create a peaceful atmosphere, helping you relax and fall asleep.",
          duration: 20,
          audioUrl: "https://example.com/audio/snowy-cabin.mp3"),
    ];

    sleepExercise = List.from(_allSleepContents);
  }
}
