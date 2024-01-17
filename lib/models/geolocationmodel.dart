
import 'dart:convert';

List<GeoLocationApi> geoLocationApiFromJson(String str) => List<GeoLocationApi>.from(json.decode(str).map((x) => GeoLocationApi.fromJson(x)));

String geoLocationApiToJson(List<GeoLocationApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class GeoLocationApi {
  String? name;
  Map<String, String>? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  GeoLocationApi({
    this.name,
    this.localNames,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  factory GeoLocationApi.fromJson(Map<String, dynamic> json) => GeoLocationApi(
    name: json["name"],
    //localNames: Map.from(json["local_names"]).map((k, v) => MapEntry<String, String>(k, v)),
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    country: json["country"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "local_names": Map.from(localNames!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "lat": lat,
    "lon": lon,
    "country": country,
    "state": state,
  };
}