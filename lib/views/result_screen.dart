import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double yesPercentage = ModalRoute.of(context)!.settings.arguments as double;

    return Scaffold(
      appBar: AppBar(title: Text('النتيجة')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'نسبة التوافق مع عمر الطفل: ${yesPercentage.toStringAsFixed(1)}%',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            yesPercentage >= 70
                ? Text('تطور طفلك يتوافق مع عمره الطبيعي', style: TextStyle(fontSize: 18, color: Colors.green))
                : Column(
              children: [
                Text('تطور طفلك لا يتوافق مع عمره الطبيعي', style: TextStyle(fontSize: 18, color: Colors.red)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/details');
                  },
                  child: Text('عرض التفاصيل'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('العودة إلى الرئيسية'),
            ),
          ],
        ),
      ),
    );
  }
}
