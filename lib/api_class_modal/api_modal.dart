// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

class Welcome {
  Welcome({
    required this.metaData,
    required this.timeSeries5Min,
  });

  final MetaData metaData;
  final Map<String, TimeSeries5Min> timeSeries5Min;

  factory Welcome.fromRawJson(String str) => Welcome.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        metaData: MetaData.fromJson(json["Meta Data"]),
        timeSeries5Min: Map.from(json["Time Series (5min)"]).map((k, v) =>
            MapEntry<String, TimeSeries5Min>(k, TimeSeries5Min.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "Meta Data": metaData.toJson(),
        "Time Series (5min)": Map.from(timeSeries5Min)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class MetaData {
  MetaData({
    required this.the1Information,
    required this.the2Symbol,
    required this.the3LastRefreshed,
    required this.the4Interval,
    required this.the5OutputSize,
    required this.the6TimeZone,
  });

  final String the1Information;
  final String the2Symbol;
  final DateTime the3LastRefreshed;
  final String the4Interval;
  final String the5OutputSize;
  final String the6TimeZone;

  factory MetaData.fromRawJson(String str) =>
      MetaData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        the1Information: json["1. Information"],
        the2Symbol: json["2. Symbol"],
        the3LastRefreshed: DateTime.parse(json["3. Last Refreshed"]),
        the4Interval: json["4. Interval"],
        the5OutputSize: json["5. Output Size"],
        the6TimeZone: json["6. Time Zone"],
      );

  Map<String, dynamic> toJson() => {
        "1. Information": the1Information,
        "2. Symbol": the2Symbol,
        "3. Last Refreshed": the3LastRefreshed.toIso8601String(),
        "4. Interval": the4Interval,
        "5. Output Size": the5OutputSize,
        "6. Time Zone": the6TimeZone,
      };
}

class TimeSeries5Min {
  TimeSeries5Min({
    required this.the1Open,
    required this.the2High,
    required this.the3Low,
    required this.the4Close,
    required this.the5Volume,
  });

  final String the1Open;
  final String the2High;
  final String the3Low;
  final String the4Close;
  final String the5Volume;

  factory TimeSeries5Min.fromRawJson(String str) =>
      TimeSeries5Min.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimeSeries5Min.fromJson(Map<String, dynamic> json) => TimeSeries5Min(
        the1Open: json["1. open"],
        the2High: json["2. high"],
        the3Low: json["3. low"],
        the4Close: json["4. close"],
        the5Volume: json["5. volume"],
      );

  Map<String, dynamic> toJson() => {
        "1. open": the1Open,
        "2. high": the2High,
        "3. low": the3Low,
        "4. close": the4Close,
        "5. volume": the5Volume,
      };
}
