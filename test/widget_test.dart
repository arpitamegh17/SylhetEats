import 'package:flutter_test/flutter_test.dart';
import 'package:sylhet_eats/main.dart';

void main() {
  testWidgets('SylhetEats Login Page Test', (WidgetTester tester) async {
    // Run the application
    await tester.pumpWidget(const SylhetEatsApp());

    // Check app title
    expect(find.text('Welcome to SylhetEats'), findsOneWidget);

    // Check email field
    expect(find.text('Email Address'), findsOneWidget);

    // Check password field
    expect(find.text('Password'), findsOneWidget);

    // Check login button
    expect(find.text('Login'), findsOneWidget);

    // Check register option
    expect(find.text('Register'), findsOneWidget);
  });

  testWidgets('Navigate to Registration Page', (WidgetTester tester) async {
    await tester.pumpWidget(const SylhetEatsApp());

    // Tap Register button
    await tester.tap(find.text('Register'));

    await tester.pumpAndSettle();

    // Check Registration Page
    expect(find.text('Join SylhetEats'), findsOneWidget);

    expect(find.text('Full Name'), findsOneWidget);

    expect(find.text('Phone Number'), findsOneWidget);

    expect(find.text('Create Account'), findsOneWidget);
  });
}
