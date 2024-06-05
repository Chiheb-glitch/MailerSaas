import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class CustomStepperWidget extends StatefulWidget {
  final int activeStep;
  final Function(int) onStepReached;

  const CustomStepperWidget({
    required this.activeStep,
    required this.onStepReached,
  }) ;

  @override
  _CustomStepperWidgetState createState() => _CustomStepperWidgetState();
}

class _CustomStepperWidgetState extends State<CustomStepperWidget> {
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: widget.activeStep,
      activeStepTextColor: Color.fromARGB(221, 0, 0, 0),
      finishedStepTextColor: Color.fromARGB(221, 9, 255, 0),
      finishedStepBorderColor: Color.fromARGB(221, 9, 255, 0),
      internalPadding: 50,
      showLoadingAnimation: false,
      stepRadius: 10,
      showStepBorder: true,
      steps: [
        EasyStep(
          enabled: false,
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            child: CircleAvatar(
              radius: 7,
              backgroundColor: widget.activeStep >= 0
                  ? const Color.fromARGB(255, 57, 175, 255)
                  : Colors.white,
            ),
          ),
          title: 'Create Email',
        ),

        EasyStep(
          enabled: false,
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            child: CircleAvatar(
              radius: 7,
              backgroundColor: widget.activeStep >= 0
                  ? const Color.fromARGB(255, 57, 175, 255)
                  : Colors.white,
            ),
          ),
          title: 'Config Email',
        ),


           EasyStep(
          enabled: false,
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            child: CircleAvatar(
              radius: 7,
              backgroundColor: widget.activeStep >= 0
                  ? const Color.fromARGB(255, 57, 175, 255)
                  : Colors.white,
            ),
          ),
          title: 'send',
        ),

          EasyStep(
          enabled: false,
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            child: CircleAvatar(
              radius: 7,
              backgroundColor: widget.activeStep >= 0
                  ? const Color.fromARGB(255, 57, 175, 255)
                  : Colors.white,
            ),
          ),
          title: 'inspect result',
        ),
      ],
      onStepReached: widget.onStepReached,
    );
  }
}
