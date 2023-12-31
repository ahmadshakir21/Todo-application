import 'package:go_router/go_router.dart';
import 'package:todo_app/src/view/add_task.dart';
import 'package:todo_app/src/view/set_a_password.dart';
import 'package:todo_app/src/view/settings.dart';
import 'package:todo_app/src/view/update_task.dart';

import '../view/home_screen.dart';
import '../view/task_detail.dart';

class MyGoRouter {
  final router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      name: 'home_screen',
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'task_detail_screen',
      path: '/task_detail_screen',
      builder: (context, state) => const TaskDetail(),
    ),
    GoRoute(
      name: 'add_task_screen',
      path: '/add_task_screen',
      builder: (context, state) => const AddTask(),
    ),
    GoRoute(
      name: 'update_task_screen',
      path: '/update_task_screen',
      builder: (context, state) => const UpdateTask(),
    ),
    GoRoute(
      name: 'settings_screen',
      path: '/settings_screen',
      builder: (context, state) => const Settings(),
    ),
    GoRoute(
      name: 'set_a_password_screen',
      path: '/set_a_password_screen',
      builder: (context, state) => const SetAPassword(),
    ),
  ]);
}
