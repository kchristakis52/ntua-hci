library wheren.globals;

import 'main.dart';

String firtname = 'George';
String lastname = 'Papadopoulos';
List<Event> myeventslist = <Event>[
  Event(
      OnomaEvent: 'New Years Eve Party',
      OnomaDiorganwti: 'Nikos',
      EpithetoDiorganwti: 'Kalantas',
      meros: 'Clumsies, Athens',
      hmeromhnia: DateTime(2022, 12, 31, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      diarkeia: const Duration(hours: 4)),
]; //sto MyEvents.dart prepei na ginei o diaxwrismos me vash thn hmeromhnia. Prosthesa ena palio event, auta pou prosthetoume apto home page opws einai logiko tha einai eite upcoming eite live
List<Event> allevents = <Event>[
  Event(
      OnomaEvent: 'Tropical The Party',
      OnomaDiorganwti: 'Aggelos',
      EpithetoDiorganwti: 'Dimitriou',
      meros: 'Gazi Music Hall, Athens',
      hmeromhnia: DateTime(2023, 01, 20, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      diarkeia: const Duration(days: 30)),
  Event(
    OnomaEvent: 'House Festival',
    OnomaDiorganwti: 'Reece',
    EpithetoDiorganwti: 'Johnson',
    meros: 'Technopolis Gazi, Athens',
    hmeromhnia: DateTime(2023, 02, 20, 17, 0, 0),
    perigrafh:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
    diarkeia: const Duration(hours: 4),
    eikona: './assets/images/festival.jpg',
  ),
  Event(
      OnomaEvent: 'Triton',
      OnomaDiorganwti: 'Nikos',
      EpithetoDiorganwti: 'Matsamplokos',
      meros: 'Naustathmos, Salamina',
      hmeromhnia: DateTime(2023, 02, 13, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      diarkeia: const Duration(hours: 4)),
  Event(
      OnomaEvent: 'The Party',
      OnomaDiorganwti: 'Lorem',
      EpithetoDiorganwti: 'Ipsum',
      meros: 'Beach, Athens',
      hmeromhnia: DateTime(2023, 02, 13, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      diarkeia: const Duration(hours: 4)),
  Event(
      OnomaEvent: 'The Party',
      OnomaDiorganwti: 'Lorem',
      EpithetoDiorganwti: 'Ipsum',
      meros: 'Beach, Athens',
      hmeromhnia: DateTime(2023, 02, 13, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      diarkeia: const Duration(hours: 4)),
];
