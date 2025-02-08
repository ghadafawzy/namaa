import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تفاصيل التقييم')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مقترحات لتحسين تطور طفلك:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('1. قم بتحفيز طفلك على التفاعل الاجتماعي عبر الألعاب التفاعلية.'),
            Text('2. ساعده على تحسين مهاراته اللغوية من خلال قراءة القصص يوميًا.'),
            Text('3. شجع طفلك على أداء المهام اليومية بنفسه، مثل ارتداء الملابس.'),
            Text('4. استشر مختصًا إذا لاحظت تأخرًا واضحًا في بعض المهارات.'),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text('العودة إلى الرئيسية'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
