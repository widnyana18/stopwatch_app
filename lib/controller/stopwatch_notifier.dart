import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatchNotifier with ChangeNotifier, DiagnosticableTreeMixin {
  final StopWatchTimer _timer = StopWatchTimer(mode: StopWatchMode.countUp);
  // StopWatchNotifier() {
  //   _getStopped();
  //   _getEnded();
  // }

  int get _miliSec => _timer.rawTime.value;
  StreamController<int> _stepController = StreamController();
  StreamController<List<TimerRecord>> _recordsController = StreamController();
  StreamController<String> _displayTimeController = StreamController();

  bool _isStopped = false;
  bool _isEnded = false;
  bool isLapShowed = false;
  List<TimerRecord> _records = <TimerRecord>[];
  int _id = 0;

  Stream<int> get currentStep => _stepController.stream;
  Stream<String> get displayTime => _displayTimeController.stream;
  Stream<List<TimerRecord>> get timeRecords => _recordsController.stream;
  bool get isStartBtn => !_timer.isRunning && !_isStopped || _isEnded;
  bool get islapPauseBtn => _timer.isRunning || !_isStopped && !_isEnded;
  bool get isStopResumeBtn => !_timer.isRunning || _isStopped && !_isEnded;

  void onStart() {
    final hours = StopWatchTimer.getRawHours(_miliSec);

    try {
      _timer.onStartTimer();

      if (_timer.isRunning) {
        _isStopped = false;
        _isEnded = false;
        _stepCounter();

        _timer.rawTime.listen((tick) {
          if (hours > 0) {
            _displayTimeController.add(
              StopWatchTimer.getDisplayTime(_miliSec, hours: true),
            );
          }

          _displayTimeController.add(
            StopWatchTimer.getDisplayTime(tick, hours: false),
          );
        });
      }
    } on Exception catch (e) {
      throw e.toString();
    }

    notifyListeners();
  }

  void _stepCounter() {
    int calculateStep = 0;
    _timer.rawTime.listen((tick) {
      if (isLapShowed) {
        calculateStep = ((tick % 61000) / 60000 * 120).floor();
      } else {
        calculateStep = ((tick % 61000) / 60000 * 60).floor();
      }
      _stepController.add(calculateStep);
    });
  }

  void onPause() {
    _timer.onStopTimer();
    _isStopped = true;
    _isEnded = false;
    notifyListeners();
  }

  void onAddLap() {
    try {
      if (_timer.isRunning) {
        _fetchLap();
      }
    } on Exception catch (e) {
      throw e.toString();
    }

    notifyListeners();
  }

  void _fetchLap() {
    final hours = StopWatchTimer.getRawHours(_miliSec);
    int range = 0;
    late String timeSpan;
    _id++;

    if (_records.isNotEmpty && _id > 0) {
      range = _miliSec - _records.last.rawTime!;
    } else {
      range = _miliSec;
    }

    timeSpan = StopWatchTimer.getDisplayTime(range, hours: hours > 0);

    _records.add(
      TimerRecord(
        id: _id,
        rawTime: _miliSec,
        timeSpan: timeSpan,
        record: StopWatchTimer.getDisplayTime(_miliSec, hours: hours > 0),
      ),
    );
    _records.sort((b, a) => a.id!.compareTo(b.id!));
    _recordsController.add(_records);
    isLapShowed = true;
  }

  Future<void> onStopped() async {
    try {
      _timer.onResetTimer();
      _isEnded = true;

      if (!_timer.isRunning) {
        _reset();
      }
    } on Exception catch (e) {
      throw e.toString();
    }
    notifyListeners();
  }

  Future<void> _reset() async {
    _id = 0;
    _isStopped = false;
    _isEnded = false;
    isLapShowed = false;
    _records.clear();
    _displayTimeController.add('00:00.00');
    _stepController.add(0);
    _recordsController = StreamController();
  }

  @override
  Future<void> dispose() async {
    await Future.wait<dynamic>([
      _timer.dispose(),
      _stepController.close(),
      _displayTimeController.close(),
      _recordsController.close(),
    ]);
    super.dispose();
  }

  // / Makes `hourser` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('_timer', _miliSec));
    properties.add(IterableProperty('_records', _records));
    properties.add(EnumProperty('isStartBtn', isStartBtn));
    properties.add(EnumProperty('isPauseLap', islapPauseBtn));
    properties.add(EnumProperty('isResumeStop', isStopResumeBtn));
  }
}

class TimerRecord {
  TimerRecord({this.id, this.rawTime, this.timeSpan, this.record});
  final int? id, rawTime;
  final String? timeSpan, record;
}
