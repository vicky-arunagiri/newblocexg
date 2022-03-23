import 'package:http/http.dart';
import 'package:newblocexg/model/Users.dart';

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>> getUsers() async {
    print('API CALL OUTSIDE');
    try {
      final response = await get(
        Uri.parse(url),
      );
      print('API CALL INSIDE');
      if (response.statusCode == 200) {
        print('Response : ${response.body}');
        final List<User> users = usersFromJson(response.body);

        return users;
      } else {
        throw Exception('Not getting datas');
      }
    } catch (e) {
      throw Exception('Failed');
    }
  }
}
