import 'package:debug_window/debug_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DebugWindow has a close icon', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: const DebugWindow(
            child: Center(
              child: Text('test'),
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.close), findsOneWidget);
  });

  testWidgets('DebugWindow has sample data', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: const DebugWindow(
            debugContent: Text('debug text'),
            child: Center(
              child: Text('test'),
            ),
          ),
        ),
      ),
    );

    // Verify that our debug window has a text.
    expect(find.text('debug text'), findsOneWidget);

    // Tap the 'x' icon and trigger a frame.
    expect(find.byIcon(Icons.close), findsOneWidget);
    await tester.tap(find.byIcon(Icons.close));
    await tester.pump();

    // Verify that our debug window is closed.
    expect(find.text('debug text'), findsNothing);
  });

  testWidgets('DebugWindow is not visible', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: const DebugWindow(
            debugContent: Text('debug text'),
            isEnable: false,
            child: Center(
              child: Text('test'),
            ),
          ),
        ),
      ),
    );

    // Verify that our debug window doesn't have text and icon.
    expect(find.text('debug text'), findsNothing);
    expect(find.byIcon(Icons.close), findsNothing);
  });
}
