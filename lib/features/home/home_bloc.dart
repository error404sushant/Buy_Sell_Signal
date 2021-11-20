import 'dart:async';
import 'dart:io';

import 'package:buy_and_sell/resource/api_error_exception.dart';
import 'package:buy_and_sell/resource/buy_sell_responce.dart';
import 'package:buy_and_sell/resource/coinModel.dart';
import 'package:buy_and_sell/resource/http_service.dart';
import 'package:flutter/cupertino.dart';

import '../../resource/coinModel.dart';

enum HomeState { Loading, Success, Failed }

class HomeBloc {
  late BuySellModel buySellModel;
  late HttpService httpService;

  late String selectedCoin = "";
  late String errorMessage = "";
  BuildContext context;

  HomeBloc(this.context);

  final HomeCtrl = StreamController<HomeState>.broadcast();

  List<CoinModel> coins = [];

  //region coin and ticker
  void init() {
    httpService = HttpService();
    coins.add(CoinModel("Bitcoin", "BTC"));
    coins.add(CoinModel("Ethereum", "ETH"));
    coins.add(CoinModel("Cardano", "ADA"));
    coins.add(CoinModel("Light Coin", "LTC"));
    coins.add(CoinModel("Polkadot", "DOT"));
    coins.add(CoinModel("Ripple", "XRP"));
    coins.add(CoinModel("Stellar", "XLM"));
    coins.add(CoinModel("Binance", "BNB"));
  }

  //endregion

  //region api call
  void apiData(String name) async {
    try {
      HomeCtrl.sink.add(HomeState.Loading);
      buySellModel = await httpService.getPrice(name);
      selectedCoin = name;
      print(name);
      HomeCtrl.sink.add(HomeState.Success);
    } on SocketException catch (vhj) {
      print("no internet");
    } on ApiErrorException catch (error) {
      print(error.message);
      HomeCtrl.sink.add(HomeState.Failed);
      errorMessage = error.message!;
    } catch (exception, stacktrace) {
      print(exception);
      print(stacktrace);
      errorMessage = exception.toString();
      HomeCtrl.sink.add(HomeState.Failed);
    } finally {}
  }
//endregion

}
