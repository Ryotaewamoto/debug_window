import 'package:debug_window/debug_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget has a title and message', (tester) async {
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
  // final SamplePlatform initialPlatform = SamplePlatform.instance;

  // test('$MethodChannelSample is the default instance', () {
  //   expect(initialPlatform, isInstanceOf<MethodChannelSample>());
  // });

  // test('getPlatformVersion', () async {
  //   Sample samplePlugin = Sample();
  //   MockSamplePlatform fakePlatform = MockSamplePlatform();
  //   SamplePlatform.instance = fakePlatform;

  //   expect(await samplePlugin.getPlatformVersion(), '42');
  // });
}
