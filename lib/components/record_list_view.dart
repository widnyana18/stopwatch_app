import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/stopwatch_notifier.dart';

class RecordListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;
    final timeNotif = context.watch<StopWatchNotifier>();

    if (!timeNotif.isLapShowed) return SizedBox.shrink();
    return Expanded(
      flex: 4,
      child: AnimatedOpacity(
        opacity: timeNotif.isLapShowed ? 1 : 0,
        duration: Duration(seconds: 1),
        child: StreamBuilder<List<TimerRecord>>(
          stream: timeNotif.timeRecords,
          initialData: [],
          builder: (context, snapshot) {
            final data = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              // reverse: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Row(
                    children: [
                      Icon(
                        Icons.flag,
                        size: 15,
                        color: theme.colorScheme.secondaryContainer,
                      ),
                      SizedBox(width: 8),
                      Text(
                        data[index].id.toString().padLeft(2, '0'),
                        style: txtTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.secondaryContainer),
                      ),
                      Spacer(),
                      Text(
                        '+ ${data[index].timeSpan!}',
                        style: txtTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.secondaryContainer),
                      ),
                      Spacer(),
                      Text(
                        data[index].record!,
                        style: txtTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              },
              itemCount: data.length,
            );
          },
        ),
      ),
    );
  }
}
