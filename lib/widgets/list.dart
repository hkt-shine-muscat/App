import 'package:flutter/material.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Row(
          children: [
            SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.67),
                color: Color(0xff3f8dff),
              ),
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(
                    '학습된 인공지능이 당신과 소통하며\n친근하게 답해줍니다.\n음성을 인식하여 대화할 수 있습니다.',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 27),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.67),
                color: Color(0xff566a86),
              ),
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(
                    "나린은 원합니다.",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '외로운 사람들이 모두 웃을 수 있기를 원합니다.\n여러분의 말동무가 되겠습니다.',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        SizedBox(height: 27),
        Row(
          children: [
            SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.67),
                color: Color(0xff59a4a8),
              ),
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(
                    '학습된 인공지능이 당신과 소통하며\n친근하게 답해줍니다.\n음성을 인식하여 대화할 수 있습니다.',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
