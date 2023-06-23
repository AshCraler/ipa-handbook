enum BaseScreen {
  home,
  soundDetail,
  settings,
}

extension BaseNav on BaseScreen {
  String get routePath => '/$name';
}

///Shell navigation
// enum ShellScreen {
//   room,
//   furniture,
//   bill,
// }

// extension ShellNav on ShellScreen {
//   String get routePath => '/$name';

//   String get label => name.capitalize();

//   IconData get icon {
//     switch (this) {
//       case ShellScreen.room:
//         return Icons.home;
//       case ShellScreen.furniture:
//         return Icons.table_bar;
//       case ShellScreen.bill:
//         return Icons.money;
//       default:
//         return Icons.home;
//     }
//   }
// }

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
