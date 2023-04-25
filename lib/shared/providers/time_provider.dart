// ignore_for_file: use_setters_to_change_properties

import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimeGraphData {
  TimeGraphData(this.name, this.periods, this.before);
  String name;
  String periods;
  String before;
}

final timeList = [
  TimeGraphData('1H', '60', '1'),
  TimeGraphData('1D', '300', '24'),
  TimeGraphData('1W', '1800', '168'),
  TimeGraphData('1M', '3600', '730'),
  TimeGraphData('1Y', '86400', '8760'),
  TimeGraphData('ALL', '', '')
];

class TimeGraphDataNotifier extends StateNotifier<TimeGraphData> {
  TimeGraphDataNotifier() : super(TimeGraphData('1M', '60', '12'));

  void updateTimeGraphData(TimeGraphData newData) {
    state = newData;
  }
}

final timeDataProvider = StateNotifierProvider<TimeGraphDataNotifier, TimeGraphData>((ref) => TimeGraphDataNotifier());
