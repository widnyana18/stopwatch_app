import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch_app/controller/stopwatch_notifier.dart';

class StopwatchActBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timeNotif = context.watch<StopWatchNotifier>();

    Widget startBtn = ElevatedButton(
      onPressed: () {
        context.read<StopWatchNotifier>().onStart();
      },
      child: Icon(
        Icons.play_arrow_rounded,
        size: 35,
        color: Colors.white,
      ),
    );

    return AnimatedCrossFade(
      crossFadeState: timeNotif.isStartBtn
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 500),
      firstChild: startBtn,
      secondChild: Visibility(
        visible: timeNotif.islapPauseBtn,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<StopWatchNotifier>().onAddLap();
              },
              child: Icon(
                Icons.flag_rounded,
                size: 35,
              ),
            ),
            SizedBox(width: 18),
            ElevatedButton(
              onPressed: () {
                context.read<StopWatchNotifier>().onPause();
              },
              child: Icon(
                Icons.pause_rounded,
                size: 35,
              ),
            ),
          ],
        ),
        replacement: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<StopWatchNotifier>().onStopped();
              },
              child: Icon(
                Icons.stop_rounded,
                size: 35,
              ),
            ),
            SizedBox(width: 18),
            startBtn
          ],
        ),
      ),
    );
  }
}
