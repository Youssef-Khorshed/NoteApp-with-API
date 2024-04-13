import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class InternetFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ApiFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class AuthFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CashFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class GetTaskFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class AddTaskFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class DeleteTaskFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UpdateTaskFailure extends Failure {
  @override
  List<Object?> get props => [];
}
