import 'package:flutter_widgets/presentation/screens/counter/counter_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_widgets/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/riverpod',
      name: CounterScreen.name,
      builder: (context, state) => const CounterScreen(),
    ),

    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),

    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),

    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
    ),

    GoRoute(
      path: '/snackbars',
      name: SnackbardScreen.name,
      builder: (context, state) => const SnackbardScreen(),
    ),

    GoRoute(
      path: '/animated',
      name: AnimatedScreen.name,
      builder: (context, state) => const AnimatedScreen(),
    ),

    GoRoute(
      path: '/ui-controls',
      name: UiControlsScreen.name,
      builder: (context, state) => const UiControlsScreen(),
    ),

    GoRoute(
      path: '/tutorial',
      name: TutorialScreen.name,
      builder: (context, state) => const TutorialScreen(),
    ),

    GoRoute(
      path: '/infite-scroll',
      name: InfiniteScreen.name,
      builder: (context, state) => const InfiniteScreen(),
    ),

    GoRoute(
      path: '/theme-changer',
      name: ThemeChangeScreen.name,
      builder: (context, state) => const ThemeChangeScreen(),
    ),

]);
