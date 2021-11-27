import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('flutter reversi app test', () {
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver.close();
      }
    });

    var textField = find.byType("TextField");
    var button = find.text("Reverse");
    var reversed = find.text("olleH");
    test("reverses the string", () async {
      await driver.tap(textField);
      await Future.delayed(Duration(seconds: 2));
      await driver.enterText("Hello");
      await Future.delayed(Duration(seconds: 2));
      await driver.waitForAbsent(reversed);
      await Future.delayed(Duration(seconds: 2));
      await driver.tap(button);
      await Future.delayed(Duration(seconds: 2));
      await driver.waitFor(reversed);
      await Future.delayed(Duration(seconds: 2));
      await driver.waitUntilNoTransientCallbacks();
      await Future.delayed(Duration(seconds: 2));
      assert(reversed != null);
    });
  });
}
