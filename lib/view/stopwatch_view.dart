import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch_app/components/count_up_indicator.dart';
import 'package:stopwatch_app/components/record_list_view.dart';
import 'package:stopwatch_app/components/stopwatch_act_btn.dart';

import '../controller/stopwatch_notifier.dart';

class StopwatchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timeNotif = context.watch<StopWatchNotifier>();
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.timer_sharp,
                  size: 18,
                ),
              ),
              title: Text(
                'Stopwatch',
                style: txtTheme.titleMedium,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert, size: 18),
              ),
            ),
            Spacer(),
            CountUpIndicator(),
            timeNotif.isLapShowed ? SizedBox(height: 30) : Spacer(),
            RecordListView(),
            SizedBox(height: 20),
            StopwatchActBtn(),
          ],
        ),
      ),
    );
  }
}
