import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ggame/data/local/database.dart';
import 'package:ggame/entity/favorite.dart';
import 'package:ggame/ui/favorite/components/item_favorite.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorUtil.background(),
      body: SafeArea(
        left: true,
        right: true,
        bottom: true,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: 200.0.h,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    "Favorite",
                    style: TextStyle(fontSize: 18.0.sp),
                  ),
                ),
              ),
            ];
          },
          body: FutureBuilder(
            future: _getAllFavorite(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Favorite>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              } else {
                if (snapshot.hasError) {
                  return Container();
                } else {
                  return snapshot.data!.isNotEmpty
                      ? RefreshIndicator(
                          child: ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, i) {
                              Favorite favorite = snapshot.data![i];
                              return ItemFavorite(
                                favorite: favorite,
                                confirmDismiss: (direction) async {
                                  _deleteFavorite(favorite.gameId);
                                  setState(
                                    () {
                                      _getAllFavorite();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text("Berhasil dihapus"),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          onRefresh: () => Future.delayed(
                            const Duration(seconds: 2),
                            () {
                              setState(() {
                                _getAllFavorite();
                              });
                            },
                          ),
                        )
                      : SizedBox(
                          width: size.width,
                          child: const Center(
                            child: Text(
                              "No Data",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Future<List<Favorite>> _getAllFavorite() async =>
      await db.ggameDao.getAllFavorite();

  Future<void> _deleteFavorite(int gameId) async =>
      db.ggameDao.deleteFavoriteById(gameId);
}
