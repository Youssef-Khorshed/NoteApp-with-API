// ignore_for_file: deprecated_member_use

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_task/Core/strings.dart';
import 'package:todo_task/Features/Todo/Data/DataSource/remote.dart';
import 'package:todo_task/Features/Todo/Data/Model/todoModel.dart';

import 'remtoeTodo_test.mocks.dart';

void main() {
  late RemoteTodoImp remote;
  group('addTask', () {
    Dio dio = Dio(); // Create a Dio instance for testing
    remote = MockRemoteTodoImp();
    setUp(() {
      dio.httpClientAdapter =
          DefaultHttpClientAdapter(); // Use default HttpClientAdapter
    });

    test('addTask returns Right with unit on successful request', () async {
      // Mock the POST request
      Either<Exception, Unit> x = const Right(unit);
      when(remote.addTask(userid: '1', task: 'Example Task'))
          .thenAnswer((realInvocation) => Future.value(x));
      // Call the addTask function
      final result = await remote.addTask(userid: '1', task: 'Example Task');

      // Verify the result
      expect(result, x);
    });
    test('addTask returns Right with unit on successful request', () async {
      // Mock the POST request
      Either<Exception, Unit> x = const Right(unit);
      when(remote.addTask(userid: '1', task: 'Example Task'))
          .thenAnswer((realInvocation) => Future.value(x));
      // Call the addTask function
      final result = await remote.addTask(userid: '1', task: 'Example Task');

      // Verify the result
      expect(result, x);
    });
    test('update Task returns Right with unit on successful request', () async {
      // Mock the POST request
      Either<Exception, Unit> match = const Right(unit);
      when(remote.updateTask(taskid: '1', completed: true))
          .thenAnswer((realInvocation) => Future.value(match));
      // Call the addTask function
      final result = await remote.updateTask(taskid: '1', completed: true);

      // Verify the result
      expect(result, match);
    });
    test('Delete task returns Right with unit on successful request', () async {
      // Mock the POST request
      Either<Exception, Unit> match = const Right(unit);
      when(remote.deleteTask(taskid: '1'))
          .thenAnswer((realInvocation) => Future.value(match));
      // Call the addTask function
      final result = await remote.deleteTask(taskid: '1');

      // Verify the result
      expect(result, match);
    });

    test('Get task returns Right with unit on successful request', () async {
      // Mock the POST request
      Either<Exception, TodoModel> match =
          Right(TodoModel(limit: 0, todos: [], skip: 0));
      when(remote.getTasks(userid: '1'))
          .thenAnswer((realInvocation) => Future.value(match));
      // Call the addTask function
      final result = await remote.getTasks(userid: '1');

      // Verify the result
      expect(result, match);
    });
  });
}
