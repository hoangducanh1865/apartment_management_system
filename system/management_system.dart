import 'dart:io';

import '../configs/enums.dart';
import '../configs/typedefs.dart';
import '../entities/apartment.dart';
import '../entities/tenant.dart';

class ApartmentManagementSystem {
  final Map<ApartmentId, Apartment> _apartments = {};
  final Map<TenantId, Tenant> _tenants = {};
  final List<String> _activityLog = [];

  // @QUESTION: what does .values return?
  List<Apartment> get allApartments => _apartments.values.toList();
  List<Tenant> get allTenants => _tenants.values.toList();

  void addApartment(Apartment apartment) {
    _apartments[apartment.id] = apartment;
    _log('Added apartment: ${apartment.id}');
  }

  void addTenant(Tenant tenant) {
    _tenants[tenant.id] = tenant;
    _log('Added tenant: ${tenant.id}');
  }

  bool assignTenantToApartment(TenantId tenantId, ApartmentId apartmentId) {
    final tenant = _tenants[tenantId]; // @QUESTION: why using final here?
    final apartment =
        _apartments[apartmentId]; // @QUESTION: why using final here?

    if (tenant == null || apartment == null) return false;
    if (apartment.status != ApartmentStatus.available) return false;

    try {
      apartment.assignTenant(tenant);
      _log('Assigned ${tenant.fullName} to ${apartment.id}');
      return true;
    } catch (_) {
      // @QUESTION: update, do not use _ like this
      return false;
    }
  }

  // @QUESTION: what does .toIso8601String do?
  void _log(String activity) =>
      _activityLog.add('${DateTime.now().toIso8601String()}: $activity');

  List<String> get activityLog => List.unmodifiable(_activityLog);
}
