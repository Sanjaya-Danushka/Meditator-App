import 'package:flutter/material.dart';
import 'package:meditation/models/meditation_model.dart';

class MeditationProvider extends ChangeNotifier {
  List<MeditationContent> _allMeditationExerciese = [];
  List<MeditationContent> meditatonExercise = [];

  MeditationProvider() {
    _allMeditationExerciese = [
      MeditationContent(
        category: "Stress Relief",
        name: "Calm Your Mind",
        description:
            "This guided meditation is designed to help you calm your mind and alleviate stress. Through deep breathing exercises and visualization techniques, you will learn to let go of tension and find a sense of inner peace. The meditation starts with a focus on your breath, allowing you to center yourself and become aware of the present moment. As you continue, you will be guided to visualize a peaceful place, helping you to further relax and release any stress you may be holding onto.",
        duration: 15,
        audioUrl: "https://example.com/audio/calm-your-mind.mp3",
        videoUrl: "https://www.youtube.com/watch?v=yJg-Y5byMMw",
      ),
      MeditationContent(
        category: "Focus",
        name: "Boost Your Concentration",
        description:
            "This guided meditation aims to enhance your concentration and focus. It uses techniques such as mindful breathing and body scanning to help you clear your mind and reduce distractions. The session begins with a gentle reminder to sit comfortably and take deep breaths. Gradually, you will be guided through a series of exercises that encourage you to focus on different parts of your body, helping you to develop a heightened sense of awareness and concentration.",
        duration: 10,
        videoUrl: "https://www.youtube.com/watch?v=yJg-Y5byMMw",
        audioUrl: "https://example.com/audio/boost-your-concentration.mp3",
      ),
      MeditationContent(
        category: "Anxiety Relief",
        name: "Release Anxiety",
        description:
            "This guided meditation is focused on helping you release anxiety and find a state of calm. You will be guided through breathing exercises and mental visualizations designed to reduce anxious thoughts and promote relaxation. The meditation includes affirmations and gentle reminders to help you stay present and let go of worries. By the end of the session, you should feel more grounded and at peace.",
        duration: 20,
        videoUrl: "https://www.youtube.com/watch?v=yJg-Y5byMMw",
        audioUrl: "https://example.com/audio/release-anxiety.mp3",
      ),
      MeditationContent(
        category: "Sleep",
        name: "Deep Sleep Journey",
        description:
            "This guided meditation is designed to help you fall into a deep and restful sleep. The meditation starts with a progressive relaxation technique, guiding you to relax each part of your body. As you become more relaxed, the meditation will take you on a peaceful journey through a serene landscape, helping you to let go of any remaining tension and drift off into sleep. The soothing voice and gentle background music create a calming atmosphere perfect for bedtime.",
        duration: 25,
        videoUrl: "https://www.youtube.com/watch?v=yJg-Y5byMMw",
        audioUrl: "https://example.com/audio/deep-sleep-journey.mp3",
      ),
      MeditationContent(
        category: "Mindfulness",
        name: "Mindful Awareness",
        description:
            "This guided meditation focuses on cultivating mindfulness and awareness in your daily life. Through a series of exercises, you will learn to observe your thoughts and feelings without judgment, bringing your attention to the present moment. The meditation includes mindful breathing, body scanning, and visualization techniques to help you develop a deeper connection with yourself and the world around you.",
        duration: 15,
        videoUrl: "https://www.youtube.com/watch?v=yJg-Y5byMMw",
        audioUrl: "https://example.com/audio/mindful-awareness.mp3",
      ),
      MeditationContent(
        category: "Gratitude",
        name: "Gratitude Practice",
        description:
            "This guided meditation encourages you to cultivate a sense of gratitude. Through visualization and affirmations, you will be guided to reflect on the positive aspects of your life and express appreciation for them. The meditation helps you to focus on what you are grateful for, which can improve your overall mood and well-being. The session ends with a moment of silence to fully absorb the feelings of gratitude.",
        duration: 10,
        videoUrl: "https://www.youtube.com/watch?v=yJg-Y5byMMw",
        audioUrl: "https://example.com/audio/gratitude-practice.mp3",
      ),
      MeditationContent(
        category: "Relaxation",
        name: "Body Scan Relaxation",
        description:
            "This guided meditation is designed to help you achieve deep relaxation through a body scan technique. You will be guided to focus on different parts of your body, releasing tension and stress as you go. The meditation helps you to become more aware of your body and its sensations, promoting a sense of calm and relaxation. By the end of the session, you should feel more relaxed and at ease.",
        duration: 15,
        videoUrl: "https://www.youtube.com/watch?v=yJg-Y5byMMw",
        audioUrl: "https://example.com/audio/body-scan-relaxation.mp3",
      ),
      MeditationContent(
        category: "Compassion",
        name: "Loving Kindness",
        description:
            "This guided meditation focuses on cultivating loving-kindness and compassion for yourself and others. You will be guided through a series of affirmations and visualizations designed to open your heart and extend kindness to yourself and those around you. The meditation helps you to develop a deeper sense of empathy and connection, promoting feelings of love and compassion.",
        duration: 20,
        videoUrl: "https://www.youtube.com/watch?v=yJg-Y5byMMw",
        audioUrl: "https://example.com/audio/loving-kindness.mp3",
      ),
      MeditationContent(
        category: "Energy",
        name: "Morning Energizer",
        videoUrl: "https://www.youtube.com/watch?v=yJg-Y5byMMw",
        description:
            "This guided meditation is designed to energize you for the day ahead. It includes breathing exercises and visualizations to help you feel more awake and alert. The meditation encourages you to set positive intentions for the day and visualize yourself achieving your goals. By the end of the session, you should feel more energized and ready to take on the day.",
        duration: 10,
        audioUrl: "https://example.com/audio/morning-energizer.mp3",
      ),
      MeditationContent(
        category: "Self-Acceptance",
        name: "Embrace Yourself",
        videoUrl: "https://www.youtube.com/watch?v=yJg-Y5byMMw",
        description:
            "This guided meditation focuses on self-acceptance and self-love. Through a series of affirmations and visualizations, you will be guided to appreciate and accept yourself just as you are. The meditation helps you to let go of self-criticism and embrace your unique qualities. By the end of the session, you should feel more confident and at peace with yourself.",
        duration: 15,
        audioUrl: "https://example.com/audio/embrace-yourself.mp3",
      ),
    ];

    meditatonExercise = List.from(_allMeditationExerciese);
  }
}
