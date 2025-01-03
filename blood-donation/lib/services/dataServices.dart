import 'package:supabase_flutter/supabase_flutter.dart';

class Dataservices {

   final supabase = Supabase.instance.client;

    void getData(){
    final data=  supabase.from('doners').select('*');

    
    }
}