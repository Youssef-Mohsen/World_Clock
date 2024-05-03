import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data:ModalRoute.of(context)!.settings.arguments as Map;


    String Bgimage = data['daytime'] ? 'day2.png':'night2.png';
    Color Bgcolor = data['daytime'] ? Colors.blue!: Colors.indigo[700]!;

    return  Scaffold(
      backgroundColor: Bgcolor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$Bgimage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                          icon: Icon(Icons.edit_location_rounded,color: Colors.grey[300],),
                            onPressed: ()async{
                              Map result ={};
                               result = await Navigator.pushNamed(context, '/Location') as Map;
                            setState(() {
                             data={
                               'time' : result['time'],
                               'location'  : result['location'],
                               'flag' :result['flag'],
                               'daytime': result['daytime'],
                             } as Map;
                            });
                            },
                            label: Text('Edit Location',style: TextStyle(color: Colors.grey[300]),),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/${data['flag']}'),
                      ),
                      SizedBox(width: 20.0,),
                      Text(data['location'],
                      style: TextStyle(fontSize: 38.0,letterSpacing: 2.0,color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 56.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  )


                ],
              ),
            ),
          )
        ),
    );
  }
}
