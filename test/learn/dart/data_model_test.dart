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

  test('DataModel construction success', () {
    // Act
    DataModel dataModel = DataModel(
      code: 0,
      data: Data(
        code: 0,
        method: 'GET',
        requestPrams: '11',
      ),
      msg: 'success',
    );

    // Assert
    expect(dataModel.code, 0);
    expect(dataModel.data!.code, 0);
    expect(dataModel.data!.method, 'GET');
    expect(dataModel.data!.requestPrams, '11');
    expect(dataModel.msg, 'success');
  });

  test("DataModel fromJson success", () {
    // Arrange
    final Map<String, dynamic> json = {
      "code": 11,
      "msg": "success",
      "data": {"code": 12, "method": "GET", "requestPrams": "11"}
    };

    // Act
    final dataModel = DataModel.fromJson(json);

    // Assert
    expect(dataModel.code, 11);
    expect(dataModel.data!.code, 12);
    expect(dataModel.data!.method, 'GET');
    expect(dataModel.data!.requestPrams, '11');
    expect(dataModel.msg, 'success');
  });
}
