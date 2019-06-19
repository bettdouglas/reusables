import 'package:dynamic_forms/main.dart';
import 'package:dynamic_forms/reusables.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _DynamicsState createState() => _DynamicsState();
}

class _DynamicsState extends State<TestPage> {
  ///controllers for our dynamic elements
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var phoneController = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  var valid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How dynamic is this??? '),
      ),
      body: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                DynamicInput(hint: 'Enter valid name',controller: nameController,label: 'Name',type: DataType.NAME,),
                DynamicInput(hint: 'Enter valid email',controller: emailController,label: 'Email',type: DataType.EMAIL,),
                DynamicInput(hint: 'Enter valid age',controller: ageController,label: 'Age:',type: DataType.INTEGER,),
                DynamicInput(hint: 'Enter valid phone',controller: phoneController,label: 'Phone',type: DataType.PHONE,),
                RaisedButton(
                  child: Text('Validate'),
                  color: valid ? Colors.green : Colors.red,
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                      setState(() {
                        valid = true;
                      });
                      print('Entire form is valid');
                    }
                    else {
                      print('Some info is not correct');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}