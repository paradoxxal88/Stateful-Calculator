// Basic smoke test for the calculator app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sionillo_calculator/main.dart';

void main() {
  testWidgets('Calculator screen renders its main controls', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CalculatorApp());

    expect(find.text('My Stateful Calculator'), findsOneWidget);
    expect(find.text('BASIC CALCULATOR'), findsOneWidget);
    expect(find.text('First Number'), findsOneWidget);
    expect(find.text('Second Number'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('Clear'), findsOneWidget);
  });

  testWidgets('Calculator uses the purple dark theme', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const CalculatorApp());

    final BuildContext context = tester.element(find.byType(Scaffold));
    final ThemeData theme = Theme.of(context);

    expect(theme.scaffoldBackgroundColor, const Color(0xFF121214));
    expect(theme.appBarTheme.backgroundColor, const Color(0xFF2A2A2E));

    final TextField firstField = tester.widget<TextField>(
      find.byType(TextField).first,
    );
    expect(firstField.decoration?.fillColor, const Color(0xFF2A2A2E));
  });
}
