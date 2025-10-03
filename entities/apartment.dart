import '../configs/constants.dart';
import '../configs/typedefs.dart';
import '../configs/enums.dart';
import 'tenant.dart';

class Apartment {
  final ApartmentId id;
  final String building;
  final int floor;
  final int roomNumber;
  final int bedrooms;
  final int bathrooms;
  final double area;
  ApartmentStatus status;
  RentAmount baseRent;
  Tenant? currentTenant;
  final List<RentRecord> _rentHistory = [];

  Apartment(
    this.id,
    this.building,
    this.floor,
    this.roomNumber,
    this.bedrooms,
    this.bathrooms,
    this.area, {
    this.status = ApartmentStatus.available,
    this.baseRent = Constants.BASE_RENT,
    this.currentTenant,
  });

  List<RentRecord> get rentHistory =>
      List.unmodifiable(_rentHistory); // Return an unmodifiable list

  double get totalRent => baseRent + Constants.MAINTENANCE_FEE + (area * 2);

  String get address => 'Building: $building, Floor: $floor, Room: $roomNumber';

  void addRentRecod(RentRecord record) => _rentHistory.add(record);

  void assignTenant(Tenant tenant) {
    if (status != ApartmentStatus.available) {
      throw Exception('Apartment is not available');
    }

    currentTenant = tenant;
    status = ApartmentStatus.occupied;
    tenant.moveInDate = DateTime.now();
  }

  void removeTenant() {
    currentTenant = null;
    status = ApartmentStatus.available;
  }

  @override
  String toString() =>
      'Apartment: $id, Address: $address, Bedrooms: $bedrooms, Bathrooms: $bathrooms, Area: $area m2, Status: ${status.name}';
}
