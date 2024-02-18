import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "New App",
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar:  AppBar(
           backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          shadowColor: const Color.fromARGB(255, 243, 177, 33),
          elevation: 5,  // Add this line to set elevation
          
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            // Update the style of the text here
            tooltip: 'Open Menu',
            color: Colors.white, // Set text color to white
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
          ),
          
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Black Hole",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),

        body:  SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
          
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "Space Details",
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                      fontSize: 30,
                      color: Color.fromARGB(255, 255, 255, 255),
                    
                  ),
                  ),
          
                  const SizedBox(
                    height: 50,
                  ),
          
                  Center(child: Image.asset("../assets/space1.png",height: 300,)),
          
                   const SizedBox(
                    height: 50,
                  ),
          
                  const Text(" It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose   ",
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                    fontWeight: FontWeight.w100,
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                      
                  ),
                  
                  ),
          
            const SizedBox(
                    height: 30,
                  ),

              // button

              Center(
                child: GestureDetector(
                  onTap: () {
                    
                  },
                 
                
                  child: Container(
                    
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Color.fromARGB(255, 66, 41, 41)),
                    child: Text("SPACE DETAILS",
                    style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
              ),





                    const SizedBox(
                    height: 50,
                  ),
          
          
          
          
          
          
          
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}
