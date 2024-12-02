import 'package:test/test.dart';
import 'package:my_flutter_070400/learn/dart/data_model.dart';

void main() {
  test('Data construction success', () {
    // Act
    Data data = Data(
      code: 0,
      method: 'GET',
      requestPrams: '11',
    );

    // Assert
    expect(data.code, 0);
    expect(data.method, 'GET');
    expect(data.requestPrams, '11');
  });

  test('Data fromJSON success', () {
    // Arrange
    final Map<String, dynamic> json = {
      "code": 0,
      "method": "GET",
      "requestPrams": "11"
    };

    // Act
    final data = Data.fromJson(json);

    // Assert
    expect(data.code, 0);
    expect(data.method, 'GET');
    expect(data.requestPrams, '11');
  });
}