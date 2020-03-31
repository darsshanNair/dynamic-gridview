import 'package:carsome_test/backend/services/AlbumServices.dart';
import 'package:flutter/material.dart';

import 'package:carsome_test/models/Album.dart';

class HomeViewModel with ChangeNotifier {
  List<Album> albumList;
  AlbumServices albumServices = AlbumServices();

  HomeViewModel() {
    getInitialList();
  }

  Future<List<Album>> getInitialList() async {
    albumList = [];
    albumList = await albumServices.fetchAlbum(1);
    notifyListeners();
    return albumList;
  }

  Future<List<Album>> getNextList() async {
    albumList = [];
    albumList = await albumServices.fetchAlbum(2);
    notifyListeners();
    return albumList;
  }
}
