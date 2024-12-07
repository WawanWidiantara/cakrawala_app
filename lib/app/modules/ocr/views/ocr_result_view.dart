import 'package:cakrawala_app/app/core/components/buttons.dart';
import 'package:cakrawala_app/app/core/components/forms.dart';
import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:cakrawala_app/app/core/constants/text_styles.dart';
import 'package:cakrawala_app/app/modules/ocr/controllers/ocr_result_controller.dart';
import 'package:cakrawala_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OcrResultView extends GetView<OcrResultController> {
  const OcrResultView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OcrResultController());
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      appBar: AppBar(
        title: const Text(
          'CAKRAWALA',
          style: TextStyle(
            color: AppColors.mainBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: AppColors.mainBackground),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/on-boarding-1.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  const SizedBox(height: 32),
                  FormWidget(
                      controller: controller.nikController,
                      label: 'NIK',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  FormWidget(
                      controller: controller.nameController,
                      label: 'Nama',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  FormWidget(
                      controller: controller.birthPlaceController,
                      label: 'Tempat Lahir',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  FormWidget(
                      controller: controller.dobController,
                      label: 'Tanggal Lahir',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      }),
                  FormWidget(
                      controller: controller.addressController,
                      label: 'Alamat',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      }),
                  // continue the form widget
                  const SizedBox(height: 16),
                  FormWidget(
                      controller: controller.rtrwController,
                      label: 'RT/RW',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your RT/RW';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  FormWidget(
                      controller: controller.villageController,
                      label: 'Village',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your village';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  FormWidget(
                      controller: controller.districtController,
                      label: 'District',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your district';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  FormWidget(
                      controller: controller.regencyController,
                      label: 'Regency',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your regency';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  FormWidget(
                      controller: controller.provinceController,
                      label: 'Province',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your province';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  FormWidget(
                      controller: controller.religionController,
                      label: 'Religion',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your religion';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  FormWidget(
                      controller: controller.maritalController,
                      label: 'Marital Status',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your marital status';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  FormWidget(
                      controller: controller.occupationController,
                      label: 'Occupation',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your occupation';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  FormWidget(
                      controller: controller.nationalityController,
                      label: 'Nationality',
                      isObsecured: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your nationality';
                        }
                        return null;
                      }),

                  const SizedBox(height: 32),
                  Button(
                    label: 'Save Data',
                    type: ButtonType.primary,
                    state: ButtonState.enabled,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColors.mainBackground,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Are you sure you want to save the data?',
                                  style: AppTypography.bodyMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                      child: Button(
                                        label: 'Save',
                                        type: ButtonType.primary,
                                        state: ButtonState.enabled,
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Get.offAllNamed(Routes.NAVBAR);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                        width:
                                            16), // Add spacing between the buttons
                                    Flexible(
                                      child: Button(
                                        label: 'Cancel',
                                        type: ButtonType.tertiary,
                                        state: ButtonState.enabled,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
