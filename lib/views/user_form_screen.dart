import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui'as ui;

class UserFormPage extends StatefulWidget {
  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  DateTime? _selectedDate;  // تخزين تاريخ الميلاد
  int? _childAgeInMonths;   // حساب عمر الطفل بالأشهر

  /// فتح Date Picker لاختيار تاريخ الميلاد
  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2017),  // الحد الأدنى للعمر: 6 سنوات
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _calculateAge();  // حساب عمر الطفل بعد اختيار التاريخ
      });
    }
  }

  /// حساب عمر الطفل بالأشهر
  void _calculateAge() {
    if (_selectedDate != null) {
      DateTime today = DateTime.now();
      int years = today.year - _selectedDate!.year;
      int months = today.month - _selectedDate!.month;

      if (today.day < _selectedDate!.day) {
        months--; // تصحيح الحساب في حالة لم يكتمل الشهر
      }

      int totalMonths = (years * 12) + months;
      setState(() {
        _childAgeInMonths = totalMonths;
      });
    }
  }

  /// الانتقال إلى الاختبار بعد إدخال البيانات
  void _startTest() {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      Navigator.pushNamed(
        context,
        '/test',
        arguments: {'name': _nameController.text, 'ageInMonths': _childAgeInMonths},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('تسجيل جديد'),
        centerTitle: true,),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/splash-photo.jpg"),
                Directionality(
                  textDirection: ui.TextDirection.rtl,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'اسم الطفل',
                    alignLabelWithHint: true,),
                    textAlign: TextAlign.right,
                    validator: (value) => value!.isEmpty ? 'يرجى إدخال اسم الطفل' : null,
                  ),
                ),
                SizedBox(height: 16),
                Directionality(
                  textDirection: ui.TextDirection.rtl,
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: 'رقم الهاتف',
                      alignLabelWithHint: true,),
                    textAlign: TextAlign.right,
                    validator: (value) => value!.isEmpty ? 'يرجى إدخال رقم الهاتف' : null,
                  ),
                ),
                SizedBox(height: 16),

                /// حقل اختيار تاريخ الميلاد
                GestureDetector(
                  onTap: _pickDate,
                  child: AbsorbPointer(
                    child: Directionality(
                      textDirection: ui.TextDirection.rtl,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'تاريخ ميلاد الطفل',
                          alignLabelWithHint: true,
                          hintText: _selectedDate == null
                              ? 'اضغط لاختيار التاريخ'
                              : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                        ),
                        textAlign: TextAlign.right,
                        validator: (value) =>
                        _selectedDate == null ? 'يرجى اختيار تاريخ الميلاد' : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                /// عرض عمر الطفل بالأشهر بعد اختيار التاريخ
                if (_childAgeInMonths != null)
                  Text('عمر الطفل: $_childAgeInMonths شهرًا', style: TextStyle(fontSize: 16)),

                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: _startTest,
                    child: Text(
            'بدء الإختبار',
            style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
