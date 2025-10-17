import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:meditation/models/functions_model.dart';
import 'package:meditation/models/mindfull_exercise_model.dart';
import 'package:meditation/models/sleep_content_model.dart';
import 'package:meditation/pages/functions_page.dart';
import 'package:meditation/pages/main_pages/create_custom_exercise.dart';
import 'package:meditation/pages/main_screen.dart';
import 'package:meditation/pages/mindfull_exercise_details_page.dart';
import 'package:meditation/pages/mindfull_exercise_timer.dart';
import 'package:meditation/pages/sleep_story_timer_page.dart';
import 'package:meditation/router/route_names.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        name: RouteNames.home,
        path: "/",
        builder: (context, state) {
          return const MainScreen();
        },
      ),
      GoRoute(
        name: RouteNames.functions,
        path: "/functions",
        builder: (context, state) {
          final FunctionsData functionsData = state.extra as FunctionsData;

          return Functionspage(
            functionsData: functionsData,
          );
        },
      ),
      GoRoute(
        name: RouteNames.mindFullExercise,
        path: "/mindfullExerciseDetail",
        builder: (context, state) {
          final mindfullExerciseJson =
              state.uri.queryParameters['mindfullExercise'];
          final mindfullExercise =
              MindfulnessExercise.fromJson(jsonDecode(mindfullExerciseJson!));

          return MidfullExerciseDetailsPage(
            mindfullExercise: mindfullExercise,
          );
        },
      ),
      GoRoute(
        name: RouteNames.create,
        path: "/create",
        builder: (context, state) {
          return const CreateCustomExercise();
        },
      ),
      GoRoute(
        name: RouteNames.sleepStoryTimer,
        path: "/sleepStoryTimer",
        builder: (context, state) {
          final sleepContentJson = state.uri.queryParameters['sleepContent'];
          final sleepContentData =
              SleepContent.fromJson(jsonDecode(sleepContentJson!));

          return SleepStoryTimerPage(
            sleepContent: sleepContentData,
          );
        },
      ),
      GoRoute(
        name: RouteNames.midfullExerciseTimer,
        path: "/mindfullExerciseTimer",
        builder: (context, state) {
          final mindfullExerciseJson =
              state.uri.queryParameters['mindfullExercise'];
          final mindfullExercise =
              MindfulnessExercise.fromJson(jsonDecode(mindfullExerciseJson!));

          return MindFullExerciseTimer(
            mindfullExercise: mindfullExercise,
          );
        },
      ),
    ],
  );
}
