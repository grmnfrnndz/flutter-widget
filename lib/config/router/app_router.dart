import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: HomeScreen.name, builder: (context, state) => const HomeScreen(),),
    GoRoute(path: '/buttons', name: ButtonsScreen.name, builder: (context, state) => const ButtonsScreen(),),
    GoRoute(path: '/cards', name: CardsScreen.name, builder: (context, state) => const CardsScreen(),),
    GoRoute(path: '/progress', name: ProgressScreen.name, builder: (context, state) => const ProgressScreen(),),
    GoRoute(path: '/snackbar', name: SnackBarScreen.name, builder: (context, state) => const SnackBarScreen(),),
    GoRoute(path: '/animated', name: AnimatedScreen.name, builder: (context, state) => const AnimatedScreen(),),
    GoRoute(path: '/ui-controls', name: UiControlScreen.name, builder: (context, state) => const UiControlScreen(),),
    GoRoute(path: '/tutorial', name: AppTutorialScreen.name, builder: (context, state) => const AppTutorialScreen(),),
    GoRoute(path: '/infinite', name: InfiniteScrollScreen.name, builder: (context, state) => const InfiniteScrollScreen(),),
    GoRoute(path: '/counter', name: CounterScreen.name, builder: (context, state) => const CounterScreen(),),
    GoRoute(path: '/theme-change', name: ThemeChangerScreen.name, builder: (context, state) => const ThemeChangerScreen(),),
  ],
);