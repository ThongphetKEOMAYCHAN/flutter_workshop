import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/authentication.dart';
import 'login.dart';
import 'home.dart';


class SignupScreen extends StatefulWidget {
   static const routeName = '/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final GlobalKey<FormState> _formKey =GlobalKey();
  TextEditingController _passwordController = new TextEditingController();
  Map<String, String> _authData = {

    'email':'',
    'password': ''
  };

  void _showErrorDialog(String msg)
  {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title:Text('Something is wrong!'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(

              child: Text('Close'),
              onPressed:(){
                Navigator.of(ctx).pop();
              }
          )
        ],
      ),
    );
  }
  Future<void> _submit() async
  {

    if(!_formKey.currentState.validate())
      {
        return;
      }
    _formKey.currentState.save();

    try{
      await Provider.of<Authentication>(context, listen:false).signUp(

          _authData['email'],
          _authData['password']
      );
      Navigator.of(context).pushReplacementNamed(Login.routeName);
    } catch(error)
    {
      var errorMessage = 'Authentication Failed. Please try again';
      _showErrorDialog(errorMessage);
    }
   await Provider.of<Authentication>(context, listen:false).signUp(
        _authData['email'],
        _authData['password']
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),

        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Text('Login'),
                Icon(Icons.person)
              ],
            ),
            textColor: Colors.white,
            onPressed: (){

              Navigator.of(context).pushReplacementNamed(Login.routeName);
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.limeAccent,
                    Colors.redAccent,
                  ]
              ),
            ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 350,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        /* #name*/
                        
                        /* #username*/
                        /*      email       */
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if(value.isEmpty || !value.contains('@')){
                              return 'invalid email';
                            }
                            return null;
                          },
                          onSaved: (value){

                            _authData['email'] = value;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                         controller: _passwordController,
                          validator: (value)
                          {
                            if(value.isEmpty || value.length<=5)
                            {
                              return 'invalid password';
                            }
                            return null;
                          },
                          onSaved: (value){

                            _authData['password'] = value;
                          },
                        ),

                        /* confirm password*/
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Confirm Password'),

                          obscureText: true,

                          validator: (value)
                          {
                            if(value.isEmpty || value != _passwordController.text)
                            {
                              return 'invalid password';
                            }
                            return null;
                          },
                          onSaved: (value){

                          },
                        ),
                        /* # confirm password*/
                        SizedBox(
                          height: 20,
                        ),

                        RaisedButton(
                          child: Text(
                              'Submit'
                          ),
                          onPressed: ()
                          {

                           _submit();
                           //Navigator.of(context).pushReplacementNamed(Login.routeName);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
