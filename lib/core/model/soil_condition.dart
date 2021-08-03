import 'package:equatable/equatable.dart';

class SoilCondition extends Equatable {
  final String humidity;
  final String temperature;
  final String ph;
  final String moisture;
  final String cO2Level;

  SoilCondition({
    required this.humidity,
    required this.temperature,
    required this.ph,
    required this.moisture,
    required this.cO2Level,
  });

  factory SoilCondition.fromJson(Map<String, dynamic> json) {
    return SoilCondition(
      humidity: json['humidity'],
      temperature: json['temperature'],
      ph: json['ph'],
      moisture: json['moisture'],
      cO2Level: json['cO2Level'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'humidity': humidity,
      'temperature': temperature,
      'ph': ph,
      'moisture': moisture,
      'cO2Level': cO2Level,
    };
  }

  @override
  List<Object?> get props => [
        humidity,
        temperature,
        ph,
        moisture,
        cO2Level,
      ];
}
