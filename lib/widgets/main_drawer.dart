
import 'package:flutter/material.dart';
import '../screens/order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: MainDrawer(),
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, IconData icon, VoidCallback tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Lato', fontSize: 25, fontWeight: FontWeight.bold),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Column(
        
        children: [
          AppBar(   title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,),
          
          buildListTile(
              'Shop',
              Icons.shop,
                  () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          buildListTile(
              'Orders',
              Icons.payment,
                  () {
                Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
              }),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../screens/order_screen.dart';

// class MainDrawer extends StatelessWidget {
//   const MainDrawer({super.key});
//   Widget buildListTile(String title, IconData icon, VoidCallback tabHandler) {
//     return ListTile(
//       leading: Icon(
//         icon,
//         size: 30,
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//             fontFamily: 'Lato', fontSize: 25, fontWeight: FontWeight.bold),
//       ),
//       onTap: tabHandler,
//     );
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           Container(
//             height: 120,
//             width: double.infinity,
//             alignment: Alignment.centerLeft,
//             color: Theme.of(context).colorScheme.primary,
//             child: Text('Hello Fri',
//                 style: TextStyle(
//                     fontWeight: FontWeight.w900,
//                     fontSize: 30,
//                     color: Theme.of(context).primaryColor)
//                     ),
            
//           ),
//           // SizedBox(
//           //   height: 20,
//           // ),
//           // Divider(),
//           buildListTile(
//             'Shop',
//             Icons.shop,
//             (){}
//             Navigator.of(context).pushReplacementNamed('/')
//           ),
//              buildListTile(
//             'Orders',
//             Icons.payment,
//             (){}
//             Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
//           ),


//         ],
//       ),
//     );
//   }
// }
