import 'package:flutter/material.dart';
import 'package:ggame/data/local/database.dart';
import 'package:ggame/entity/favorite.dart';
import 'package:ggame/utils/color_util.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late GGameDatabse db;

  @override
  void initState() {
    super.initState();
    $FloorGGameDatabse.databaseBuilder('ggame.db').build().then((value) async {
      db = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorUtil.background(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            title: const Text("Favorite"),
            pinned: true,
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            backgroundColor: Colors.black,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text("Favorite"),
            ),
          ),
          SliverFillRemaining(
            child: FutureBuilder(
                future: _getAllFavorite(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Favorite>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else {
                    if (snapshot.hasError) {
                      return Container();
                    } else {
                      return RefreshIndicator(
                          child: ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, i) {
                            //Favorite favorite = snapshot.data![i];
                            return const Card();
                          }),
                          onRefresh: () =>
                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  _getAllFavorite();
                                });
                              }));
                    }
                  }
                }),
          )
        ],
      ),
    ));
  }

  Future<List<Favorite>> _getAllFavorite() async {
    return await db.ggameDao.getAllFavorite();
  }
}
