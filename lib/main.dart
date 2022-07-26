import 'package:experiment_app/Examples/NavigattionBar/Cubit.dart';
import 'package:experiment_app/Examples/NavigattionBar/MainState.dart';
import 'package:experiment_app/Examples/Register.dart';
import 'package:experiment_app/Modules/Bmi%20app/BMI%20app.dart';
import 'package:experiment_app/Modules/BottomNavigationBar/BottomSheet.dart';
import 'package:experiment_app/Modules/Login_page.dart';
import 'package:experiment_app/Network/Remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Examples/NavigattionBar/NavigationBar.dart';
import 'Modules/CounterStete.dart';
import 'Network/Remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main (){

  DioHelper.initDio();

  runApp(HOME());
}
class HOME extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context ) => NavigatorCubit()..getBusiness()..getSporsts(),
      child: BlocConsumer<NavigatorCubit,MainState>(
        listener:(context , state){} ,
      builder: (context,state){
        var cubit = NavigatorCubit.get(context);
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
                appBarTheme:const AppBarTheme(
                    systemOverlayStyle : SystemUiOverlayStyle(
                      statusBarColor: Colors.black54,
                     // statusBarBrightness: Brightness.light,

                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.black,),
                  elevation: 0,
                  color: Colors.white,

                ),
                backgroundColor: Colors.white60,
                iconTheme: const IconThemeData(color : Colors.black),
                primarySwatch: Colors.orange,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white60,
              ),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )
                )
            ),

            darkTheme : ThemeData(
                scaffoldBackgroundColor: HexColor( '333739'),
                appBarTheme:AppBarTheme(
                    systemOverlayStyle : SystemUiOverlayStyle(
                      statusBarColor:HexColor( '333739'),
                      systemNavigationBarColor: Colors.white,
                      statusBarBrightness: Brightness.light,

                    ),
                    backgroundColor: HexColor( '333739'),
                    elevation: 0,
                    titleTextStyle:const TextStyle(

                      color: Colors.orange,),
                    iconTheme: const IconThemeData(
                        color: Colors.white
                )
                ),

                iconTheme: const IconThemeData(color : Colors.white60),
                primarySwatch: Colors.orange,
                bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                  backgroundColor: HexColor( '333739'),
                  elevation: 20,
                  selectedItemColor: Colors.grey,
                  unselectedItemColor: Colors.grey,
                ),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )
                )
            ),
            themeMode: cubit.SelectMode ? ThemeMode.light:ThemeMode.dark,
            debugShowCheckedModeBanner : false,

            home: Navigation(),
            //BottomNavigated(),


          );
      } ,
    ),
    );
  }
}
/*  floatingActionButton:FloatingActionButton(
onPressed: (){

if (DataBaseCubit.get(context).isShow) {
ScafKey.currentState?.showBottomSheet((context) =>
Form(
key: FormKey,
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
DefaultTextField(
Textcontroller: taskcontroll,
prefixed: Icons.shopping_cart_outlined,
validated: (String v) {
if (v.isEmpty) {
return 'must be empty';
}
},
labeled: 'task here',
),
SizedBox(height: 15,),
DefaultTextField(
Textcontroller: timecontroll,
prefixed: Icons.watch,
validated: (String v) {
if (v.isEmpty) {
return 'must be empty';
}
},
ontap: () {
showTimePicker(
context: context, initialTime: TimeOfDay.now())
    .then((value) {
timecontroll.text =
value!.format(context).toString();
});
},
labeled: 'time here',
),
SizedBox(height: 15,),
DefaultTextField(
Textcontroller: datecontroll,
prefixed: Icons.calendar_today,
validated: (String v) {
if (v.isEmpty) {
return 'must be empty';
}
},
ontap: () {
showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(),
lastDate: DateTime.parse('2022-10-04')).then((value) {
datecontroll.text= DateFormat.yMMMd().format(value!).toString();
});
},
labeled: 'Date here',
),

],),
)
).closed.then((value) {

//    IconEditer=Icons.edit,
//  isShow: true
// DataBaseCubit.get(context).IconEditer =Icons.edit;
// DataBaseCubit.get(context).isShow =true;
});

//  DataBaseCubit.get(context).IconEditer = Icons.add;
// DataBaseCubit.get(context).isShow =false;

}
else {
if (FormKey.currentState!.validate()) {
Navigator.pop(context);

//  DataBaseCubit.get(context).IconEditer = Icons.edit;
// DataBaseCubit.get(context).isShow = true;

}}
},
child:  Icon (DataBaseCubit.get(context).IconEditer),
),
        */
