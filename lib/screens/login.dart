import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'signup.dart';
import 'home.dart';
import '../models/authentication.dart';
import 'forgotpasst.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> _formKey =GlobalKey();

  Map<String, String> _authData = {
    'email': '',
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
      await Provider.of<Authentication>(context, listen: false).logIn(
          _authData['email'],
          _authData['password']
      );
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    } catch (error)
    {
        var errorMessage = 'Password Or Email incorrect. Please try again';
        _showErrorDialog(errorMessage);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Text('Sing Up'),
                Icon(Icons.person_add)
              ],
            ),
            textColor: Colors.white,
            onPressed: (){

              Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);
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
                  Colors.lightGreenAccent,
                  Colors.lightBlue,
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
                height: 280,
                  width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
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
                        /* forgot password      */
                        SizedBox(
                          height: 10,
                        ),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           TextButton(
                           child: Text("Forgot Password ?"),
                           onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ForgotPassword()),)
                           ),

                         ],
                       ),

                        SizedBox(
                          height: 10,
                        ),

                        RaisedButton(
                          child: Text(
                            'Submit'
                          ),
                          onPressed: ()
                          {
                            _submit();
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
