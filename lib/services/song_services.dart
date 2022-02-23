import 'package:duu_chin/request/http_utils.dart';

class SongService {
  static const String rootPath = 'api/song';
  static const String listPath = '$rootPath/list';
  static const String infoPath = '$rootPath/info';

  Future getSongs({int page = 1, int limit = 10}) async {
    final response = await HttpUtils.get(
      'http://localhost:3080/song/list',
    );

    Map<String, dynamic> result = response('page');
    print(result);
    return result;
  }
}