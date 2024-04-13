import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_task/Core/internet.dart';

import 'internet_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late InternetConnectionChecker internetConnectionChecker;
  late NetworkInfoImpl networkInfoImpl;
  setUp(() {
    internetConnectionChecker = MockInternetConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(internetConnectionChecker);
  });
  test('if connected', () async {
    when(internetConnectionChecker.hasConnection)
        .thenAnswer((realInvocation) => Future.value(true) // if connected

            );

    final res = await networkInfoImpl.isConnected;
    expect(res, true);
  });
}
