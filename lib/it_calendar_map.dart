import 'dart:async';

import 'package:flutter/material.dart';
import 'package:it_calendar/domain/model/Event.dart';
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

  Location get location => _userLocation;
  Location _userLocation;

  var compositeSubscription = new CompositeSubscription();
  List<Marker> _markers = [];

  /// Map表示
  showMap() {
    _mapView.show(
        new MapOptions(
          showUserLocation: true,
          hideToolbar: false,
          showMyLocationButton: true,
          showCompassButton: true,
          initialCameraPosition:
              new CameraPosition(new Location(34.7039714, 135.4949975), 14.0),
        ),
        toolbarActions: [new ToolbarAction("Close", 1)]);
    _mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        _mapView.dismiss();
      }
    });

    // _showMapメソッドの最後に以下の処理を追加
    _mapView.onMapReady.listen((_) {
      if (_userLocation != null) {
        _mapView.setCameraPosition(new CameraPosition(
            new Location(_userLocation.latitude, _userLocation.longitude),
            14.0));
      }
      _mapView.setMarkers(_markers);
      _setMarker(Event(
          eventId: 10,
          title: "test title",
          latitude: _userLocation.latitude,
          longitude: _userLocation.longitude));
    });

    _mapView.onLocationUpdated.listen((location) {
      if (_userLocation == null) {
        _userLocation = location;
        _mapView.setCameraPosition(new CameraPosition(
            new Location(_userLocation.latitude, _userLocation.longitude),
            14.0));
        print(
            "latitude:${_userLocation.latitude}, longitude:${_userLocation.longitude}");
      }
    });

    _setMarker(Event(
        eventId: 1,
        title: "Umeda.hack",
        latitude: 34.6991342,
        longitude: 135.4952183));
    _setMarker(Event(
        eventId: 2,
        title: "CodeLab HepFive",
        latitude: 34.7040623,
        longitude: 135.5002964));
    _setMarker(Event(
        eventId: 3,
        title: "MBS MokuMoku",
        latitude: 34.7049389,
        longitude: 135.4959288));

    StreamSubscription sub = _mapView.onMapReady.listen((_) {
      _mapView.setMarkers(_markers);
    });
    compositeSubscription.add(sub);
  }

  _setMarker(Event event) {
    _markers.add(
      new Marker(
        event.eventId.toString(),
        event.title,
        event.latitude,
        event.longitude,
        color: Colors.pink,
        draggable: false, //disallow the user to move the marker.
      ),
    );
  }
}

class CompositeSubscription {
  Set<StreamSubscription> _subscriptions = new Set();

  void cancel() {
    for (var n in this._subscriptions) {
      n.cancel();
    }
    this._subscriptions = new Set();
  }

  void add(StreamSubscription subscription) {
    this._subscriptions.add(subscription);
  }

  void addAll(Iterable<StreamSubscription> subs) {
    _subscriptions.addAll(subs);
  }

  bool remove(StreamSubscription subscription) {
    return this._subscriptions.remove(subscription);
  }

  bool contains(StreamSubscription subscription) {
    return this._subscriptions.contains(subscription);
  }

  List<StreamSubscription> toList() {
    return this._subscriptions.toList();
  }
}
