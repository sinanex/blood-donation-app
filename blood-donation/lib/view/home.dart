import 'package:curd/view/add.dart';
import 'package:curd/view/request.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hey, name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/Screenshot 2025-01-04 at 1.37.32 PM.png')),

                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RequestPage()));
                      },
                      child: Container(
                        height: 100,
                        width: 170,
                        child: Card(
                          child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            spacing: 10,
                            children: [
                              Image.asset('assets/3d-map.png',width: 30,),
                              Text('Find doners'),
                            ],
                          ),
                        ),
                                 
                                         
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));
                      },
                      child: SizedBox(
                        
                        height: 100,
                        width: 170,
                        child: Card(
                                
                          child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            spacing: 10,
                            children: [
                              Image.asset('assets/add-user.png',width: 30,),
                              Text('Add  doners'),
                            ],
                          ),
                          
                          
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}