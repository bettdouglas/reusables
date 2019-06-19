
import 'package:flutter/material.dart';
import 'package:flutter_validate/flutter_validate.dart';

class DynamicInput extends StatefulWidget {
  final String label,hint;
  ///type denotes number or string or email 
  final DataType type;
  final TextEditingController controller;
  
  DynamicInput({
    @required this.label,
    @required this.hint,
    @required this.controller,
    this.type
  });

  String get text => controller.text;
  
  @override
  _DynamicInputState createState() => _DynamicInputState();
}

class _DynamicInputState extends State<DynamicInput> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: keyBoardType(widget.type),
      validator: (str)=>validator(str),
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
        helperText: widget.hint,
      ),
    );
  }
  
  String validator(String s) {
    var validator = Validator(s,widget.type).validator;
    switch (widget.type) {
      case DataType.EMAIL:
        return validator.validateRuleFor('email').errorText;
        break;
      case DataType.INTEGER:
        return validator.validateRuleFor('int').errorText;
        break;
      case DataType.TEXT:
        return validator.validateRuleFor('text').errorText;
      case DataType.PHONE:
        return validator.validateRuleFor('phone').errorText;
      case DataType.NAME:
        return validator.validateRuleFor('name').errorText;
      default:
        return validator.validateRuleFor('text').errorText;
    }
  }
  
  TextInputType keyBoardType(DataType type) {
    switch (type) {
      case DataType.EMAIL:
        return TextInputType.emailAddress;
        break;
      case DataType.INTEGER:
        return TextInputType.number;
        break;
      case DataType.TEXT:
        return TextInputType.text;
        break;
      case DataType.PHONE:
        return TextInputType.phone;
        break;
      default: return TextInputType.text;
    }
  } 
}

enum DataType {
  EMAIL,PHONE,TEXT,INTEGER,NAME
}

class TypesValidator extends AbstractValidator<String> {  
  DataType type;
  String text;

  TypesValidator(this.text, this.type) : super(text);
}

class Validator {

  String text;
  TypesValidator _validator;
  DataType type;

  Validator(this.text,this.type){
    _validator = new TypesValidator(text,type);
    this.create();
  }

  TypesValidator get validator => _validator;

  TypesValidator create(){

    _validator.ruleFor('name', ()=>text)
        ..notEmpty()
        ..withMessage('Please enter a name')
        ..length(2, 30)
        ..withMessage('Please enter a reasonable name');

    _validator.ruleFor('email', ()=>text)
        ..notEmpty()
        ..withMessage('Email cannot be empty')
        ..emailAddress()
        ..withMessage('Enter a valid email');

    _validator.ruleFor('text', ()=>text)
        ..notEmpty()
        ..withMessage('Cannot be empty');

    _validator.ruleFor('phone', ()=>text)
        ..notEmpty()
        ..withMessage('Phone number cannot be empty')
        ..matches('[0-9]{0,14}\$')
        ..withMessage('Phone number doesn\'t seem correct');

    _validator.ruleFor('int', ()=>text)
        ..matches('(?<=\\s|^)[-+]?\\d+(?=\\s|\$)')
        ..withMessage('Enter a valid number');
    
        
    return _validator;

  }

  String validate(){
    switch (type) {
      case DataType.EMAIL:
        return validator.validateRuleFor('email').errorText;
        break;
      case DataType.INTEGER:
        return validator.validateRuleFor('int').errorText;
        break;
      case DataType.TEXT:
        return validator.validateRuleFor('text').errorText;
      case DataType.PHONE:
        return validator.validateRuleFor('phone').errorText;
      case DataType.NAME:
        return validator.validateRuleFor('name').errorText;
      default:
        return validator.validateRuleFor('text').errorText;
    }
  }
}
