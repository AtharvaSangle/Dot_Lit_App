import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final passwordController = TextEditingController();

  Function onChanged;
  Function validation;
  String label, error_text;
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
  PasswordField({this.onChanged, this.error_text, this.label, this.validation});
}

class _PasswordFieldState extends State<PasswordField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validation,
      controller: widget.passwordController,
      onChanged: widget.onChanged,
      obscureText: hidePassword,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.grey[400],
            width: 1.0,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.remove_red_eye),
          splashRadius: 15.0,
          color: hidePassword ? Colors.lightBlue[300] : Colors.grey[500],
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
        labelText: widget.label,
        labelStyle: TextStyle(color: Colors.black),
        errorText: widget.error_text,
      ),
    );
  }
}

class InputField extends StatelessWidget {
  String label;
  Function onChanged;
  Function validation;
  final inputController = TextEditingController();

  InputField({this.label, @required this.onChanged, this.validation});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validation,
      controller: inputController,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.grey[400],
              width: 1.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
                color: Colors.black, width: 1.0, style: BorderStyle.solid),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black),
          fillColor: Colors.black),
    );
  }
}

class ActionButton extends StatelessWidget {
  String label;
  Color color;
  Function onPressed;

  ActionButton({this.label, this.color, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.5),
      child: Text(
        label,
        style: TextStyle(fontSize: 21),
      ),
      minWidth: 250.0,
      color: color,
      colorBrightness: Brightness.dark,
      splashColor: Colors.black12,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: color)),
    );
  }
}
