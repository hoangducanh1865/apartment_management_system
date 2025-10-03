import 'apartment.dart';

class PremiumApartment extends Apartment {
  final List<String> amenities;
  final bool hasBalcony;
  final bool hasParking;

  PremiumApartment(
    String id,
    String building,
    int floor,
    int roomNumber,
    int bedrooms,
    int bathrooms,
    double area,
    this.amenities,
    this.hasBalcony,
    this.hasParking,
  ) : super(id, building, floor, roomNumber, bedrooms, bathrooms, area);

  @override
  double get totalRent {
    double premium = 0.0;
    premium += hasBalcony ? 100 : 0;
    premium += hasParking ? 150 : 0;
    premium += amenities.length * 50;
    return super.totalRent + premium;
  }

  @override
  String toString() =>
      'Apartment information:\n' +
      '${super.toString()}' +
      'Premium features:\n' +
      '${amenities.join(', ')}' +
      '${hasBalcony ? ', Balcony' : ''}' +
      '${hasParking ? ', Parking' : ''}';
}
