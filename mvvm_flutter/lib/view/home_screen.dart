import 'package:flutter/material.dart';
import 'package:mvvm_flutter/utils/routes/routes_names.dart';
import 'package:mvvm_flutter/utils/utils.dart';
import 'package:mvvm_flutter/view_model/home_view_model.dart';
import 'package:mvvm_flutter/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPref = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                userPref.removeUser().then((value) {
                  Navigator.pushNamed(context, RoutesNames.login);
                });
              },
              child: const Center(child: Text("Logout")))
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(builder: (context, value, _) {
          switch (value.moviesList.status) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.moviesList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.moviesList.data!.movies!.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      title: Text(value.moviesList.data!.movies![index].title
                          .toString()),
                      subtitle: Text(value.moviesList.data!.movies![index].year
                          .toString()),
                      leading: Image.network(
                        value.moviesList.data!.movies![index].posterurl
                            .toString(),
                        errorBuilder: (context, error, stack) {
                          return Icon(
                            Icons.error,
                            color: Colors.red,
                          );
                        },
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(Utils.avgRating(value
                                  .moviesList.data!.movies![index].ratings!)
                              .toString()),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        ],
                      ),
                    ));
                  });
          }
          return Container();
        }),
      ),
    );
  }
}
