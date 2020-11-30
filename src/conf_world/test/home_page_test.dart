// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:conf_world/view/filter_conference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:conf_world/view/home_page.dart';
import 'package:flutter_map/flutter_map.dart';

void main() {

  testWidgets('World map opens properly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomePageState(),
    ));

    // Verify that we are on the home page.
    expect(find.text('See World Map'), findsOneWidget);

    // Tap the See World Map option to open the world map.
    await tester.tap(find.ancestor(of: find.text('See World Map'), matching: find.byType(FlatButton)));
    await tester.pumpAndSettle();

    // Verify that we are on the world map page.
    expect(find.byType(FlutterMap), findsOneWidget);
  });

  testWidgets('Filter Conferences by type test', (WidgetTester tester) async {
    
    await tester.pumpWidget(MaterialApp(
      home: SearchConference(),
    ));

    //expect(find.text('Type'), findsOneWidget);

    //await tester.tap(find.byType(FlatButton));

  });

}
