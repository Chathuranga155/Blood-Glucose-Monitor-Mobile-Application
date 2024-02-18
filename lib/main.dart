import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';


void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}



class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Email TextFormField
            CustomTextField(
              labelText: 'Email',
              icon: Icons.email,
            ),
            SizedBox(height: 16),

            // Password TextFormField
            CustomTextField(
              labelText: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: 16),

            // Sign In Button
            ElevatedButton(
              onPressed: () {
                // Add sign-in logic here
                Get.to(() => HomeScreen());
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 16),

            // Sign Up Button
            TextButton(
              onPressed: () {
                Get.to(() => SignUpScreen());
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;

  CustomTextField({
    required this.labelText,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Add a border around the input field
        borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}




class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                ' Register Form',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              items: [                
                'Adult Type 1',
                'Adult Type 2',
                'Child Type 1',
                'Pregnant Person',
                'Older',
                'Other'
                ].map((String userType) {
                return DropdownMenuItem<String>(
                  value: userType,
                  child: Text(userType),
                );
              }).toList(),
              onChanged: (value) {
                // Handle user type selection
              },
              decoration: InputDecoration(
                labelText: 'Select User Type',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add sign-up logic here
                Get.to(() => SignInScreen());
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}


class BloodSugarController extends GetxController {
  RxDouble beforeSugar = RxDouble(0.0);
  RxDouble afterSugar = RxDouble(0.0);

  void validateAndNavigate() {
    if (beforeSugar.value > 0 && afterSugar.value > 0) {
      Get.to(() => InformationScreen());
    } else {
      Get.snackbar(
        'Invalid Data',
        'Please enter valid before and after blood sugar values.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

class HomeScreen extends StatelessWidget {
  final BloodSugarController controller = Get.put(BloodSugarController());

  @override
  Widget build(BuildContext context) {
    return InputScreen(controller);
  }
}

class InputScreen extends StatelessWidget {
  final BloodSugarController controller;

  InputScreen(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      appBar: AppBar(
        elevation: 5,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
              tooltip: 'Open Menu',
              color: Colors.white,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
            );
          },
        ),
        title: Text(
          'Blood Sugar monitor',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(65, 56, 240, 1),
                Color.fromRGBO(79, 17, 194, 1),
                Color.fromRGBO(96, 3, 202, 1),
              ],
              stops: [0, 0.35, 1],
            ),
          ),
        ),
      ),

      drawer: NavigationDrawer(),

      // In creating another home page, there should be a button called check your sugar. When you click it, you should go to the blood sugar part

      body: Container(
        color: Color.fromARGB(223, 8, 8, 8), // Set the background color to black
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

           DropdownButtonFormField<String>(
              items: [                
                'Adult Type 1',
                'Adult Type 2',
                'Child Type 1',
                'Pregnant Person',
                'Older',
                'Other'
                ].map((String userType) {
                return DropdownMenuItem<String>(
                  value: userType,
                  child: Text(userType),
                );
              }).toList(),
              onChanged: (value) {
                // Handle user type selection
              },
              decoration: InputDecoration(
                labelText: 'Select User Type',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),




            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) => controller.beforeSugar.value = double.tryParse(value) ?? 0.0,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,  // Set text field text color to white
              ),
              decoration: InputDecoration(
                labelText: 'Before Blood Sugar',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16, // Set label text color to white
                ),
              ),
            ),

              SizedBox(height: 16),

              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    controller.afterSugar.value = double.tryParse(value) ?? 0.0,
                      style: TextStyle(
                color: Colors.white, 
                fontSize: 20, // Set text field text color to white
              ),
                decoration: InputDecoration(labelText: 'After Blood Sugar',labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16, // Set label text color to white
                ),
                ),
              ),

              SizedBox(height: 16),

        
         
             



DecoratedBox(
    decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(186, 36, 93, 95), 
              Color.fromARGB(255, 45, 37, 73), 
              // const Color.fromARGB(110, 223, 64, 251),
              // Color.fromARGB(228, 36, 92, 94), 
              //add more colors
            ]),
          borderRadius: BorderRadius.circular(5),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                blurRadius: 5) //blur radius of shadow
          ]
      ),
    child:ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onSurface: Colors.transparent,
          shadowColor: Color.fromARGB(0, 10, 21, 68),
          //make color or elevated button transparent
      ),
      
      onPressed: () => controller.validateAndNavigate(), 
      child: Padding(
        padding:EdgeInsets.only(
          top: 12,
          bottom: 12,
        ),

        child:Text("Get Info", 
           style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 250, 250, 250)),
                   ),
      ),
    )  ,
),


            ],
          ),
        ),
      ),
    );
  }
}


class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        color: Color.fromARGB(255, 6, 4, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(65, 56, 240, 1),
                    Color.fromRGBO(43, 35, 207, 1),
                    Color.fromRGBO(96, 3, 202, 1),
                  ],
                  stops: [0, 0.35, 1],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CircleAvatar(
                  //   radius: 50,
                  //   backgroundColor: Colors.white,
                  // ),
                  SizedBox(height: 8),
                  Text(
                    '',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home_filled,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              onTap: () {
                Get.to(() => Home());
              },
            ),

                ListTile(
              leading: Icon(
                Icons.monitor,
                color: Colors.white,
              ),
              title: Text(
                'Monitor',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Color.fromARGB(255, 224, 197, 197),
                ),
              ),
              onTap: () {
                Get.to(() => HomeScreen());
              },
            ),

            ListTile(
              leading: Icon(
                Icons.info_rounded,
                color: Colors.white,
              ),
              title: Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Color.fromARGB(255, 224, 197, 197),
                ),
              ),
              onTap: () {
                Get.to(() => About());
              },
            ),

          SizedBox(
            height: 380,
          ),

            Column(
  children: [
    ListTile(
      leading: Icon(
        Icons.settings,
        color: Colors.white,
      ),
      title: Text(
        'Setting',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Color.fromARGB(255, 224, 197, 197),
        ),
      ),
      onTap: () {
        Get.to(() => About());
      },
    ),
    ListTile(
      leading: Icon(
        Icons.help,
        color: Colors.white,
      ),
      title: Text(
        'Help',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Color.fromARGB(255, 224, 197, 197),
        ),
      ),
      onTap: () {
        Get.to(() => About());
      },
    ),
  ],
)



          ],
        ),
      ),
    );
  }
}


class InformationScreen extends StatelessWidget {
  final BloodSugarController controller = Get.find();

  String categorizeBloodSugar(double level, String category) {
    if (category == 'Before meals (fasting)') {
      if (level >= 80 && level <= 130) {
        return 'Normal';
      } else if (level > 130 && level <= 180) {
        return 'High';
      } else {
        return 'Invalid Range';
      }
    } else if (category == 'After meals (post-prandial)') {
      if (level < 95) {
        return 'Normal';
      } else if (level >= 95 && level <= 140) {
        return 'High';
      } else {
        return 'Invalid Range';
      }
    } else if (category == 'Children with type 1 diabetes') {
      if (level >= 90 && level <= 130) {
        return 'Normal';
      } else if (level > 130 && level <= 150) {
        return 'High';
      } else {
        return 'Invalid Range';
      }
    } else if (category == 'Pregnant people (T1D, gestational diabetes)') {
      if (level < 95) {
        return 'Normal';
      } else if (level >= 95 && level <= 140) {
        return 'High';
      } else if (level > 140 && level <= 180) {
        return 'High';
      } else {
        return 'Invalid Range';
      }
    } else if (category == '65 or older') {
      if (level >= 80 && level <= 180) {
        return 'Normal';
      } else if (level > 180 && level <= 200) {
        return 'High';
      } else {
        return 'Invalid Range';
      }
    } else if (category == 'Without diabetes') {
      if (level < 99) {
        return 'Normal';
      } else if (level >= 99 && level <= 140) {
        return 'High';
      } else {
        return 'Invalid Range';
      }
    } else {
      return 'Invalid Category';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 88, 52, 218),
      appBar: AppBar(
        title: Text('Blood Sugar Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Before Blood Sugar: ${controller.beforeSugar.value}', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 25,), ),
            Text(
              'Category: ${categorizeBloodSugar(controller.beforeSugar.value,  'Before meals (fasting)',)}',
            ),
            SizedBox(height: 16),
            Text('After Blood Sugar: ${controller.afterSugar.value}',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 25,),),
            Text(
              'Category: ${categorizeBloodSugar(controller.afterSugar.value, 'After meals (post-prandial)',)}',
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.to(() => Home());
              },
              child: Text('Go To Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(65, 56, 240, 1),
                Color.fromRGBO(79, 17, 194, 1),
                Color.fromRGBO(96, 3, 202, 1),
              ],
              stops: [0, 0.35, 1],
            ),
          ),
        ),
      ),
      drawer: NavigationDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: DecoratedBox(
          decoration: BoxDecoration(),
          child: Text(
            'Welcome to the Home Page!',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class GlucosePieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: PieChart(
        PieChartData(
          sections: _createData(),
          sectionsSpace: 4,
          centerSpaceRadius: 32,
          startDegreeOffset: -90,
          borderData: FlBorderData(
            show: false,
          ),
          // sectionsBorderColor: const Color(0xff212121),
          // sectionsBorderWidth: 1,
          // centerSpaceColor: Colors.white,
          // borderGradient: LinearGradient(
          //   colors: [Colors.black, Colors.black],
          // ),
        ),
      ),
    );
  }
}

class GlucoseData {
  final String name;
  final double glucoseLevel;
  final Color color;

  GlucoseData(this.name, this.glucoseLevel, this.color);
}

List<PieChartSectionData> _createData() {
  return [
    PieChartSectionData(
      color: const Color(0xffFF0000),
      value: 60,
      title: 'Low',
      radius: 100,
      titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xff000000)),
    ),
    PieChartSectionData(
      color: const Color(0xff00FF00),
      value: 120,
      title: 'Normal',
      radius: 100,
      titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xff000000)),
    ),
    PieChartSectionData(
      color: const Color(0xffFFA500),
      value: 220,
      title: 'High',
      radius: 100,
      titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xff000000)),
    ),
  ];
}


class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('About'),
        title: Text(
          'About',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(65, 56, 240, 1),
                Color.fromRGBO(79, 17, 194, 1),
                Color.fromRGBO(96, 3, 202, 1),
              ],
              stops: [0, 0.35, 1],
            ),
          ),
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text(
          'Welcome to the About Page!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
