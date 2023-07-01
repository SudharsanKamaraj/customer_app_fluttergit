List<TimePeriod> time = <TimePeriod>[
  TimePeriod(
    time: '10AM-1PM',
  ),
  TimePeriod(
    time: '1PM-4PM',
  ),
  TimePeriod(
    time: '4PM-7PM',
  ),
];

class TimePeriod {
  String time;

  TimePeriod({
    required this.time,
  });
}