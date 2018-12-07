import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_sample_app/src/blocs/scenery_bloc.dart';
import 'package:flutter_app_bloc_sample_app/src/models/image_model.dart';

class SceneryList extends StatelessWidget {
  final _bloc = SceneryBloc();

  @override
  Widget build(BuildContext context) {
    _bloc.fetchAllScenery();
    return Scaffold(
      appBar: AppBar(
        title: Text("景色画像一覧"),
      ),
      body: StreamBuilder(
          stream: _bloc.allScenery,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return _buildList(snapshot);
            } else if (snapshot.hasError) {

              return Text("エラーが発生しました" + snapshot.error.toString());
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Widget _buildList(AsyncSnapshot<List<ImageModel>> snapshot) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemBuilder: (_, index) {
        ImageModel model = snapshot.data[index];
        return Image.network(model.imageUrl);
      },
      itemCount: snapshot.data.length,
    );
  }
}
