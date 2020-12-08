import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/model/screens/filter_date_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FilterByDate extends StatefulWidget {
  final FilterDateModel model = FilterDateModel();

  @override
  FilterByDateState createState() => FilterByDateState();
}

class FilterByDateState extends State<FilterByDate> {

  DateTime start = DateTime.parse("2020-11-17");
  DateTime end = DateTime(2020, 11, 24);

  DateTimeRange _date = DateTimeRange(
    start: DateTime.parse("2020-11-17"),
    end: DateTime(2020, 11, 24),
  );

  void _selectDate() async {
    final DateTimeRange newDate = await showDateRangePicker(
      context: context,
      initialDateRange: _date,
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(2022, 1),
      helpText: 'Select a date range',
    );
    if (newDate != null) {
      setState(() {
        start = newDate.start;
        end = newDate.end;
        _date = newDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _selectDate,
              child: Text('SELECT DATE RANGE'),
            ),
            ElevatedButton(
              onPressed: () => RouteController.navigateWorldMapFilter(context, 'date', _date),
              child: Text('See world map'),
            ),
            Text(
              _date.toString(),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
