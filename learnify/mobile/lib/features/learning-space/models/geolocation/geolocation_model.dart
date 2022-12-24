import '../../../../../core/base/model/base_model.dart';

class GeoLocation extends BaseModel<GeoLocation> {
  const GeoLocation({
    this.latitude = 0,
    this.longitude = 0,
    this.accuracy = 0,
  });

  factory GeoLocation.dummy({double? latitude, double? longitude}) =>
      GeoLocation(
        latitude: latitude ?? 35.269932,
        longitude: longitude ?? 33.825352,
        accuracy: 98,
      );

  factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
        latitude: BaseModel.getWithDefault<double>(json['latitude'], 0),
        longitude: BaseModel.getWithDefault<double>(json['longitude'], 0),
        accuracy: BaseModel.getWithDefault<double>(json['accuracy'], 0),
      );

  GeoLocation copyWith({
    double? latitude,
    double? longitude,
    double? accuracy,
  }) =>
      GeoLocation(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        accuracy: accuracy ?? this.accuracy,
      );

  final double latitude;
  final double longitude;
  final double accuracy;

  @override
  GeoLocation fromJson(Map<String, dynamic> json) => GeoLocation.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
        'accuracy': accuracy,
      };

  @override
  List<Object?> get props => <Object?>[
        latitude,
        longitude,
        accuracy,
      ];
}
