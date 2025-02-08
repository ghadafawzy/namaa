import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // فتح القائمة الجانبية أو الإعدادات
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'بعد الإنتهاء من الإختبارات التالية سيتم تحديد العمر التطوري للطفل',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.purple,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            /// GridView لعرض الفئات المختلفة
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      // تنفيذ إجراء معين عند الضغط على العنصر
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: category['color'],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(category['image'], height: 80),
                          SizedBox(height: 10),
                          Text(
                            category['title'],
                            style: TextStyle(
                              color: Colors.indigo[900],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            /// زر بدء الاختبار
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/form'); // الانتقال إلى صفحة الاختبار
              },
              child: Text(
                'بدء الإختبار',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// قائمة الفئات بالصور والألوان
final List<Map<String, dynamic>> categories = [
  {'title': 'النمو الحركي', 'image': 'assets/movement.png', 'color': Color(0xFFE7F0F9)},
  {'title': 'النمو المعرفي', 'image': 'assets/cognitive.png', 'color':Color(0xFFF3E7FE)},
  {'title': 'النمو اللغوي', 'image': 'assets/language.png', 'color':Color(0xFFFCE5E7)},
  {'title': 'النمو الاجتماعي', 'image': 'assets/social.png', 'color':Color(0xFFF9F6D3)},
  {'title': 'رعاية الذات', 'image': 'assets/self-care.png', 'color':Color(0xFFEDFFE7)},
];
