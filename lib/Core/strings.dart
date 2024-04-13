const String cashedProducts = 'cashed';
const String apifailure = "data not respond";
const String addTaskFailure = "Add  task problem ";
const String deleteTaskFailure = "Delete task problem ";
const String updateTaskFailure = "Update task problem ";
const String getTaskFailure = "Get task problem ";
const String cashfailure = "not cashed data";
const String authfailure = "username or password is wrong";
const String internetfailure = "No Internet Connection";
const String unexpectedfailure = "Opps something is woring please try again..!";
const String userKey = "User";
const String todoKey = "Todo";
String applang = 'en';

const String baseUrl = 'https://dummyjson.com/';
const String loginUser = '${baseUrl}auth/login';
const String addTodo = '${baseUrl}todos/add';
String delete_update({required String todoID}) => '${baseUrl}todos/$todoID';
String getTodo({String? limit, String? skip}) =>
    '${baseUrl}todos?limit=${limit ?? '0'}&skip=${skip ?? '0'}';
const String pageviewImg1 =
    'https://drive.google.com/uc?export=view&id=1zhSdES1D_2YAjDXGutOjDDOLKxg1UqEj';
const String pageviewImg2 =
    'https://drive.google.com/uc?export=view&id=12x0WWHzPw8SEYbTxJK5ag4JBj5t6dQp8';
const String pageviewImg3 =
    'https://drive.google.com/uc?export=view&id=1ARQS_gXDAbSDkRw6YNV6RKkFf7Dj-w_m';

Map<String, String> headers({String? token}) {
  return {
    'Content-type': 'application/json',
  };
}
