part of '../profile_screen.dart';

class _ProfileChart extends StatefulWidget {
  const _ProfileChart();

  @override
  State<_ProfileChart> createState() => __ProfileChartState();
}

class __ProfileChartState extends State<_ProfileChart> {
  late List<Color> _gradientColors;

  bool showAvg = false;
  final double _minX = 0;
  final double _maxX = 19;
  final double _minY = 0;
  final double _maxY = 8;
  late final List<FlSpot> _spots;
  late final List<FlSpot> _avgSpots;
  late final FlTitlesData _titlesData = FlTitlesData(
    show: true,
    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: context.height * 4,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTitlesWidget: leftTitleWidgets,
        reservedSize: context.width * 10,
      ),
    ),
  );
  late final FlGridData _gridData;

  @override
  void initState() {
    super.initState();
    final ThemeData themeData =
        Provider.of<ThemeProvider>(context, listen: false).currentTheme;
    _gradientColors = <Color>[
      themeData.colorScheme.primary,
      themeData.colorScheme.secondary
    ];
    _spots = const <FlSpot>[
      FlSpot(0, 3),
      FlSpot(3, 2),
      FlSpot(6, 5),
      FlSpot(9, 3.1),
      FlSpot(12, 6.5),
      FlSpot(15, 3),
      FlSpot(18, 4),
    ];
    double sum = 0;
    for (final FlSpot spot in _spots) {
      sum += spot.y;
    }
    _avgSpots = List<FlSpot>.generate(
        _spots.length, (int i) => FlSpot(i * 3, sum / _spots.length));
    _gridData = FlGridData(
      show: true,
      drawHorizontalLine: true,
      verticalInterval: 1,
      horizontalInterval: 1,
      getDrawingVerticalLine: (double value) =>
          FlLine(color: const Color(0xff37434d), strokeWidth: 1),
      getDrawingHorizontalLine: (double value) =>
          FlLine(color: const Color(0xff37434d), strokeWidth: 1),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _gradientColors = <Color>[context.primary, context.secondary];
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.7,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: context.inactiveTextColor,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    right: context.responsiveSize * 8,
                    left: context.responsiveSize,
                    top: context.responsiveSize * 5,
                    bottom: context.responsiveSize * 3),
                child: LineChart(showAvg ? avgData : mainData),
              ),
            ),
          ),
          Container(
            width: context.width * 12,
            height: context.height * 3.8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: TextButton(
              style: ButtonStyle(
                  shape: GeneralTheme.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))))),
              onPressed: () => setState(() => showAvg = !showAvg),
              child: BaseText(
                TextKeys.avg,
                style: context.bodySmall,
                color: showAvg
                    ? context.isDark
                        ? Colors.black54
                        : Colors.white54
                    : context.isDark
                        ? Colors.black
                        : Colors.white,
              ),
            ),
          ),
        ],
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final TextStyle style = context.labelSmall.copyWith(
        color: context.isDark ? Colors.black54 : Colors.white54,
        fontWeight: FontWeight.bold);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = BaseText(TextKeys.mon, style: style);
        break;
      case 3:
        text = BaseText(TextKeys.tue, style: style);
        break;
      case 6:
        text = BaseText(TextKeys.wed, style: style);
        break;
      case 9:
        text = BaseText(TextKeys.thur, style: style);
        break;
      case 12:
        text = BaseText(TextKeys.fri, style: style);
        break;
      case 15:
        text = BaseText(TextKeys.sat, style: style);
        break;
      case 18:
        text = BaseText(TextKeys.sun, style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final TextStyle style = context.labelLarge.copyWith(
        color: context.isDark ? Colors.black54 : Colors.white54,
        fontWeight: FontWeight.bold);
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1';
        break;
      case 3:
        text = '3';
        break;
      case 5:
        text = '5';
        break;
      case 7:
        text = '7';
        break;
      default:
        return Container();
    }
    return BaseText(text, style: style, translated: false);
  }

  LineChartData get mainData => LineChartData(
        gridData: _gridData,
        titlesData: _titlesData,
        borderData: FlBorderData(
            show: true, border: Border.all(color: const Color(0xff37434d))),
        minX: _minX,
        maxX: _maxX,
        minY: _minY,
        maxY: _maxY,
        lineBarsData: <LineChartBarData>[
          LineChartBarData(
            spots: _spots,
            isCurved: true,
            gradient: LinearGradient(colors: _gradientColors),
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: _gradientColors
                    .map((Color color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ),
        ],
      );

  LineChartData get avgData {
    final Color color =
        (ColorTween(begin: _gradientColors[0], end: _gradientColors[1])
                    .lerp(0.2) ??
                context.primary)
            .withOpacity(0.1);
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: _gridData,
      titlesData: _titlesData,
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: _minX,
      maxX: _maxX,
      minY: _minY,
      maxY: _maxY,
      lineBarsData: <LineChartBarData>[
        LineChartBarData(
          spots: _avgSpots,
          isCurved: true,
          gradient: LinearGradient(
            colors: <Color>[
              ColorTween(begin: _gradientColors[0], end: _gradientColors[1])
                      .lerp(0.2) ??
                  context.primary,
              ColorTween(begin: _gradientColors[0], end: _gradientColors[1])
                      .lerp(0.2) ??
                  context.primary,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(colors: <Color>[color, color]),
          ),
        ),
      ],
    );
  }
}
