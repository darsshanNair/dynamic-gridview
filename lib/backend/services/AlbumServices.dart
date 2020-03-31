import 'dart:convert';

import 'package:carsome_test/app/AppStrings.dart';
import 'package:carsome_test/models/Album.dart';
import 'package:http/http.dart' as http;

class AlbumServices {
  Future<List<Album>> fetchAlbum(int albumId) async {
    final response = await http
        .get(AppStrings.apiUrl + "photos?albumId=" + albumId.toString());

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return (responseJson as List)
          .map((album) => Album.fromJson(album))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
