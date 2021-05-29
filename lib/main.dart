import 'package:connectionState/provider/connection_provider.dart';
import 'package:connectionState/screens/home_screen.dart';
import 'package:connectionState/screens/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        ConnectionProvider connectionProvider = ConnectionProvider();
        connectionProvider.initialConnection();
        return connectionProvider;
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Consumer<ConnectionProvider>(
          builder: (context, connection, child) {
            return connection.isConnected ? HomePage() : NoINternet();
          },
        ),
      ),
    );
  }
}
