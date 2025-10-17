import 'package:flutter/material.dart';
import 'package:meditation/models/sleep_content_model.dart';
import 'package:meditation/providers/custom_data_provider.dart';
import 'package:meditation/utils/colors.dart';
import 'package:meditation/widgets/reusable/text_input.dart';
import 'package:provider/provider.dart';

class SleepContentForm extends StatefulWidget {
  const SleepContentForm({super.key});

  @override
  State<SleepContentForm> createState() => _SleepContentFormState();
}

class _SleepContentFormState extends State<SleepContentForm> {
  final _formKey = GlobalKey<FormState>();

  String _category = '';
  String _name = '';
  String _description = '';
  int _duration = 0;
  String _audioUrl = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create a new Sleep Content',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: 30),
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: 'Category',
                onSaved: (value) {
                  _category = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Name',
                onSaved: (value) {
                  _name = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Description',
                onSaved: (value) {
                  _description = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Duration',
                onSaved: (value) {
                  _duration = int.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a duration';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Audio Url',
                onSaved: (value) {
                  _audioUrl = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an audio url';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        AppColors.primaryGreen,
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        final sleepContent = SleepContent(
                          category: _category,
                          name: _name,
                          description: _description,
                          duration: _duration,
                          audioUrl: _audioUrl,
                        );

                        _formKey.currentState!.reset();
                        _category = "";
                        _name = "";
                        _description = "";
                        _duration = 0;
                        _audioUrl = "";

                        Provider.of<CustomDataProvider>(context, listen: false)
                            .addSleepContent(sleepContent, context);
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
