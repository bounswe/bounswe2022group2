import '../../../../../core/base/model/base_model.dart';

class GeoLocation extends BaseModel<GeoLocation> {
  const GeoLocation({
    this.latitude = 0,
    this.longitude = 0,
    this.accuracy = 0,
    this.altitude = 0,
    this.altitudeAccuracy = 0,
    this.heading = 0, 
    this.speed = 0,
    this.timestamp = 0,
  });

  factory GeoLocation.dummy({double? latitude, double? longitude}) =>
      GeoLocation(
        latitude: latitude ?? 35.268259,
        longitude: longitude ?? 33.824730,
        accuracy: 98,
        altitude: 2,
        altitudeAccuracy: 80,
        heading: 12,
        speed: 13,
        timestamp: 123123,
      );

  factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
        latitude: BaseModel.getWithDefault<double>(json['latitude'], 0),
        longitude: BaseModel.getWithDefault<double>(json['longitude'], 0),
        accuracy: BaseModel.getWithDefault<double>(json['accuracy'], 0),
        altitude: BaseModel.getWithDefault<double>(json['altitude'], 0),
        altitudeAccuracy:
            BaseModel.getWithDefault<double>(json['altitudeAccuracy'], 0),
        heading: BaseModel.getWithDefault<double>(json['heading'], 0),
        speed: BaseModel.getWithDefault<double>(json['speed'], 0),
        timestamp: BaseModel.getWithDefault<double>(json['timestamp'], 0),
      );

  GeoLocation copyWith({
    double? latitude,
    double? longitude,
    double? accuracy,
    double? altitude,
    double? altitudeAccuracy,
    double? heading,
    double? speed,
    double? timestamp,
  }) =>
      GeoLocation(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        accuracy: accuracy ?? this.accuracy,
        altitude: altitude ?? this.altitude,
        altitudeAccuracy: altitudeAccuracy ?? this.altitudeAccuracy,
        heading: heading ?? this.heading,
        speed: speed ?? this.speed,
        timestamp: timestamp ?? this.timestamp,
      );

  final double latitude;
  final double longitude;
  final double accuracy;
  final double altitude;
  final double altitudeAccuracy;
  final double heading;
  final double speed;
  final double timestamp;

  @override
  GeoLocation fromJson(Map<String, dynamic> json) => GeoLocation.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
        'accuracy': accuracy,
        'altitude': altitude,
        'altitudeAccuracy': altitudeAccuracy,
        'heading': heading,
        'speed': speed,
        'timestamp': timestamp,
      };

  @override
  List<Object?> get props => <Object?>[
        latitude,
        longitude,
      ];
}
