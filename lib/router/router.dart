import 'package:go_router/go_router.dart';
import 'package:meditator/pages/mainscreenpage.dart';
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
    ],
  );
}
