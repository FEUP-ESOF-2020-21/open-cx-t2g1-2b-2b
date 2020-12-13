import 'package:conf_world/controller/route_controller.dart';
import 'package:conf_world/model/screens/filter_date_model.dart';
import 'package:conf_world/view/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterByDate extends StatefulWidget {
  @override
  FilterByDateState createState() => FilterByDateState();
}

class FilterByDateState extends State<FilterByDate> {
  final FilterDateModel model = FilterDateModel();

  DateTime start = DateTime.now();
  DateTime end = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 30);

  DateTimeRange _date = DateTimeRange(
      start: DateTime.now(),
      end: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 30));

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
            primaryColor: Color(0xFF212121),
            colorScheme: ColorScheme.dark(
              primary: Color(0xffF4845F),
              onPrimary: Color(0xFF212121),
              surface: Color(0xFF212121),
              onSurface: Color(0xffF4845F),
            ),
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

  Widget buildImage(BuildContext context) {
    return Image(image: AssetImage('assets/img/calendar.png'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: model.backgroundColor,
      appBar: AppBar(
        title: Text(model.appBarName),
        centerTitle: true,
        backgroundColor: model.appBarBackgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.5,
              child: buildImage(context)),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Text(
                'Selected First Date: ' +
                    _date.start.year.toString() +
                    '/' +
                    _date.start.month.toString() +
                    '/' +
                    _date.start.day.toString(),
                style: TextStyle(color: model.textDateColor, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Text(
                'Selected End Date: ' +
                    _date.end.year.toString() +
                    '/' +
                    _date.end.month.toString() +
                    '/' +
                    _date.end.day.toString(),
                style: TextStyle(color: model.textDateColor, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: _selectDate,
            child: MyButton(name: model.optionA),
          ),
          FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () => RouteController.navigateWorldMapFilter(
                context, model.typeA, _date),
            child: MyButton(name: model.optionB),
          ),
        ],
      ),
    );
  }
}
