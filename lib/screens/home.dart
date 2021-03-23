import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/foodmeu.dart';
import 'login.dart';
import '../app_drawer.dart';


class Home extends StatefulWidget {
  //static const String routeName = "/home";
  static const routeName = '/home';


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> imgUrl = [
    "https://th.bing.com/th/id/OIP.CgXLkfg6bOR6fT3U8jXhswHaFl?w=249&h=188&c=7&o=5&dpr=1.25&pid=1.7",
    "https://th.bing.com/th/id/OIP.tgdxOEjezxCIlsD1f7X1NAAAAA?w=236&h=179&c=7&o=5&dpr=1.25&pid=1.7",
    "https://th.bing.com/th/id/OIP._fpL6Wo5uc-yHoUrkQEB8gHaFj?w=237&h=180&c=7&o=5&dpr=1.25&pid=1.7",
    "https://th.bing.com/th/id/OIP.R1-bCZZRkdgWmEV8Rs7TFgHaFB?w=243&h=180&c=7&o=5&dpr=1.25&pid=1.7",
    "https://th.bing.com/th/id/OIP.R00rIDpFiO874Wz0WAgGbAHaEK?w=304&h=180&c=7&o=5&dpr=1.25&pid=1.7",
    "https://th.bing.com/th/id/OIP.CQgyx4vp2fmkuRIGUtN4nwHaE8?pid=ImgDet&w=221&h=147&c=7&dpr=1.25",
    "https://th.bing.com/th/id/OIP.cpGpfx0rU5Z-TnYyMKLJlQHaF7?pid=ImgDet&w=221&h=177&c=7&dpr=1.25",
    "https://lh3.googleusercontent.com/proxy/PWSO6IbFdQ0kTFXUeHdtQmo5p-8ZtI2UNiEHIokXtBlgHJkIO1Au2SoTRxcx7Bivprq32RBHvyr7ixxG_E_ZJgOrYJPTmA=s0-d",
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        //backgroundColor: Color(0xFFFCFCFC),
        title: Text('Fruit Type',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[

          FlatButton(
            child: Row(
              children: <Widget>[
                Text(''),
                Icon(Icons.settings_power, color: Colors.white,)
              ],
            ),
            textColor: Colors.white,
            onPressed: (){
              //Logout.routName: (context)=> Login(),
              Navigator.of(context).pushReplacementNamed(Login.routeName);
            },
          ),
        ],

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Center(
              child: Text(
                'Order Fruit',
                style: TextStyle(fontSize: 24.0,
                  fontWeight: FontWeight.w700,),
              ),
            ),*/

            SizedBox(height: 20.0,),
            Container(
              width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                color: Color(0x55d2d2d2),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Expanded(child:TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: InputBorder. none,
                      contentPadding: EdgeInsets.only(left: 20.0),
                    ),
                  ),
                  ),

                  RaisedButton(
                    elevation: 3.0,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: (){},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),

                  child: Icon(Icons.search,
                  color: Colors.white,
                  ),
                    ),
                  color: Color(0xFFfc6a26),),

                ],
              ),
            ),
            SizedBox(height: 30.0,),
            /* food menu*/
            Expanded(
                child:GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  children: [
                    foodMenu(imgUrl[0], 'apples', '5000kip'),
                    foodMenu(imgUrl[1], 'apples', '5000kip'),
                    foodMenu(imgUrl[2], 'Oranges', '5000kip'),
                    foodMenu(imgUrl[3], 'Oranges', '10000kip'),
                    foodMenu(imgUrl[4], 'Bananas', '5000kip'),
                    foodMenu(imgUrl[5], 'Bananas', '10000kip'),
                    foodMenu(imgUrl[6], 'Rambutans', '10000kip'),
                    foodMenu(imgUrl[7], 'Coconuts', '10000kip'),
                ],
                ),
            ),

          ],
        ),
      ),
    );
  }
}
