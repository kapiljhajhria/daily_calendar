import 'package:flutter/material.dart';


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

    );
  }
}
