import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/model/screens/filter_date_model.dart';
import 'package:conf_world/view/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FilterByDate extends StatefulWidget {
  final FilterDateModel model = FilterDateModel();

  @override
  FilterByDateState createState() => FilterByDateState();
}

class FilterByDateState extends State<FilterByDate> {

  DateTime start = DateTime.now();
  DateTime end = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 30);

  DateTimeRange _date = DateTimeRange(
      start: DateTime.now(),
      end: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 30)
  );

  void _selectDate() async {
    final DateTimeRange newDate = await showDateRangePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDateRange: _date,
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(2022, 1),
      helpText: 'Select a date range',
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Color(0xff5a189a),
            accentColor: Color(0xff5a189a),
            colorScheme: ColorScheme.dark(
              primary: Color(0xffe0aaff),
              onPrimary: Colors.black,
              surface: Color(0xffe0aaff),
              onSurface: Color(0xffe0aaff),
            ),
            dialogBackgroundColor: Color(0xffe0aaff),
          ),
          child: child,
        );
      },

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
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text("Choose Date"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: _selectDate,
                child: MyButton(name: 'Select Date'),
              ),
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () => RouteController.navigateWorldMapFilter(context, 'date', _date),
              child: MyButton(name: 'See world map'),
            ),
          ],
        ),
    );
  }
}
