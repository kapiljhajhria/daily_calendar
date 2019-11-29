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
  Animation animation;

  @override
  void initState() {
    myController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    myAnimation = Tween(begin: 0.1, end: 1.0).animate(myController);
    // TODO: implement initState
    animation = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(myController)
      ..addListener(() {
        setState(() {});
      });
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
                  color: animation.value,
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
