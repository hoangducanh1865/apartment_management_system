import '../configs/enums.dart';
import '../entities/apartment.dart';
import '../entities/premium_apartment.dart';
import '../entities/tenant.dart';

class ApartmentService {
  static Future<List<Apartment>> loadApartments() async {
    await Future.delayed(
      Duration(seconds: 1),
    ); // In real-world, delayed duration will depend on download speed

    return [
      // Simulate download process
      Apartment('A001', 'Building A', 1, 101, 2, 1, 65.0),
      PremiumApartment(
        'P001',
        'Building P',
        3,
        301,
        2,
        2,
        75.0,
        ['Gym', 'Pool'],
        true,
        true,
      ),
    ];
  }

  static Future<List<Tenant>> loadTenants() async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Tenant('T001', 'John', 'Smith', 28, TenantType.professional, (
        email: 'john@email.com',
        phone: null,
        address: 'City A',
      )),
    ];
  }

  // Simulate frequent updating
  static Stream<String> getUpdates() =>
      Stream.periodic(Duration(seconds: 2), (i) => 'Update $i').take(5);
}
