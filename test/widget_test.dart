// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:provider/provider.dart';
// import 'package:stopwatch_app/components/count_up_indicator.dart';
// import 'package:stopwatch_app/controller/stopwatch_notifier.dart';

// class MockStopwatch extends Mock implements StopWatchNotifier {}

// void main() {
//   StopWatchNotifier stopwatch = MockStopwatch();

//   testWidgets('Check stopwatch and stepper when play',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       ChangeNotifierProvider<StopWatchNotifier>.value(
//         value: stopwatch,
//         child: CountUpIndicator(),
//       ),
//     );

//     expect(find.text('00:00.0'), findsOneWidget);

//     stopwatch.onStart();
//     verify(stopwatch.onStart());

//     // when(stopwatch.onStart()).thenAnswer((_) => timer.rawTime.value);

//     await tester.pumpAndSettle();
//     // expect(find.text(timer.rawTime.value.toString()), findsOneWidget);

//     // await tester.tap(find.byIcon(Icons.play_arrow_rounded));
//     // await tester.pumpAndSettle();

//     //  when(cat.eatFood(any, hungry: anyNamed('hungry'))).thenReturn(true);

//     // expect(find.text(displayTime), findsOneWidget);
//   });
// }
