import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class CalendarReport extends StatefulWidget {
  @override
  _CalendarReportState createState() => _CalendarReportState();
}

class _CalendarReportState extends State<CalendarReport>
    with SingleTickerProviderStateMixin {
  AnimationController myController;
  Animation myAnimation;

  @override
  void initState() {
    myController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    myAnimation = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(myController)
      ..addListener(() {
        setState(() {});
      });
    // TODO: implement initState
    myController.forward();
    super.initState();
  }

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
            return Center(
              child: Container(
                  color: myAnimation.value,
                  child: Text(day.day.toString())),
            );
          },
          weekFormat: false,
          height: 420.0,
          daysHaveCircularBorder: false,
        ),
      ),
    );
  }
}
