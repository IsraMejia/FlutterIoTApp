import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_isra_app/features/alarm/presentation/providers/set_new_alarm.dart';

class NewAlarmButton extends ConsumerWidget {
  const NewAlarmButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(showAlarmDialogProvider.notifier).state = true;
      },
      child: const Icon(
        Icons.add_alarm_sharp,
        size: 38,
        color: Color.fromARGB(153, 86, 194, 127),
      ),
    );
  }
}
