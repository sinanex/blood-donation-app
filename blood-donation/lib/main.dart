

import 'package:curd/controller/provider.dart';
import 'package:curd/view/authcheck.dart';
import 'package:curd/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(
      url: 'https://tcpluoshvhhozybzalxz.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRjcGx1b3Nodmhob3p5YnphbHh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU1NDkyNjEsImV4cCI6MjA1MTEyNTI2MX0.xK1SyvcGZdbxFz910kuDYv_yyW9u4NJrvrDiMX7eQ-8');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthController(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
