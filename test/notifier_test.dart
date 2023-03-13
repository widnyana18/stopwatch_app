// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:stopwatch_app/controller/stopwatch_notifier.dart';

// class FakeStopwatch extends Mock implements StopWatchNotifier {}

// void main() {
//   final stopwatch = FakeStopwatch();

//   testWidgets('Check stopwatch and stepper when play',
//       (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     // await tester.pumpWidget(
//     //   ChangeNotifierProvider<StopWatchNotifier>.value(
//     //     value: stopwatch,
//     //     child: CountUpIndicator(),
//     //   ),
//     // );
//     // expect(find.text('00:00.0'), findsOneWidget);

//     stopwatch.onStart();
//     verify(stopwatch.onStart());

//     // expect(find.text('1'), findsNothing);
//     // await tester.tap(find.byIcon(Icons.play_arrow_rounded));
//     // await tester.pump();

//     // // Verify that our counter has incremented.
//     // expect(find.text(stopwatch.displayTime.), findsNothing);
//     // expect(find.text('1'), findsOneWidget);
//   });
// }
