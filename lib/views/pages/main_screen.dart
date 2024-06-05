
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_container/dropdown_container.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mailer/data/model.dart';
import 'package:mailer/views/pages/left_custom_email_pannel.dart';
import 'package:mailer/views/widgets/steps.dart';


class Home extends StatefulWidget {
  final String param;

  // Constructor with a named parameter 'param'
  Home({Key? key, this.param = "noparam"}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> with TickerProviderStateMixin {
    int activeStep = 0;
  final List myTiles = [
    'A',
    'B',
    'C',
    'D',
  ];
  late final DropdownContainerController _dropdownController;
 List<DropdownContainerController> t=[DropdownContainerController(),DropdownContainerController(),DropdownContainerController()];
List<dynamic> Components =[
  TextModel(content: 'Dear Valued Customers,', fontsize: 15, color_code: '000000', type: 'text',alignment: "center"),
  TextModel(content: 'To celebrate the launch of our new product line, we are offering an exclusive discount to our loyal customers. Simply use the code NEW15 at checkout to enjoy 15% off your first purchase from our latest collection.', fontsize: 9, color_code: '000000', type: 'text',alignment: "left"),

  ButtonModel(background:"1675E4" , content: 'But it now', fontsize: 10, color_code: 'FFFFFF', type: 'button',alignment: "center")
];
 final TextEditingController ContentController = TextEditingController();
 final TextEditingController FontController = TextEditingController();

 List<TextControlModel> c = [];

String dropdownValue = 'Dog';

  var _pageController = PageController(initialPage: 1);



Color color_exploit = Color.fromARGB(255, 219, 219, 219);
  // reorder method
  void updateMyTiles(int oldIndex, int newIndex) {
    setState(() {
      // this adjustment is needed when moving down the list
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }

      // get the tile we are moving
      var k = c.removeAt(oldIndex);
       var tile = Components.removeAt(oldIndex);
      // place the tile in new position
      c.insert(newIndex,k);
      Components.insert(newIndex, tile);
    });
  }
  @override
  void initState() {
    for(var i =0;i<t.length;i++)
    {
    t[i]=DropdownContainerController();
    c.add(TextControlModel(content_controler: TextEditingController(), fontsize_controler: TextEditingController()));
    c[i].content_controler.text=Components[i].content.toString();
      c[i].fontsize_controler.text=Components[i].fontsize.toString();
      c[i].content_controler.addListener(() { 
        print(c[i].content_controler.text);
        setState(() {
                  Components[i].content=c[i].content_controler.text;

        });
    });
         c[i].fontsize_controler.addListener(() { 
        print(c[i].fontsize_controler.text);
        setState(() {
                  Components[i].fontsize=int.parse(c[i].fontsize_controler.text);

        });


      });
        }
        _dropdownController = DropdownContainerController();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      
      appBar: AppBar(
      title:    Text(
      'LANOTES',
      style: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 15,
     fontWeight: FontWeight.w900,
     color: Color(0xff291334))
   ),
),
        elevation: 5,shadowColor: const Color.fromARGB(255, 12, 12, 12),
      leading:      Image.asset("assets/icon.png",width: 30,),

actions: [
  CircleAvatar(child:  Image.network("https://lh3.googleusercontent.com/a/ACg8ocKCKDdHZigpV5i67X3e8Px6qRtRoD4zdMnIClBKj6hynnMd2ywG=s96-c"),)
 ],
),
      
      backgroundColor:  Color.fromARGB(255, 255, 255, 255),


      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: 
          
          
          [
          /*
            ElevatedButton(onPressed: (){
             setState(() {
               activeStep=2;
             });
          
            }, child: Text("data")),
           */
            
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: CustomStepperWidget(
                  activeStep: activeStep,
                  onStepReached: (index) => setState(() => activeStep = index)
                ),
            ),   
          
          
          Container(
            height: MediaQuery.of(context).size.height*0.8,
            child: SingleChildScrollView(
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Left_custom_email_pannel(),
                    
                       DragTarget<List<dynamic>>(
                        onMove: (data){
     setState(() {
                            color_exploit=Color.fromARGB(255, 1, 250, 237);             ;
                          });
                        },
                        onLeave: (data){
                              setState(() {
                            color_exploit=const Color.fromARGB(255, 250, 249, 249);             ;
                          });
                        },
                 
                        onAccept: (data) {
                          print("ttttt");
                           setState(() {
                            color_exploit=Colors.green;
                            Components.add(data[0]);
                            t.add(DropdownContainerController());
                                c.add(TextControlModel(content_controler: TextEditingController(), fontsize_controler: TextEditingController()));

                           c[c.length-1].content_controler.text=data[0].content.toString();

                           c[c.length-1].fontsize_controler.text=data[0].fontsize.toString();

                            c[c.length-1].content_controler.addListener(() { 
        setState(() {
                  Components[Components.length-1].content=c[c.length-1].content_controler.text;

        });
    });

                 c[c.length-1].fontsize_controler.addListener(() { 
        setState(() {
                  Components[Components.length-1].fontsize=int.parse(c[c.length-1].fontsize_controler.text);

        });
    });

                          });
                        },
                        builder: (context, _, __)=>
                        DottedBorder( 
                        strokeWidth: 2,
                        color:  color_exploit,
                       radius: Radius.circular(12),
                       padding: EdgeInsets.all(0),
                          child: Container(
                                             
                           decoration: BoxDecoration(
                             image: DecorationImage(
                                         image: AssetImage("assets/background.png"),
                                         fit: BoxFit.cover,
                                       ),
                                                 color: Colors.white,
                                               borderRadius: BorderRadius.circular(10), 
                                               border: Border.all(
                                                 color:  Color.fromRGBO(158, 158, 158, 1).withOpacity(0.5), 
                                                 width: 0.5, // Border width
                                               ),
                                               boxShadow: [
                                                 BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 2, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset: Offset(0, 3), // Offset of the shadow
                                                 ),
                                               ],
                                             ),
                            width: MediaQuery.of(context).size.width*0.4,
                            margin: EdgeInsets.all(20),
                           height: MediaQuery.of(context).size.height*0.7,

                           child: SingleChildScrollView(
                             child: Column(children: [
                                         for (var i=0 ; i<Components.length;i++)     
                                 Stack(
                                   children: [
                                 Positioned(
                                  right: 0,
                                   child:    MouseRegion(
                                              cursor: SystemMouseCursors.click, 
                                     child: GestureDetector(
                                      onTap: (){
                                     t[i].open();
                                      },
                                       child: Icon(BootstrapIcons.pencil,
                                                           color: Color.fromARGB(255, 73, 188, 255),),
                                     ),
                                   ),
                                 ),

                                     Container(
                                                                  width: MediaQuery.of(context).size.width*0.4,

                                      margin: EdgeInsets.all(20),
                                       child: DottedBorder(
                                         radius: Radius.circular(12),
                                         padding: EdgeInsets.all(0),
                                         color: Colors.grey,
                                                               strokeWidth: 2,
                                       
                                                                 child: Container( 
                                                                  margin: EdgeInsets.all(0),
                                                        height: 100,
                                                    width: MediaQuery.of(context).size.width*0.4,

                                                  
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(0, 255, 255, 255),
                                                     borderRadius: BorderRadius.circular(10), 
                                                     border: Border.all(
                                                       color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.5), 
                                                       width: 0.5, // Border width
                                                     ),
                                             
                                                   ),
                                                  
                                                                  child: 
                                                                  Components[i].type == 'text'?
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                      Expanded(
                                                                        child: Text(
                                                                          
                                                                          textAlign:  Components[i].alignment == "left"? TextAlign.left :   Components[i].alignment == "right" ? TextAlign.right:TextAlign.center,
                                                                                                                                '${Components[i].content}',
                                                                                                                                style: GoogleFonts.montserrat(
                                                                                                                                textStyle: TextStyle(fontSize: Components[i].fontsize,
                                                                                                                               fontWeight: FontWeight.w900,
                                                                                                                               color: HexColor('#${Components[i].color_code}')),
                                                                                                                               
                                                                                                                             ),
                                                                                                                          ),
                                                                      ),
                                                                    ],
                                                                  ):
                                                        Row(
                                                          mainAxisAlignment:  Components[i].alignment == "left"? MainAxisAlignment.start :Components[i].alignment == "center"?MainAxisAlignment.center:MainAxisAlignment.end,
                                                          children: [
                                                            Container( 
                                                              margin: EdgeInsets.all(20),
                                                              alignment: Alignment.center,
                                                                                                                height: 100,
                                                                                                                width: 200,
                                                                                                              
                                                                                                          
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: HexColor('#${Components[i].background}'),
                                                                                                             borderRadius: BorderRadius.circular(10), 
                                                                                                             border: Border.all(
                                                                                                               color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.5), 
                                                                                                               width: 0.5, // Border width
                                                                                                             ),
                                                                                                          
                                                                                                           ),
                                                                                                          
                                                              child: Text(
                                                                                                                '${Components[i].content}',
                                                                                                                style: GoogleFonts.montserrat(
                                                                                                                textStyle: TextStyle(fontSize: Components[i].fontsize,
                                                                                                               fontWeight: FontWeight.w900,
                                                                                                               color:HexColor('#${Components[i].color_code}') ))
                                                                                                             
                                                                                                          ),),
                                                          ],
                                                        ),
                                                  ),
                                                               ),
                                     ),
                                   ],
                                 ),
                             ],),
                           ),
                                             ),
                        ),
                        
                       ) ,

 Container(

                

        child: Column(
          children: [
            
                         Container(
                         
                           child: ButtonBar(
                            
  alignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
    TextButton( child: Text(  'Layouts',
                                                 style: GoogleFonts.montserrat(
                                                                                                                textStyle: TextStyle(fontSize: 15,
                                                                                                               fontWeight: FontWeight.w900,
                                                                                                               color:Colors.black))
                                                                                                             
                                                                                                          ), onPressed: () {
          _pageController.previousPage(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.easeInOut,
                                              );

     
    }),
    TextButton( child: Text(  'Style',
                                                 style: GoogleFonts.montserrat(
                                                                                                                textStyle: TextStyle(fontSize: 15,
                                                                                                               fontWeight: FontWeight.w900,
                                                                                                               color:Colors.black))
                                                                                                             
                                                                                                          ), onPressed: () {

                _pageController.nextPage(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.easeInOut,
                                              );
    }),
  ],
),
                         ),

            Container(
                      height: MediaQuery.of(context).size.height*0.6,
            margin: EdgeInsets.all(20),
            width: 400,

              child: PageView(
                              controller: _pageController,
                              allowImplicitScrolling: false,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (int page) {
                                setState(() {
                                });
                              },
                              children: [
                                ListView(

                                children: [

       Container(
                decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(10), 
                                             border: Border.all(
                                               color: Color.fromARGB(134, 48, 48, 48), 
                                               width: 1, // Border width
                                             ),
                                        
                                           ),
                      width: 400,
                      height: MediaQuery.of(context).size.height*0.6,
                    padding: EdgeInsets.all(0),
                    child: ReorderableListView(
                          padding: const EdgeInsets.all(0),
                          children: [
                            for (var i=0;i< Components.length;i++)
                              Container(
                                width: 250,
                                
                                key: ValueKey(Components[i]),
                                padding: const EdgeInsets.all(.0),
                                child: Column(
                                  children: [
                                   
                                         DropdownContainer(
                                          child:  GestureDetector(
                                        onTap: (){
                                                            t[i].open();
                                      print("lena");
                                    },
                                      child: Container(
                                        child: ListTile(
                                              title: Text(Components[i].type),
                                        ),
                                      ),
                                    ),
                                                  controller: t[i],
                                           dropdownBuilder: (BuildContext context1) =>
                                          Container(
                                                decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(10), 
                                             border: Border.all(
                                               color: Color.fromARGB(134, 48, 48, 48), 
                                               width: 1, // Border width
                                             ),
                                        
                                           ),
                                                            alignment: Alignment.center,
                                                            width: MediaQuery.of(context).size.width*0.5,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: 
                                                            
                                                            [
                                                      
                                               Center(
                                                     child: Padding(
                                                       padding: EdgeInsets.all(20.0),
                                                       child: SizedBox(
                                                         height: 100, // Set the desired height here
                                                         child: TextField(
                                                              maxLines: null,
                                                              
                                               expands: true,
                                                           controller: c[i].content_controler,
                                                        decoration: InputDecoration(
                                               enabledBorder: OutlineInputBorder(
                                                 borderSide:
                                                     BorderSide(width: 0.5, color: const Color.fromARGB(255, 68, 68, 68)), //<-- SEE HERE
                                                 borderRadius: BorderRadius.circular(10.0),
                                               ),
                                             ),
                                                           style: TextStyle(fontSize: 10), // Set the font size
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                           
                                                       Center(
                                                     child: Padding(
                                                       padding: EdgeInsets.all(20.0),
                                                       child: Row(
                                                         children: [
                                           
                                              Text(
                                                          'Font-Size',
                                                          style: GoogleFonts.montserrat(
                                                          textStyle: TextStyle(fontSize: 10,
                                                         fontWeight: FontWeight.w900,
                                                         color: Color.fromARGB(255, 31, 31, 31))
                                                       ),
                                                    ),
                                                    SizedBox(width: 50,),
                                           
                                           
                                                           SizedBox(
                                                             width: 70,
                                                             height: 70, // Set the desired height here
                                                             child: TextField(
                                                                  maxLines: null,
                                                                  
                                                               expands: true,
                                                               controller:c[i].fontsize_controler,
                                                                 inputFormatters: <TextInputFormatter>[
                                                              // for below version 2 use this
                                                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
                                                           // for version 2 and greater youcan also use this
                                                            FilteringTextInputFormatter.digitsOnly
                                                           
                                                             ],
                                                            decoration: InputDecoration(
                                                             
                                                               enabledBorder: OutlineInputBorder(
                                                                 borderSide:
                                                                     BorderSide(width: 0.5, color: const Color.fromARGB(255, 68, 68, 68)), //<-- SEE HERE
                                                                 borderRadius: BorderRadius.circular(5.0),
                                                               ),
                                                             ),
                                                               style: TextStyle(fontSize: 16), // Set the font size
                                                             ),
                                                           ),
                                                         ],
                                                       ),
                                                     ),
                                                   ),
                                           
                                           
                                                         Center(
                                                     child: Padding(
                                                       padding: EdgeInsets.all(20.0),
                                                       child: Row(
                                                         children: [
                                           
                                              Text(
                                                          'Font Color',
                                                          style: GoogleFonts.montserrat(
                                                          textStyle: TextStyle(fontSize: 10,
                                                         fontWeight: FontWeight.w900,
                                                         color: Color.fromARGB(255, 31, 31, 31))
                                                       ),
                                                    ),
                                                    SizedBox(width: 50,),
                                           
                                                           GestureDetector(
                                                             onTap: (){
                                                               showDialog(context: context, builder: (BuildContext context) { 
                                                                 return Dialog(
                                                                   child: 
                                                           SizedBox(
                                                             width: 300,
                                                       // Set the desired height here
                                                             child: ColorPicker(
                                                               wheelDiameter: 190,
                                                               wheelWidth: 16,
                                                               wheelHasBorder: false,
                                                                onColorChanged: (Color value) { 
                                                                 print(value.toString());
                                                                   RegExp regExp = RegExp(r"0x([a-fA-F0-9]+)");
                                             String colorString = value.toString();
                                             String extractedColor = regExp.firstMatch(colorString)?.group(1) ?? "";
                                             print(extractedColor); 
                                                                  setState(() {
                                                                   Components[i].color_code=extractedColor;
                                           
                                                                  });
                                                                },
                                                               
                                                             )
                                                           ),
                                                                 );
                                                                });
                                                             },
                                                             child: Container(
                                                                    decoration: BoxDecoration(
                                                                      color: HexColor('#${Components[i].color_code}'),
                                             borderRadius: BorderRadius.circular(10), 
                                             border: Border.all(
                                               color: Color.fromARGB(134, 48, 48, 48), 
                                               width: 1, // Border width
                                             ),
                                        
                                           ),
                                                              height: 50,width: 50,)),
                                           
                                                         ],
                                                       ),
                                                     ),
                                                   ),
                                           
                                                
                                                


Components[i].type == "button" ?
        Center(
                                                     child: Padding(
                                                       padding: EdgeInsets.all(20.0),
                                                       child: Row(
                                                         children: [
                                           
                                              Text(
                                                          'background Color',
                                                          style: GoogleFonts.montserrat(
                                                          textStyle: TextStyle(fontSize: 10,
                                                         fontWeight: FontWeight.w900,
                                                         color: Color.fromARGB(255, 31, 31, 31))
                                                       ),
                                                    ),
                                                    SizedBox(width: 50,),
                                           
                                                           GestureDetector(
                                                             onTap: (){
                                                               showDialog(context: context, builder: (BuildContext context) { 
                                                                 return Dialog(
                                                                   child: 
                                                           SizedBox(
                                                             width: 300,
                                                       // Set the desired height here
                                                             child: ColorPicker(
                                                               wheelDiameter: 190,
                                                               wheelWidth: 16,
                                                               wheelHasBorder: false,
                                                                onColorChanged: (Color value) { 
                                                                 print(value.toString());
                                                                   RegExp regExp = RegExp(r"0x([a-fA-F0-9]+)");
                                             String colorString = value.toString();
                                             String extractedColor = regExp.firstMatch(colorString)?.group(1) ?? "";
                                             print(extractedColor); 
                                                                  setState(() {
                                                                   Components[i].background=extractedColor;
                                           
                                                                  });
                                                                },
                                                               
                                                             )
                                                           ),
                                                                 );
                                                                });
                                                             },
                                                             child: Container(
                                                                    decoration: BoxDecoration(
                                                                      color: HexColor('#${Components[i].background}'),
                                             borderRadius: BorderRadius.circular(10), 
                                             border: Border.all(
                                               color: Color.fromARGB(134, 48, 48, 48), 
                                               width: 1, // Border width
                                             ),
                                        
                                           ),
                                                              height: 50,width: 50,)),
                                           
                                                         ],
                                                       ),
                                                     ),
                                                   ):SizedBox(),                              
                                                
                                                
                                                
                                                


                                                
                                                   Center(
                                                     child: Padding(
                                                       padding: EdgeInsets.all(20.0),
                                                       child: Row(
                                                         children: [
                                           
                                              Text(
                                                          'Aligments',
                                                          style: GoogleFonts.montserrat(
                                                          textStyle: TextStyle(fontSize: 10,
                                                         fontWeight: FontWeight.w900,
                                                         color: Color.fromARGB(255, 31, 31, 31))
                                                       ),
                                                    ),
                                                    SizedBox(width: 50,),
                                           
                                           // Step 1.
// Step 2.
DropdownButton<String>(
  // Step 3.
  value: Components[i].alignment,
  // Step 4.
  items: <String>['left', 'center', 'right']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        value,
        style: TextStyle(fontSize: 15),
      ),
    );
  }).toList(),
  // Step 5.
  onChanged: (String? newValue) {
    setState(() {
      Components[i].alignment=newValue;
    });
  },
),
                                                  
                                                         ],
                                                       ),
                                                     ),
                                                   ),
                                           
                                           
                                                          ],),) ,
                                           
                                         )
                                  ],
                                ),
                              ),
                          ],
                          onReorder: (oldIndex, newIndex) {
                            updateMyTiles(oldIndex, newIndex);
                          },
                        ),
                  ),
                  
                  

                                ],  
                                ),
                                   ListView(

                                children: [
                                                           

                                Container(
                                          decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(10), 
                                             border: Border.all(
                                               color: Color.fromARGB(134, 48, 48, 48), 
                                               width: 1, // Border width
                                             ),
                                        
                                           ),
                                  child: Column(
                                    children: [
                                         for (var i=0;i< Components.length;i++)
                                      Container(
                                                    margin: EdgeInsets.all(20),
                                      
                                                      decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(10), 
                                                   border: Border.all(
                                                     color: Color.fromARGB(134, 48, 48, 48), 
                                                     width: 1, // Border width
                                                   ),
                                              
                                                 ),
                                                                  alignment: Alignment.center,
                                                                  width: MediaQuery.of(context).size.width*0.5,
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: 
                                                                  
                                                                  [
                                                            
                                                     Center(
                                                           child: Padding(
                                                             padding: EdgeInsets.all(20.0),
                                                             child: SizedBox(
                                                               height: 100, // Set the desired height here
                                                               child: TextField(
                                                                    maxLines: null,
                                                                    
                                                     expands: true,
                                                                 controller: c[i].content_controler,
                                                              decoration: InputDecoration(
                                                     enabledBorder: OutlineInputBorder(
                                                       borderSide:
                                                           BorderSide(width: 0.5, color: const Color.fromARGB(255, 68, 68, 68)), //<-- SEE HERE
                                                       borderRadius: BorderRadius.circular(10.0),
                                                     ),
                                                   ),
                                                                 style: TextStyle(fontSize: 10), // Set the font size
                                                               ),
                                                             ),
                                                           ),
                                                         ),
                                                 
                                                             Center(
                                                           child: Padding(
                                                             padding: EdgeInsets.all(20.0),
                                                             child: Row(
                                                               children: [
                                                 
                                                    Text(
                                                                'Font-Size',
                                                                style: GoogleFonts.montserrat(
                                                                textStyle: TextStyle(fontSize: 10,
                                                               fontWeight: FontWeight.w900,
                                                               color: Color.fromARGB(255, 31, 31, 31))
                                                             ),
                                                          ),
                                                          SizedBox(width: 50,),
                                                 
                                                 
                                                                 SizedBox(
                                                                   width: 70,
                                                                   height: 70, // Set the desired height here
                                                                   child: TextField(
                                                                        maxLines: null,
                                                                        
                                                                     expands: true,
                                                                     controller:c[i].fontsize_controler,
                                                                       inputFormatters: <TextInputFormatter>[
                                                                    // for below version 2 use this
                                                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
                                                                 // for version 2 and greater youcan also use this
                                                                  FilteringTextInputFormatter.digitsOnly
                                                                 
                                                                   ],
                                                                  decoration: InputDecoration(
                                                                   
                                                                     enabledBorder: OutlineInputBorder(
                                                                       borderSide:
                                                                           BorderSide(width: 0.5, color: const Color.fromARGB(255, 68, 68, 68)), //<-- SEE HERE
                                                                       borderRadius: BorderRadius.circular(5.0),
                                                                     ),
                                                                   ),
                                                                     style: TextStyle(fontSize: 16), // Set the font size
                                                                   ),
                                                                 ),
                                                               ],
                                                             ),
                                                           ),
                                                         ),
                                                 
                                                 
                                                               Center(
                                                           child: Padding(
                                                             padding: EdgeInsets.all(20.0),
                                                             child: Row(
                                                               children: [
                                                 
                                                    Text(
                                                                'Font Color',
                                                                style: GoogleFonts.montserrat(
                                                                textStyle: TextStyle(fontSize: 10,
                                                               fontWeight: FontWeight.w900,
                                                               color: Color.fromARGB(255, 31, 31, 31))
                                                             ),
                                                          ),
                                                          SizedBox(width: 50,),
                                                 
                                                                 GestureDetector(
                                                                   onTap: (){
                                                                     showDialog(context: context, builder: (BuildContext context) { 
                                                                       return Dialog(
                                                                         child: 
                                                                 SizedBox(
                                                                   width: 300,
                                                             // Set the desired height here
                                                                   child: ColorPicker(
                                                                     wheelDiameter: 190,
                                                                     wheelWidth: 16,
                                                                     wheelHasBorder: false,
                                                                      onColorChanged: (Color value) { 
                                                                       print(value.toString());
                                                                         RegExp regExp = RegExp(r"0x([a-fA-F0-9]+)");
                                                   String colorString = value.toString();
                                                   String extractedColor = regExp.firstMatch(colorString)?.group(1) ?? "";
                                                   print(extractedColor); 
                                                                        setState(() {
                                                                         Components[i].color_code=extractedColor;
                                                 
                                                                        });
                                                                      },
                                                                     
                                                                   )
                                                                 ),
                                                                       );
                                                                      });
                                                                   },
                                                                   child: Container(
                                                                          decoration: BoxDecoration(
                                                                            color: HexColor('#${Components[i].color_code}'),
                                                   borderRadius: BorderRadius.circular(10), 
                                                   border: Border.all(
                                                     color: Color.fromARGB(134, 48, 48, 48), 
                                                     width: 1, // Border width
                                                   ),
                                              
                                                 ),
                                                                    height: 50,width: 50,)),
                                                 
                                                               ],
                                                             ),
                                                           ),
                                                         ),
                                                 
                                                      
                                                      
                                      
                                      
                                      Components[i].type == "button" ?
                                              Center(
                                                           child: Padding(
                                                             padding: EdgeInsets.all(20.0),
                                                             child: Row(
                                                               children: [
                                                 
                                                    Text(
                                                                'background Color',
                                                                style: GoogleFonts.montserrat(
                                                                textStyle: TextStyle(fontSize: 10,
                                                               fontWeight: FontWeight.w900,
                                                               color: Color.fromARGB(255, 31, 31, 31))
                                                             ),
                                                          ),
                                                          SizedBox(width: 50,),
                                                 
                                                                 GestureDetector(
                                                                   onTap: (){
                                                                     showDialog(context: context, builder: (BuildContext context) { 
                                                                       return Dialog(
                                                                         child: 
                                                                 SizedBox(
                                                                   width: 300,
                                                             // Set the desired height here
                                                                   child: ColorPicker(
                                                                     wheelDiameter: 190,
                                                                     wheelWidth: 16,
                                                                     wheelHasBorder: false,
                                                                      onColorChanged: (Color value) { 
                                                                       print(value.toString());
                                                                         RegExp regExp = RegExp(r"0x([a-fA-F0-9]+)");
                                                   String colorString = value.toString();
                                                   String extractedColor = regExp.firstMatch(colorString)?.group(1) ?? "";
                                                   print(extractedColor); 
                                                                        setState(() {
                                                                         Components[i].background=extractedColor;
                                                 
                                                                        });
                                                                      },
                                                                     
                                                                   )
                                                                 ),
                                                                       );
                                                                      });
                                                                   },
                                                                   child: Container(
                                                                          decoration: BoxDecoration(
                                                                            color: HexColor('#${Components[i].background}'),
                                                   borderRadius: BorderRadius.circular(10), 
                                                   border: Border.all(
                                                     color: Color.fromARGB(134, 48, 48, 48), 
                                                     width: 1, // Border width
                                                   ),
                                              
                                                 ),
                                                                    height: 50,width: 50,)),
                                                 
                                                               ],
                                                             ),
                                                           ),
                                                         ):SizedBox(),                              
                                                      
                                                      
                                                      
                                                      
                                      
                                      
                                                      
                                                         Center(
                                                           child: Padding(
                                                             padding: EdgeInsets.all(20.0),
                                                             child: Row(
                                                               children: [
                                                 
                                                    Text(
                                                                'Aligments',
                                                                style: GoogleFonts.montserrat(
                                                                textStyle: TextStyle(fontSize: 10,
                                                               fontWeight: FontWeight.w900,
                                                               color: Color.fromARGB(255, 31, 31, 31))
                                                             ),
                                                          ),
                                                          SizedBox(width: 50,),
                                                 
                                                 // Step 1.
                                      // Step 2.
                                      DropdownButton<String>(
                                        // Step 3.
                                        value: Components[i].alignment,
                                        // Step 4.
                                        items: <String>['left', 'center', 'right']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          );
                                        }).toList(),
                                        // Step 5.
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            Components[i].alignment=newValue;
                                          });
                                        },
                                      ),
                                                        
                                                               ],
                                                             ),
                                                           ),
                                                         ),
                                                 
                                                 
                                                                ],),),
                                    ],
                                  ),
                                ) ,
                                           
                                    
                                ],  
                                )
                                
                                
                             
                              ],
                            ),
            ),
          ],
        ),
      ),

                          
                    ],
                  ),
                ),
              ),
            ),
          )   ,
          
                
          
          
          
          
          
          ]),
        ),
      ),
      floatingActionButton:      ElevatedButton(
                  style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), 
                  ),
                  onPressed: (){

                     print(Components);
                     setState(() {
                       activeStep=2;
                     });
                  
                    }, child: Text(
      'NEXT',
      style: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 30,
     fontWeight: FontWeight.w900,
     color: Color.fromARGB(255, 255, 255, 255))
   ),
)),
    );
  }}


  
