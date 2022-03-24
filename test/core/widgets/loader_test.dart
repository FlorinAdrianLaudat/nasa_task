import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_task/core/widgets/loader.dart';

import '../../helper.dart';

main() {
  group('widget test', () {
    testWidgets('test loader has CircularProgressIndicator',
        (WidgetTester tester) async {
      // arrange
      var widget = Helper.makeTestableCommonWidget(const Scaffold(
        body: LoaderWidget(),
      ));
      // act
      await tester.pumpWidget(widget);
      await tester.pump();
      // assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      final progressIndicator =
          tester.firstWidget(find.byType(CircularProgressIndicator))
              as CircularProgressIndicator;
      expect(progressIndicator.strokeWidth, 2.5);
    });
  });
}
