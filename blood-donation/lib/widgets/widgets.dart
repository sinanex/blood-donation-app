  import 'package:flutter/material.dart';

GestureDetector logincontainer({required String name}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Center(child: Text(name)),
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), border: Border.all()),
      ),
    );
  }

    TextField customTextfeild({required String lableText,required TextEditingController controller,int? maxLength,String? prefixText,TextInputType? type}) {
    return TextField(
      keyboardType: type,
      maxLength: maxLength,
      controller: controller,
            decoration: InputDecoration(
              prefixText: prefixText,
              labelText: lableText,
              labelStyle: TextStyle(
                color: Colors.grey
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2.0), 
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
            
                       
            
            ),
                      );
  }