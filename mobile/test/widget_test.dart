import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const SignSpeakApp());

    expect(find.text('SignSpeak AI'), findsOneWidget);
  });
}   