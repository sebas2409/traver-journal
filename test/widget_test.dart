import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cs3_project/main.dart';

void main() {
  testWidgets('Travel Journal smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const TravelJournalApp());

    expect(find.text('My Travels'), findsOneWidget);
    expect(find.text('No entries yet. Start exploring!'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text('New Travel Entry'), findsOneWidget);
  });
}
