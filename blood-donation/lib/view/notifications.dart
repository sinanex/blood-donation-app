import 'package:curd/controller/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<Dataprovider>(listen: false,context).getRequstDataa();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     body: Consumer<Dataprovider>(
       builder:(context, value, child) =>  ListView.builder(
        itemCount: value.reqeustList.length,
        itemBuilder:  (context, index) {
         final data = value.reqeustList[index];
         return ListTile(title: Text(data.name!),);
       },),
     )
    );
  }
}