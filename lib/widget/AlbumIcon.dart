import 'package:flutter/material.dart';

class AlbumIcon extends StatelessWidget {
  final String albumTitle;
  final String albumImageUrl;

  AlbumIcon({this.albumTitle, this.albumImageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Column(children: <Widget>[
        Image(
          image: NetworkImage(albumImageUrl),
        ),
        Text(albumTitle, maxLines: 1, overflow: TextOverflow.ellipsis),
      ]),
    );
  }
}
