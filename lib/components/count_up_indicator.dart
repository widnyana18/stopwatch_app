import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:stopwatch_app/controller/stopwatch_notifier.dart';

class CountUpIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timeNotif = context.watch<StopWatchNotifier>();
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: !timeNotif.isLapShowed ? 20 : 0),
      child: Column(
        crossAxisAlignment: !timeNotif.isLapShowed
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          StreamBuilder<String>(
            stream: timeNotif.displayTime,
            initialData: '00:00.00',
            builder: (context, snapshot) {
              return AnimatedDefaultTextStyle(
                duration: Duration(seconds: 1),
                child: Text(snapshot.data!),
                style: !timeNotif.isLapShowed
                    ? txtTheme.displayMedium!
                    : txtTheme.displaySmall!,
              );
            },
          ),
          AnimatedOpacity(
            opacity: !timeNotif.isLapShowed ? 0 : 1,
            duration: Duration(seconds: 1),
            child: Text(
              'Current time',
              style: txtTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.secondaryContainer),
            ),
          ),
          SizedBox(height: 16),
          StreamBuilder<int>(
            stream: timeNotif.currentStep,
            initialData: 0,
            builder: (context, snap) {
              return StepProgressIndicator(
                currentStep: snap.data!,
                totalSteps: !timeNotif.isLapShowed ? 60 : 120,
                padding: 0,
                customSize: (idx, _) {
                  if (snap.data! == idx) return 4;
                  return 2;
                },
                customStep: (idx, _, __) {
                  if (snap.data! == idx) {
                    return AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    );
                  }
                  return Container(
                    decoration: BoxDecoration(
                      color: theme.canvasColor,
                      shape: BoxShape.circle,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
