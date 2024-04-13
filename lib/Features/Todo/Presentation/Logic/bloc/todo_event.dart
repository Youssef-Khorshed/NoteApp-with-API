part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTaskEvent extends TodoEvent {
  String userid, task;
  bool? completed;
  AddTaskEvent({required this.userid, required this.task, bool? completed});
  List<Object?> get props => [userid, task, completed];
}

class DeleteTaskEvent extends TodoEvent {
  String taskid;
  DeleteTaskEvent({required this.taskid});
  List<Object?> get props => [taskid];
}

class UpdateTaskEvent extends TodoEvent {
  String taskid;
  bool? completed;
  UpdateTaskEvent({required this.taskid, this.completed});
  List<Object?> get props => [taskid, completed];
}

class GetTaskEvent extends TodoEvent {
  String userid;
  String? limit, skip;
  GetTaskEvent({
    required this.userid,
    this.limit,
    this.skip,
  });
  List<Object?> get props => [userid, limit, skip];
}

class SearchData extends TodoEvent {
  String? query;
  SearchData({this.query});
  List<Object?> get props => [query];
}
