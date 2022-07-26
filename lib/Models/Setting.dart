import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Setting extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar:
      AppBar(
        centerTitle: true,
        title: const Text ('Business Page',style: TextStyle(
          fontWeight:FontWeight.bold,
        ),),
      ),*/

      body: Container(
        //height: 120,
        /*child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image( image:NetworkImage('https://pbs.twimg.com/media/FT4LbWmWQAAz1j9.jpg'),fit: BoxFit.cover,  )  ,
              Expanded(
                child: Container(
                  height: 120,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text('Title',style: TextStyle(
                          fontWeight:FontWeight.bold,
                        ),overflow: TextOverflow.ellipsis, maxLines: 3,),
                      ),
                      Text('22/10/2021',style: TextStyle(
                        fontWeight:FontWeight.w600,color: Colors.grey,
                      ),)


                    ], ),
                ),
              ),
            ]),*/
      ),
    );
  }
}
