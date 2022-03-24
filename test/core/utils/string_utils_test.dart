import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_task/core/utils/string_utils.dart';

main() {
  group('isNotNullOrEmpty method', () {
    test('should return false if entry is null', () {
      // act
      final result = StringUtils.isNotNullOrEmpty(null);
      // assert
      expect(result, false);
    });

    test('should return false if entry is an empty string', () {
      // act
      final result = StringUtils.isNotNullOrEmpty('');
      // assert
      expect(result, false);
    });

    test('should return true if entry is not null or an empty string', () {
      // act
      final result = StringUtils.isNotNullOrEmpty('A');
      // assert
      expect(result, true);
    });
  });
}
