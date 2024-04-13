import 'package:todo_task/Core/strings.dart';
import '../../Core/error.dart';

String getfailure({required Failure failure}) {
  switch (failure.runtimeType) {
    case CashFailure:
      {
        return apifailure;
      }
    case InternetFailure:
      {
        return internetfailure;
      }
    case ApiFailure:
      {
        return apifailure;
      }
    case AuthFailure:
      {
        return apifailure;
      }
    case UpdateTaskFailure():
      {
        return apifailure;
      }
    case DeleteTaskFailure():
      {
        return apifailure;
      }
    case GetTaskFailure():
      {
        return apifailure;
      }
    case AddTaskFailure():
      {
        return apifailure;
      }

    default:
      {
        return unexpectedfailure;
      }
  }
}
