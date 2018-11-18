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

  var _mapView = MapView();

  /// Map表示
  showMap() {
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

    Location userLocation;

    // _showMapメソッドの最後に以下の処理を追加
    _mapView.onMapReady.listen((_) {
      if (userLocation != null) {
        _mapView.setCameraPosition(new CameraPosition(
            new Location(userLocation.latitude, userLocation.longitude), 14.0));
      }
    });

    _mapView.onLocationUpdated.listen((location) {
      if (userLocation == null) {
        userLocation = location;
        _mapView.setCameraPosition(new CameraPosition(
            new Location(userLocation.latitude, userLocation.longitude), 14.0));
      }
    });
  }
}
