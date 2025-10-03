

import 'dart:io';

import 'apartment_service.dart';
import 'management_system.dart';

class ApartmentManagerUI {
  final system = ApartmentManagementSystem();
  bool running = true;

  Future<void> run() async {
    final apartments = await ApartmentService.loadApartments();
    final tenants = await ApartmentService.loadTenants();

    for(var apartment in apartments){
      system.addApartment(apartment);
    }

    for(var tenant in tenants){
      system.addTenant(tenant);
    }

    while(running){
      print('1. View apartments');
      print('2. View tenants');
      print('3. Exit');

      stdout.write('Choice: ');
      final choice = stdin.readLineSync(); // @QUESTION: why use final here?

      switch(choice){
        case '1':
          for(var apartment in system.allApartments){
            print(apartment);
          }
          break;
        case '2':
          for(var tenant in system.allTenants){
            print(tenant);
          }
          break;
        case '3':
          running = false;
          break;
        default:
          print('Invalid choice');
        }
    }
  }
}

