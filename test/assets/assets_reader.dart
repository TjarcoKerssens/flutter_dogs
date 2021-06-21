import 'dart:io';

String asset(String name) => File('test/assets/$name').readAsStringSync();

// String asset(String name) {
//   String jsonString;
//   try {
//     jsonString = File('test/assets/$name').readAsStringSync();
//   } catch (e) {
//     jsonString = File('../test/assets/$name').readAsStringSync();
//   }

//   return jsonString;
// }
