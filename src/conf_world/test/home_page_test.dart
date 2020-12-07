// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:conf_world/view/filter_conference.dart';
import 'package:conf_world/view/filter_type.dart';
import 'package:conf_world/view/navigation.dart';
import 'package:conf_world/view/world_map.dart';
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
    await tester.tap(find.ancestor(
        of: find.text('See World Map'), matching: find.byType(FlatButton)));
    await tester.pumpAndSettle();

    // Verify that we are on the world map page.
    expect(find.byType(FlutterMap), findsOneWidget);
  });

  testWidgets('Filter Conferences button test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Navigation(),
    ));

    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);

    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    expect(find.byType(SearchConference), findsOneWidget);
  });

  testWidgets('Filter Conferences by type test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SearchConference(),
    ));

    expect(find.text('Type'), findsOneWidget);
    expect(find.text('Date'), findsOneWidget);
    expect(find.text('Saved Conferences'), findsOneWidget);

    await tester.tap(find.ancestor(
        of: find.text('Type'), matching: find.byType(FlatButton)));
    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsOneWidget);
  });

  testWidgets('See world map without filters', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: FilterByType(),
    ));

    expect(find.text('Computer Science Conferences'), findsOneWidget);
    expect(find.text('Math Conferences'), findsOneWidget);
    expect(find.text('See world map without filters'), findsOneWidget);

    await tester.tap(find.ancestor(
        of: find.text('See world map without filters'),
        matching: find.byType(FlatButton)));
    await tester.pumpAndSettle();

    expect(find.byType(FlutterMap), findsOneWidget);
  });

  testWidgets('Testing Navigation between States', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(MaterialApp(
      home: Navigation(),
    ));

    final NavigationState navigationState =
        tester.state(find.byType(Navigation));

    final index = navigationState.selectedIndex;

    /*
    await tester.tap(find.ancestor(
        of: find.text('Map'), matching: find.byType(BottomNavigationBarItem)));
    await tester.pumpAndSettle();
    */
    // Verify that we are on the world map page.
    expect(index, 0);
  });

  testWidgets('Testing Default Navigation State', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(MaterialApp(
      home: Navigation(),
    ));

    final NavigationState navigationState =
        tester.state(find.byType(Navigation));

    final index = navigationState.selectedIndex;

    /*
    await tester.tap(find.ancestor(
        of: find.text('Map'), matching: find.byType(BottomNavigationBarItem)));
    await tester.pumpAndSettle();
    */
    // Verify that we are on the world map page.
    expect(index, 0);
  });

  testWidgets('Testing switching to Filter Conferences State',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    //Build Navigation class
    await tester.pumpWidget(MaterialApp(
      home: Navigation(),
    ));

    // Tapping the icon to switch state
    var icon = find.byIcon(Icons.search);
    await tester.tap(icon);

    // Getting the final value
    final NavigationState navigationState =
        tester.state(find.byType(Navigation));
    await tester.pumpAndSettle();

    final index = navigationState.selectedIndex;

    // Verify that we are in the filter conferences Menu
    expect(index, 1);
    expect(find.byType(SearchConference), findsOneWidget);
  });

  testWidgets('Testing switching to Filter Conferences State',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    //Build Navigation class
    await tester.pumpWidget(MaterialApp(
      home: Navigation(),
    ));

    // Tapping the icon to switch state
    var icon = find.byIcon(Icons.search);
    await tester.tap(icon);

    var iconHome = find.byIcon(Icons.home);

    await tester.tap(iconHome);

    // Getting the final value
    final NavigationState navigationState =
        tester.state(find.byType(Navigation));
    await tester.pumpAndSettle();

    final index = navigationState.selectedIndex;
    // Verify that we are int eh filter conferences Menu
    expect(index, 0);
    // The index is correct but the widget is not working properly
    expect(find.byType(MapRoute), findsOneWidget);
  });
}