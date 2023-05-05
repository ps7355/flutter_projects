import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('hai'),
        ),
      ),
    );
  }
}













// Example 1
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// void main() {
//   runApp(ProviderScope(
//     child: const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.dark,
//       home: home(),
//     );
//   }
// }

// final date = Provider<DateTime>(
//   (ref) => DateTime.now(),
// );

// class home extends ConsumerWidget {
//   const home({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final time = ref.watch(date);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("MY APP"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text(time.toIso8601String()),
//       ),
//     );
//   }
// }

// class homepage extends StatelessWidget {
//   const homepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("MyApp"),
//         centerTitle: true,
//       ),
//     );
//   }
// }


// example 2
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// void main() {
//   runApp(ProviderScope(child: MyApp()));
// }

// extension pref<T extends num> on T? {
//   T? operator +(T? other) {
//     final shado = this;
//     if (shado != null) {
//       return shado + (other ?? 0) as T;
//     } else {
//       return null;
//     }
//   }
// }

// extension prefa<T extends num> on T? {
//   T? operator -(T? other) {
//     final shado = this;
//     if (shado != null) {
//       return shado + (other ?? 0) as T;
//     } else {
//       return null;
//     }
//   }
// }

// // void test() {
// //   final int? s1 = 1;
// //   final int s2 = 1;
// //   final sum = s1 + s2;
// //   print(sum);
// // }

// class counter extends StateNotifier<int?> {
//   counter() : super(null);
//   void increment() => state = state == null ? 1 : state - 1;
//   void decrement() => state = state - 1;
// }

// final notifiers = StateNotifierProvider<counter, int?>(
//   (ref) => counter(),
// );

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.dark,
//       home: my(),
//     );
//   }
// }

// class my extends ConsumerWidget {
//   const my({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Consumer(builder: ((context, ref, child) {
//           final change = ref.watch(notifiers);
//           final text = change == null ? 'press the button' : change.toString();
//           return Text(text);
//         })),
//       ),
//       body: Center(
//           child: TextButton(
//               onPressed: ref.read(notifiers.notifier).increment,
//               child: Text("increment counter"))),
//       floatingActionButton: FloatingActionButton(
//         onPressed: ref.read(notifiers.notifier).decrement,
//       ),
//     );
//   }
// }


// example 3
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// void main() {
//   runApp(ProviderScope(child: MyApp()));
// }

// enum City {
//   chennai,
//   delhi,
//   mumbai,
// }

// typedef emoji = String;

// Future<emoji> getweather(City city) {
//   return Future.delayed(
//     Duration(seconds: 1),
//     () => {
//       City.chennai: '🌧',
//       City.delhi: '⚡',
//       City.mumbai: '🥶',
//     }[city]!,
//   );
// }

// final current = StateProvider<City?>(
//   (Ref) => null,
// );

// final whe = FutureProvider<emoji>((ref) {
//   final city = ref.watch(current);
//   if (city != null) {
//     return getweather(city);
//   } else {
//     return unknown;
//   }
// });

// final unknown = '⁉';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.dark,
//       home: my(),
//     );
//   }
// }

// class my extends ConsumerWidget {
//   const my({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currents = ref.watch(whe);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Weather App"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 40,
//           ),
//           currents.when(
//             data: (data) => Text(
//               data,
//               style: TextStyle(fontSize: 40),
//             ),
//             error: (error, stackTrace) => Text("Error 😢"),
//             loading: () => CircularProgressIndicator(
//               color: Colors.blue,
//             ),
//           ),
//           Expanded(
//               child: ListView.builder(
//                   itemCount: City.values.length,
//                   itemBuilder: (context, index) {
//                    final city = City.values[index];
//                     final isSelected = city == ref.watch(current);
//                     return ListTile(
//                       title: Text(city.toString()),
//                       trailing: isSelected ? Icon(Icons.check) : null,
//                       onTap: (() {
//                         ref.read(current.notifier).state = city;
//                       }),
//                     );
//                   }))
//         ],
//       ),
//     );
//   }
// }


// example 4
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// void main() {
//   runApp(ProviderScope(child: MyApp()));
// }

// final words = [
//   'sky',
//   'cloud',
//   'tent',
//   'tree',
//   'falcon',
//   'siva',
//   'karun',
//   'maron',
//   'tarun'
// ];

// final names = StreamProvider(
//   (ref) => Stream.periodic(Duration(seconds: 1), (i) => i + 1),
// );

// final lis = StreamProvider(
//     (ref) => ref.watch(names.stream).map((event) => words.getRange(0, event)));

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.dark,
//       home: my(),
//     );
//   }
// }

// class my extends ConsumerWidget {
//   const my({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final prank = ref.watch(lis);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("myapp"),
//         centerTitle: true,
//       ),
//       body: prank.when(
//           data: (prank) {
//             return ListView.builder(
//               itemCount: prank.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(prank.elementAt(index)),
//                 );
//               },
//             );
//           },
//           error: ((error, stackTrace) => Text("End of the List")),
//           loading: () => Center(
//                   child: CircularProgressIndicator(
//                 color: Colors.blue,
//               ))),
//     );
//   }
// }



//my own counter app using riverpod and provider
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// void main() {
//   runApp(ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       darkTheme: ThemeData.dark(),
//       themeMode: ThemeMode.dark,
//       home: my(),
//     );
//   }
// }

// class counter extends StateNotifier<int> {
//   counter() : super(0);
//   void increament() => state++;
//   void decreament() => state--;
// }

// final counterprovider = StateNotifierProvider<counter, int>((ref) => counter());

// class my extends ConsumerWidget {
//   const my({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('counter'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: Consumer(
//               builder: (context, ref, child) {
//                 final count = ref.watch(counterprovider);
//                 return Container(
//                   color: Colors.blue,
//                   child: Text(
//                     count.toString(),
//                     style: TextStyle(fontSize: 40),
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           IconButton(
//               onPressed: ref.read(counterprovider.notifier).increament,
//               icon: Icon(Icons.text_decrease)),
//           SizedBox(
//             height: 40,
//           ),
//           IconButton(
//               onPressed: ref.read(counterprovider.notifier).decreament,
//               icon: Icon(Icons.text_decrease))
//         ],
//       ),
//     );
//   }
// }


