import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:meditator/models/mindfull_exercisemodel.dart';
import 'package:meditator/pages/mainscreenpage.dart';
import 'package:meditator/pages/mindfull_exercise_details_page.dart';
import 'package:meditator/router/route_name.dart';

class RouterClass {
  final outer = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: RouteName.mainPage,
        builder: (context, state) => MainScreen(),
      ),
      GoRoute(
        path: '/mindfullExercisePage',
        name: RouteName.mindfullExercisePage,
        builder: (context, state) {
          final mindfullExerciseJson = state.uri.queryParameters['mindfullexercises'];
          final mindfullExercise = MindfullExerciseModel.fromJson(jsonDecode(mindfullExerciseJson!));
          return MindfullExerciseDetailsPage(
            exercise: mindfullExercise,
          );
        },
      ),
    ],
  );
}
