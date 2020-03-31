import 'package:carsome_test/models/Album.dart';
import 'package:carsome_test/viewmodels/HomeViewModel.dart';
import 'package:carsome_test/widget/AlbumIcon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel _homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Flutter")),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("1"),
                onPressed: () {
                  _homeViewModel.getInitialList();
                },
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                child: Text("2"),
                onPressed: () {
                  _homeViewModel.getNextList();
                },
              ),
            ],
          ),
          _homeViewModel.albumList.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: OrientationBuilder(
                    builder: (context, orientation) {
                      return GridView.builder(
                        padding: EdgeInsets.only(
                            top: 10, left: 16, right: 16, bottom: 10),
                        itemCount: _homeViewModel.albumList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              orientation == Orientation.portrait ? 2 : 5,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                        ),
                        itemBuilder: (context, index) {
                          Album album = _homeViewModel.albumList[index];
                          return AlbumIcon(
                            albumTitle: album.title,
                            albumImageUrl: album.thumbnailUrl,
                          );
                        },
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
