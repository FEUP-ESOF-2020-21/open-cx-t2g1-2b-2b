// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:conf_world/view/screens/filter_date.dart';
import 'package:conf_world/view/screens/filter_page.dart';
import 'package:conf_world/view/screens/filter_type.dart';
import 'package:conf_world/view/screens/home_page.dart';
import 'package:conf_world/view/screens/navigation.dart';
import 'package:conf_world/view/screens/saved_conferences.dart';
import 'package:conf_world/view/screens/world_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

  testWidgets('My Saved conferences menu opens properly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomePageState(),
    ));

    // Verify that we are on the home page.
    expect(find.text('My Saved Conferences'), findsOneWidget);

    // Tap the See World Map option to open the world map.
    await tester.tap(find.ancestor(
        of: find.text('My Saved Conferences'),
        matching: find.byType(FlatButton)));
    await tester.pumpAndSettle();

    // Verify that we are on the world map page.
    expect(find.byType(SavedConferencesState), findsOneWidget);
  });

  testWidgets('Filter Conferences by Type', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: FilterPage(),
    ));

    expect(find.text('Filter by Type'), findsOneWidget);

    await tester.tap(find.ancestor(
        of: find.text('Filter by Type'), matching: find.byType(FlatButton)));
    await tester.pumpAndSettle();

    expect(find.byType(FilterByType), findsOneWidget);
  });

  testWidgets('Filter Conferences by Date', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: FilterPage(),
    ));

    expect(find.text('Filter by Date'), findsOneWidget);

    await tester.tap(find.ancestor(
        of: find.text('Filter by Date'), matching: find.byType(FlatButton)));
    await tester.pumpAndSettle();

    expect(find.byType(FilterByDate), findsOneWidget);
  });

  testWidgets('Filter Conferences Saved Conferences',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: FilterPage(),
    ));

    expect(find.text('Saved Conferences'), findsOneWidget);

    await tester.tap(find.ancestor(
        of: find.text('Saved Conferences'), matching: find.byType(FlatButton)));
    await tester.pumpAndSettle();

    expect(find.byType(Navigation), findsOneWidget);
  });

  testWidgets('Filter Conferences Without Filters parameter',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: FilterPage(),
    ));

    expect(find.text('Without Filters'), findsOneWidget);

    await tester.tap(find.ancestor(
        of: find.text('Without Filters'), matching: find.byType(FlatButton)));
    await tester.pumpAndSettle();

    expect(find.byType(Navigation), findsOneWidget);
  });

  testWidgets('Filter Conferences button test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Navigation(type: 'false', filter: 'false'),
    ));

    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);

    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    expect(find.text('Filter by Type'), findsOneWidget);
    expect(find.byType(FilterPage), findsOneWidget);
  });

  testWidgets('Testing Navigation between States', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(MaterialApp(
      home: Navigation(type: 'false', filter: 'false'),
    ));

    final NavigationState navigationState =
        tester.state(find.byType(Navigation));

    final index = navigationState.selectedIndex;

    // Verify that we are on the world map page.
    expect(index, 0);
  });

  testWidgets('Testing Default Navigation State', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(MaterialApp(
      home: Navigation(type: 'false', filter: 'false'),
    ));

    final NavigationState navigationState =
        tester.state(find.byType(Navigation));

    final index = navigationState.selectedIndex;
    // Verify that we are on the world map page.
    expect(index, 0);
  });

  testWidgets('Testing switching to Filter Conferences State',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    //Build Navigation class
    await tester.pumpWidget(MaterialApp(
      home: Navigation(type: 'false', filter: 'false'),
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
    expect(find.byType(FilterPage), findsOneWidget);
  });

  testWidgets(
      'Testing switching to Filter Conferences State and Back to the Map',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    //Build Navigation class
    await tester.pumpWidget(MaterialApp(
      home: Navigation(type: 'false', filter: 'false'),
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
    expect(find.byType(FlutterMap), findsOneWidget);
  });
}
