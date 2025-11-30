// ignore_for_file: use_key_in_widget_constructors, implementation_imports, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sized_box_for_whit, avoid_print, sort_child_properties_last, avoid_unnecessary_containers, deprecated_member_use, sized_box_for_whitespace, unnecessary_null_comparison, no_leading_underscores_for_local_identifiers, import_of_legacy_library_into_null_safe, unnecessary_new, use_build_context_synchronously

import 'package:company_tasks_organizer/shared/components/components.dart';
import 'package:company_tasks_organizer/shared/cubit/states.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../../../shared/cubit/cubit.dart';

class AnnounceScreen extends StatefulWidget {
  @override
  State<AnnounceScreen> createState() => _AnnounceScreenState();
}

class _AnnounceScreenState extends State<AnnounceScreen> {
  get imageName => null;

  @override
  Widget build(BuildContext context) {
    var context1 = context;
    var cubit = AppCubit.get(context);
    var formKey = GlobalKey<FormState>();
    var dateController = cubit.dateController1 = TextEditingController();
    var employeeName = TextEditingController();
    var clientName = TextEditingController();
    var clientPhone = TextEditingController();
    var clientAddress = TextEditingController();
    var detailsController = TextEditingController();
    var imageController = TextEditingController();
    var imageUrlController = TextEditingController();

    String? imageUrl = imageUrlController.text;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        bool? isLoading = false;

        return Scaffold(
          appBar: AppBar(
            title: Text('announceAMission'.tr()),
          ),
          body: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 15.0),
                      Container(
                        width: 250.0,
                        child: DropdownButton(
                          items: cubit.dropMenuItems,
                          borderRadius: BorderRadius.circular(15.0),
                          hint: Text(
                            'missionType'.tr(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          value: cubit.newValue,
                          isExpanded: true,
                          onChanged: (String? value) {
                            cubit.dropValue(value);
                          },
                        ),
                      ),
                      SizedBox(height: 15.0),
                      defaultTextFormField(
                        controller: dateController,
                        labelText: 'taskDate'.tr(),
                        prefixIcon: Icons.calendar_today,
                        type: TextInputType.datetime,
                        color: cubit.isDark ? Colors.white : Colors.grey,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        onFiledSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            print('Date = \${dateController.text}');
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'pleaseEnterDate'.tr();
                          } else {
                            return null;
                          }
                        },
                        onTap: () {
                          cubit.pickedDate(context1);
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      SizedBox(height: 15.0),
                      defaultTextFormField(
                        controller: employeeName,
                        labelText: 'employeeName'.tr(),
                        prefixIcon: Icons.text_fields,
                        type: TextInputType.text,
                        color: cubit.isDark ? Colors.white : Colors.grey,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        onFiledSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            print('Employee Name = \${employeeName.text}');
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'pleaseEnterYourName'.tr();
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 15.0),
                      defaultTextFormField(
                        controller: clientName,
                        labelText: 'clientName'.tr(),
                        prefixIcon: Icons.text_fields,
                        suffixIcon: Icons.contacts,
                        suffixOnPressed: () async {
                          AppCubit.get(context).addContact(clientName, clientPhone);
                        },
                        type: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 2,
                        color: cubit.isDark ? Colors.white : Colors.grey,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        onFiledSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            print('Client Name = \${clientName.text}');
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'pleaseEnterClientName'.tr();
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 15.0),
                      defaultTextFormField(
                        controller: clientPhone,
                        labelText: 'clientPhone'.tr(),
                        prefixIcon: Icons.phone,
                        minLines: 1,
                        maxLines: 3,
                        type: TextInputType.multiline,
                        color: cubit.isDark ? Colors.white : Colors.grey,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        onFiledSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            print('Client Phone = \${clientPhone.text}');
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'pleaseEnterClientPhone'.tr();
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 15.0),
                      defaultTextFormField(
                        minLines: 1,
                        maxLines: 5,
                        controller: clientAddress,
                        labelText: 'clientAddress'.tr(),
                        prefixIcon: Icons.location_on,
                        type: TextInputType.multiline,
                        color: cubit.isDark ? Colors.white : Colors.grey,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        onFiledSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            print('Client Address = \${clientAddress.text}');
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'pleaseEnterClientAddress'.tr();
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 15.0),
                      defaultTextFormField(
                        minLines: 1,
                        maxLines: 15,
                        controller: detailsController,
                        labelText: 'details'.tr(),
                        prefixIcon: Icons.details,
                        type: TextInputType.multiline,
                        color: cubit.isDark ? Colors.white : Colors.grey,
                      ),
                      SizedBox(height: 15.0),
                      defaultTextFormField(
                        controller: imageController,
                        type: TextInputType.multiline,
                        prefixIcon: Icons.select_all,
                        labelText: 'selectimage'.tr(),
                        color: cubit.isDark ? Colors.white : Colors.grey,
                        suffixIcon: Icons.image_outlined,
                        suffixOnPressed: () {
                          cubit.pickImage(imageController: imageController);
                        },
                      ),
                      SizedBox(height: 70.0),
                      SizedBox(height: 15.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (imageController.text.isNotEmpty) {
                UploadTask? _uploadTask;

                showDialog(
                  context: context,
                  builder: (context) => Center(child: CircularProgressIndicator()),
                );

                final path = 'tasks/\${imageController.text}';
                final file = cubit.image;
                final ref = FirebaseStorage.instance.ref().child(path);
                ref.putFile(file);
                _uploadTask = ref.putFile(file);
                final snapshot = await _uploadTask.whenComplete(() {});
                var urlDownload = await snapshot.ref.getDownloadURL();
                imageUrlController.text = urlDownload;
                print(urlDownload);

                if (formKey.currentState!.validate()) {
                  cubit.addTask(
                    dateController,
                    employeeName,
                    clientName,
                    clientPhone,
                    clientAddress,
                    detailsController,
                    imageUrl: urlDownload,
                    imageName: imageController.text,
                    context,
                  );

                  imageController.clear();
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              } else {
                if (formKey.currentState!.validate()) {
                  cubit.addTask(
                    dateController,
                    employeeName,
                    clientName,
                    clientPhone,
                    clientAddress,
                    detailsController,
                    imageUrl: "",
                    imageName: "",
                    context,
                  );
                  setState(() {});
                  Navigator.pop(context);
                }
              }
            },
            child: Text('submit'.tr()),
          ),
        );
      },
    );
  }
}
