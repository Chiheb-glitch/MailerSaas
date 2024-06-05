
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/data/model.dart';

class Left_custom_email_pannel extends StatelessWidget {
   Left_custom_email_pannel({
    super.key,
  });
  

List<dynamic> Components =["text","button"
];

  @override
  Widget build(BuildContext context) {
    
    var w=MediaQuery.of(context).size.width*0.3;
    return Container(
    
     
      width: w,
    height: MediaQuery.of(context).size.height*0.7,
        child:
         
         Column(
           children: [
            Text(
                   'Components',
                   style: GoogleFonts.montserrat(
                   textStyle: TextStyle(fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 53, 53, 53))
                ),
             ),
             Container(
              height:  MediaQuery.of(context).size.height*0.65,
               child: SingleChildScrollView(
                    child: Column(children: [
                     
                     
                   
                   
                       for (var i =0 ; i <Components.length; i++)
                     
                       
                       Draggable<List<dynamic>>(
                        data: Components[i] == "text" ?[TextModel(type: 'text', fontsize: 10, content: 'text', color_code: '000000', alignment: 'left')] : [ButtonModel(type: "button",background: "1675E4",color_code: "FFFFFF",content: "Button",fontsize: 15,alignment: "center")],
                        childWhenDragging: DottedBorder(
                          borderType: BorderType.RRect,
  radius: Radius.circular(12),
  padding: EdgeInsets.all(0),
  color: Colors.grey,
                        strokeWidth: 2,

                          child: Container( 
                           margin: EdgeInsets.all(0),
                           alignment: Alignment.center,
                                                width: 350,
                                                height: 100,
                                          
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(0, 255, 255, 255),
                                             borderRadius: BorderRadius.circular(10), 
                                             border: Border.all(
                                               color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.5), 
                                               width: 0.5, // Border width
                                             ),
                                     
                                           ),
                                          
                           child: Text(
                                                'Loading',
                                                style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(fontSize: 15,
                                               fontWeight: FontWeight.w900,
                                               color: Color.fromARGB(255, 31, 31, 31))
                                             ),
                                          ),),
                        ),
                        
                         feedback: Container( 
                         margin: EdgeInsets.all(20),
                         alignment: Alignment.center,
                                              width: 350,
                                              height: 100,
                                        
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 160, 155, 155),
                                           borderRadius: BorderRadius.circular(10), 
                                           border: Border.all(
                                             color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.5), 
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
                                        
                         child: Text(
                                              ' Loading',
                                              style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(fontSize: 15,
                                             fontWeight: FontWeight.w900,
                                             color: Color.fromARGB(255, 246, 246, 247))
                                           ),
                                        ),),
                         child: MouseRegion(
                                              cursor: SystemMouseCursors.click, 
                           child: Container( 
                           margin: EdgeInsets.all(20),
                           alignment: Alignment.center,
                                                width: 350,
                                                height: 100,
                                          
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 51, 50, 50),
                                             borderRadius: BorderRadius.circular(10), 
                                             border: Border.all(
                                               color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(0.5), 
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
                                          
                           child: Text(
                                                '${Components[i]}',
                                                style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(fontSize: 15,
                                               fontWeight: FontWeight.w900,
                                               color: Color.fromARGB(255, 246, 246, 247))
                                             ),
                                          ),),
                         ),
                       ),
                      ],),
               ),
             ),
           ],
         )
     
        
    );
  }
}