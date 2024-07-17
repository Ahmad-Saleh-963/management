import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'map_state.freezed.dart';

@freezed
class MapState with _$MapState {
  factory MapState.initial({
    @Default(false) bool deleting,
    @Default(false) bool loading,
    @Default(Options.addCenter) Options option,
    @Default(false) bool loadMyLocation,
    @Default(false) bool addingMarker,
    @Default(false) bool addingCenter,
    @Default(false) bool loadingDistance,
    @Default('') String distance,
    @Default(18.0) double zoomCamera,
    @Default('') String date,
    @Default('mapbox://styles/ahmadsaleh963964/clydiahhj00o001nwggjtai7v') String styleMap,
    LatLng? origin,
    LatLng? destination,
  }) = _initial;
}


enum Options {
  addCenter,
  addLocation,
  calcDistance,
}