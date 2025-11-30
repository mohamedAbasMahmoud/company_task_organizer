// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use

import 'package:company_tasks_organizer/modules/Admin_Screens/tools_screen/Employees/Employee_Data.dart';
import 'package:company_tasks_organizer/modules/Admin_Screens/tools_screen/Employees/Employees.dart';
import 'package:company_tasks_organizer/modules/Admin_Screens/tools_screen/Employees_Attebding/employee_attending.dart';
import 'package:company_tasks_organizer/modules/Admin_Screens/tools_screen/My_Attendance/my_attendance.dart';
import 'package:company_tasks_organizer/shared/components/inkwell_component.dart';
import 'package:company_tasks_organizer/shared/cubit/cubit.dart';
import 'package:company_tasks_organizer/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:translator/translator.dart'; // ✅ مكتبة الترجمة
import 'personal_attending/personal_attending.dart';

class ToolsScreen extends StatelessWidget {
  final translator = GoogleTranslator(); // ✅ إنشاء كائن الترجمة

  Future<String> _translate(String key) async {
    final result = await translator.translate(key, to: 'ar'); // أو 'en' حسب اللغة المطلوبة
    return result.text;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<String>(
                    future: _translate('personalAttending'),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      return InkWellComponent(
                        onTap: () {
                          Navigator.pushNamed(context, PersonalAttendanceScreen.id);
                        },
                        icon: Iconsax.clock,
                        iconSize: 50,
                        text: snapshot.data!,
                        color: AppCubit.get(context).isDark ? Colors.white : Colors.black,
                      );
                    },
                  ),
                  SizedBox(height: 30.0),
                  FutureBuilder<String>(
                    future: AppLoginCubit.get(context).permission == 'Admin'
                        ? _translate('employeesAttending')
                        : _translate('myAttendance'),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      return InkWellComponent(
                        onTap: () {
                          AppLoginCubit.get(context).permission == 'Admin'
                              ? Navigator.pushNamed(context, EmployeesAttending.id)
                              : Navigator.pushNamed(
                                  context,
                                  MyAttendance.id,
                                  arguments: AppLoginCubit.get(context).name,
                                );
                        },
                        icon: Iconsax.grid_1,
                        iconSize: 50,
                        text: snapshot.data!,
                        color: AppCubit.get(context).isDark ? Colors.white : Colors.black,
                      );
                    },
                  ),
                  SizedBox(height: 30.0),
                  if (AppLoginCubit.get(context).permission == 'Admin')
                    FutureBuilder<String>(
                      future: _translate('myAttendance'),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return CircularProgressIndicator();
                        return InkWellComponent(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MyAttendance.id,
                              arguments: AppLoginCubit.get(context).name,
                            );
                          },
                          icon: Iconsax.grid_1,
                          iconSize: 50,
                          text: snapshot.data!,
                          color: AppCubit.get(context).isDark ? Colors.white : Colors.black,
                        );
                      },
                    ),
                  SizedBox(height: 30.0),
                  FutureBuilder<String>(
                    future: AppLoginCubit.get(context).permission == 'Admin'
                        ? _translate('employees')
                        : _translate('yourData'),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      return InkWellComponent(
                        onTap: () {
                          AppLoginCubit.get(context).permission == 'Admin'
                              ? Navigator.pushNamed(context, EmployeesScreen.id)
                              : Navigator.pushNamed(context, EmployeeData.id);
                        },
                        icon: AppLoginCubit.get(context).permission == 'Admin'
                            ? Iconsax.people
                            : Iconsax.chart_square,
                        iconSize: 50,
                        text: snapshot.data!,
                        color: AppCubit.get(context).isDark ? Colors.white : Colors.black,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
