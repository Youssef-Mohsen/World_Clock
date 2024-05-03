import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void SetUpWorldTime () async
  {
    WorldTime instance = WorldTime(location: 'Cairo' , flag: 'egypt.png', url: 'Africa/Cairo');
    await instance.getTime();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'daytime':instance.isDayTime,
    });
    setState(() {

    });
  }
  @override
  void initState() {
    super.initState();
    SetUpWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:  SpinKitFadingCube(color: Colors.white,size: 80.0,),
        ),

    );
  }
}
