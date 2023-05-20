import 'package:http/http.dart' as http;
import 'dart:convert';

class FlickrApi {
  static Future<List> getImageByString(String tag) async {
    var tagMode = tag.contains(',') ? 'all' : 'any';
    var response = await http.get(Uri.parse(
        'https://api.flickr.com/services/feeds/photos_public.gne?tags=$tag&format=json&tagMode=$tagMode&nojsoncallback=1'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['items'];
    }
    return [];
  }
}
