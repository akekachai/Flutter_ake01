import 'package:http/http.dart' as http;

class ApiProvider {
  ApiProvider();

  String apiUrl =
      'https://script.google.com/macros/s/AKfycbwYV-e64GcgUzvJ8DOT6DD7f0Z3KKbYrVlJHLYu-AeBWFNmBkz95S-tQwR5dDd52fIkaw/exec?path=/apiv&query=';

  Future<http.Response> getMember(String username) async {
    return await http.get(Uri.parse(apiUrl + '{"names":"' + username + '"}'));
    //{"userid_line":"2976405809780"}
  }

  Future<http.Response> getPostView(int id) async {
    return await http.get(Uri.parse(apiUrl + '{"userid":"2976405809780"}'));
  }
}
