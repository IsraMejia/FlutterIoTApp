import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_isra_app/features/alarm/presentation/widgets/alarm_card.dart';
import 'package:iot_isra_app/features/alarm/presentation/widgets/start_sleep_button.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
             
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Alarmas',
                  style: GoogleFonts.roboto(
                    color: const Color.fromARGB(179, 248, 250, 245),
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
 
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    AlarmCard(timeLabel: '6:10 am', initialState: false),
                    AlarmCard(timeLabel: '6:11 am', initialState: false),
                    AlarmCard(timeLabel: '6:13 am', initialState: false),
                    AlarmCard(timeLabel: '6:16 am', initialState: false),
                    AlarmCard(timeLabel: '6:20 am', initialState: false),
                    AlarmCard(timeLabel: '6:21 am', initialState: false),
                    AlarmCard(timeLabel: '6:10 am', initialState: false),
                    AlarmCard(timeLabel: '6:21 am', initialState: false),
                  ],
                ),
              ),
            ),

             
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: StartSleepButton(),
            ),
          ],
        ),
      ),
    );
  }
}
