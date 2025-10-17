import 'package:flutter/material.dart';
import 'package:meditation/models/meditation_model.dart';
import 'package:meditation/providers/custom_data_provider.dart';
import 'package:meditation/utils/colors.dart';
import 'package:meditation/widgets/reusable/text_input.dart';
import 'package:provider/provider.dart';

class MeditationForm extends StatefulWidget {
  const MeditationForm({super.key});

  @override
  State<MeditationForm> createState() => _MeditationFormState();
}

class _MeditationFormState extends State<MeditationForm> {
  final _formKey = GlobalKey<FormState>();

  String _category = '';
  String _name = '';
  String _description = '';
  int _duration = 0;
  String _audioUrl = '';
  String _videoUrl = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      //form
      children: [
        Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create a new meditation',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryGreen,
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  labelText: 'Category',
                  hintText: 'Category',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a category';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _category = value!;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'Description',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'Duration',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a duration';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _duration = int.parse(value!);
                  },
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'Audio Url',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an audio url';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _audioUrl = value!;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'Video Url',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a video url';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _videoUrl = value!;
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
                          //create a new meditation
                          final meditation = MeditationContent(
                            category: _category,
                            name: _name,
                            description: _description,
                            duration: _duration,
                            audioUrl: _audioUrl,
                            videoUrl: _videoUrl,
                          );

                          //clear the fields
                          _formKey.currentState!.reset();
                          _category = "";
                          _name = "";
                          _description = "";
                          _duration = 0;
                          _audioUrl = "";
                          _videoUrl = "";

                          //add the meditation
                          Provider.of<CustomDataProvider>(context,
                                  listen: false)
                              .addMeditation(meditation, context);
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
        )
      ],
    );
  }
}
