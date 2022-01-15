import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/ui/theme/app_text_util.dart';

class LineChartSample2 extends StatefulWidget {
  final List<Map<String, double>> lineDataList = [
    {'key': 28, 'value': 18},
    {'key': 29, 'value': 57},
    {'key': 30, 'value': 39},
    {'key': 31, 'value': 20},
    {'key': 01, 'value': 36},
    {'key': 02, 'value': 57},
    {'key': 03, 'value': 70},
  ];
  LineChartSample2({Key? key}) : super(key: key);

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color.fromRGBO(255, 182, 0, 1),
    // const Color.fromRGBO(255, 172, 33, 1)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          // margin: EdgeInsets.only(top: 10.h),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 12.h, top: 10.h),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  width: 1.sw,
                  child: Text(
                    '均价走势 BCC/CNY',
                    style: SeaFont.s16FontTextStyle(),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(right: 8.w),
                        child: Text('11,123.22',
                            style: SeaFont.s16FontTextStyle())),
                    Container(
                        padding: EdgeInsets.all(5.r),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            color: Colors.redAccent),
                        child: Text('+11.22%',
                            style:
                                SeaFont.s13FontTextStyle(color: Colors.white)))
                  ],
                )
              ],
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 1.5,
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 20.0, left: 0.0, top: 20, bottom: 12),
              child: LineChart(
                mainData(widget.lineDataList),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData(List<Map> lineList) {
    List<FlSpot> spots = [];
    double maxY = 0;
    for (int i = 0; i < lineList.length; i++) {
      Map e = lineList[i];
      maxY = e['value'] > maxY ? e['value'] : maxY;

      spots.add(FlSpot(i.toDouble() + 1, e['value']));
    }

    return LineChartData(
      gridData: FlGridData(
        show: false,
        // checkToShowVerticalLine: (d) => false,
        // drawVerticalLine: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) =>
              const TextStyle(color: Color(0xff68737d), fontSize: 12),
          getTitles: (value) {
            double dv = lineList[value.toInt() - 1]['key'];
            return dv.toInt().toString();
          },
          margin: 8,
        ),
        // leftTitles: SideTitles(
        //   showTitles: true,
        //   interval: 1,
        //   getTextStyles: (context, value) => const TextStyle(
        //     color: Color(0xff67727d),
        //     fontSize: 12,
        //   ),
        //   getTitles: (value) {
        //     if (value/maxY == 1) {

        //     }
        //     return value.toString();
        //   },
        //   reservedSize: 22,
        //   margin: 5,
        // ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 0)),
      // minX: 0,
      maxX: 7,
      // minY: 0,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: false,
          colors: gradientColors,
          barWidth: 3.r,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
