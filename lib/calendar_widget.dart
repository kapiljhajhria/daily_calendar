import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'dart:math';

class CalendarReport extends StatefulWidget {
  @override
  _CalendarReportState createState() => _CalendarReportState();
}

class _CalendarReportState extends State<CalendarReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('calendar'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: CalendarCarousel(
//          thisMonthDayBorderColor: Colors.grey,
          customDayBuilder: (
            bool isSelectable,
            int index,
            bool isSelectedDay,
            bool isToday,
            bool isPrevMonthDay,
            TextStyle textStyle,
            bool isNextMonthDay,
            bool isThisMonthDay,
            DateTime day,
          ) {
            return Container(
                width: double.infinity,
                height: double.infinity,
                color: ColorTween(
                  begin: Color(0xff57BB8A),
                  end: Color(0xFFFBC02D), //FFD666
                ).transform(Random(day.day).nextDouble()),
                child: Center(child: Text(day.day.toString())));
          },
          weekFormat: false,
          height: 420.0,
          daysHaveCircularBorder: false,
        ),
      ),
    );
  }
}
