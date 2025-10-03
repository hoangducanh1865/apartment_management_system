import '../configs/typedefs.dart';
import '../configs/enums.dart';

class Tenant {
  final TenantId id;
  final String firstName;
  final String lastName;
  final int age;
  final TenantType type;
  final ContactInfo contact;
  late DateTime moveInDate;
  double? securityDeposit;

  Tenant(
    this.id,
    this.firstName,
    this.lastName,
    this.age,
    this.type,
    this.contact, {
    this.securityDeposit,
  });

  String get fullName => '$firstName $lastName'; // Getter -> do not need ()
  String get displayInfo =>
      '$fullName (Type: ${type.name}, Age: $age), Deposit: $securityDeposit';

  @override
  String toString() =>
      'Tenant{id: $id, name: $fullName, type: ${type.name}, contact: ${contact.email}}';

  @override
  bool operator ==(Object other) => other is Tenant && id == other.id;

  @override
  int get hashCode => id.hashCode; // With this overiding, the same objects with equal ids will be treated as only one object, and vice versa.
}
