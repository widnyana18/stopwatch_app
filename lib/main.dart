import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch_app/config/app_theme.dart';
import 'package:stopwatch_app/controller/stopwatch_notifier.dart';
import 'package:stopwatch_app/view/stopwatch_view.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stopwatch App Xiaomi',
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.dark,
      home: ChangeNotifierProvider<StopWatchNotifier>(
        create: (_) => StopWatchNotifier(),
        child: StopwatchView(),
      ),
    );
  }
}
