import 'package:map_view/map_view.dart';

class ITCalendarMap {
  static ITCalendarMap get instance => new ITCalendarMap();
  static ITCalendarMap _instance;

  factory ITCalendarMap() {
    if (_instance == null) {
      _instance = new ITCalendarMap._internal();
      _instance._init();
    }
    return _instance;
  }
  ITCalendarMap._internal();

  /// 初期化処理
  _init() {
    // 環境変数からAPIキーを取得してMapの初期化をする
    var apikey = const String.fromEnvironment("MAP_SDK_API_KEY");
    MapView.setApiKey(apikey);
  }

  /// Map表示
  showMap() {
    var _mapView = MapView();
    _mapView.show(
        new MapOptions(
          showUserLocation: true,
          hideToolbar: false,
          showMyLocationButton: true,
          showCompassButton: true,
        ),
        toolbarActions: [new ToolbarAction("Close", 1)]);
    _mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        _mapView.dismiss();
      }
    });
  }
}
