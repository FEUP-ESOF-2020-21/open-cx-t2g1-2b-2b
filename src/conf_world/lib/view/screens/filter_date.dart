import 'package:conf_world/model/screens/filter_date_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FilterByDate extends StatefulWidget {
  final FilterDateModel model = FilterDateModel();

  @override
  FilterByDateState createState() => FilterByDateState();
}

class FilterByDateState extends State<FilterByDate> {
  DateTimeRange _date = DateTimeRange(
    start: DateTime(2020, 11, 17),
    end: DateTime(2020, 11, 24),
  );

  void _selectDate() async {
    final DateTimeRange newDate = await showDateRangePicker(
      context: context,
      initialDateRange: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date range',
    );
    if (newDate != null) {
      setState(() {
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
            SizedBox(height: 8),
            Center(
              child: Text(
                'Selected date range: \n$_date',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
