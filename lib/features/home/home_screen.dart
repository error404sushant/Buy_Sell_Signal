import 'package:buy_and_sell/features/home/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc(context);
    homeBloc.init();
    homeBloc.apiData(homeBloc.coins[0].ticker);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print("Hello");
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Column(
      children: [
        Expanded(child: detail()),
        Expanded(child: name()),
      ],
    );
  }

  Widget detail() {
    return StreamBuilder<HomeState>(
        initialData: HomeState.Loading,
        stream: homeBloc.HomeCtrl.stream,
        builder: (context, snapshot) {
          if (snapshot.data == HomeState.Failed) {
            return Center(child: Text("${homeBloc.errorMessage}"));
          }
          if (snapshot.data == HomeState.Loading)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Center(
              child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      "${homeBloc.selectedCoin.toString()}",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      "${homeBloc.buySellModel.description}. ",
                      style: TextStyle(fontSize: 30, wordSpacing: 5),
                    )),
              ],
            ),
          ));
        });
  }

  Widget name() {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: homeBloc.coins.length,
      itemBuilder: (context, index) {
        return ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(20),
            child: CupertinoButton(
                color: Colors.red,
                child: Text("${homeBloc.coins[index].coin}"),
                onPressed: () =>
                    homeBloc.apiData(homeBloc.coins[index].ticker)));
      },
    );
  }
}
