import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cejiu/app/ui/theme/app_text_util.dart';

class MarketLineChart extends StatefulWidget {
  final List<dynamic> lineDataList;
  final String? change;
  final String? price;

  const MarketLineChart(
      {required this.lineDataList, this.change, this.price, Key? key})
      : super(key: key);

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<MarketLineChart> {
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
                        child: Text(widget.price ?? '',
                            style: SeaFont.s16FontTextStyle())),
                    Container(
                        padding: EdgeInsets.all(5.r),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            color: Colors.redAccent),
                        child: Text('${widget.change ?? ''}%',
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

  LineChartData mainData(List<dynamic> lineList) {
    List<FlSpot> spots = [];
    double maxY = 0;
    for (int i = 0; i < lineList.length; i++) {
      Map e = lineList[i];
      maxY = e['value'] > maxY ? e['value'] : maxY;

      spots.add(FlSpot(i.toDouble() + 1, e['value']));
    }
    maxY = maxY < 0.4 ? 0.4 : maxY;
    // print(spots);

    return LineChartData(
      gridData: FlGridData(
        show: false,
        // checkToShowVerticalLine: (d) => false,
        // drawVerticalLine: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        // topTitles: AxisTitles(sideTitles: SideTitles(sideTitles: false)),
        // rightTitles: AxisTitles(sideTitles: SideTitles(sideTitles: false)),
        // bottomTitles: AxisTitles(sideTitles: SideTitles({

        // }

        // reservedSize: 22,
        // interval: 1,
        // getTextStyles: (context, value) =>
        //     const TextStyle(color: Color(0xff68737d), fontSize: 12),
        // getTitles: (value) {
        //   return lineList[value.toInt() - 1]['key'];
        // },
        // margin: 8,
        // )),
        // leftTitles: SideTitles(
        //   showTitles: true,
        //   interval: 1,
        //   getTextStyles: (context, value) => const TextStyle(
        //     color: Color(0xff67727d),
        //     fontSize: 12,
        //   ),
        //   getTitles: (value) {
        //     print(value);
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
          color: Color.fromRGBO(255, 182, 0, 1),
          barWidth: 3.r,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Color.fromRGBO(255, 182, 0, 0.3),
          ),
        ),
      ],
    );
  }
}
