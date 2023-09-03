import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tt_em/presentation/constants/colors.dart';

class AppForm<T> extends StatefulWidget {
  AppForm({super.key,
    this.validator,
    TextEditingController? controller,
    required this.formKey,
    required this.keyboardType,
    required this.onFormChange,
    required this.label, this.inputFormatters, this.forceValidate = false}) :
        controller = controller ?? TextEditingController();
  final TextEditingController? controller;
  final FormFieldValidator<T>? validator;
  final TextInputType keyboardType;
  final ValueChanged<T> onFormChange;
  final GlobalKey<FormState> formKey;
  final String label;
  final bool forceValidate;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<AppForm> createState() => _AppFormState();

}

class _AppFormState extends State<AppForm> {
  bool _validate = true;

  @override
  Widget build(BuildContext context) {
    if (widget.forceValidate) {
      try {
        if (widget.formKey.currentState!.validate()) {
          _validate = true;
        } else {
          _validate = false;
        }
      } catch (_) {
        print("very bad error");//если ты тут то где то облажался с ключами
      }
    }
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Focus(
            onFocusChange: (value) {
              if (!value) {
                setState(() {
                  if (widget.formKey.currentState!.validate()) {
                    _validate = true;
                  } else {
                    _validate = false;
                  }
                });
              }
            },
            child: TextFormField(
              validator: widget.validator,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(),
              controller: widget.controller,
              decoration: InputDecoration(
                isDense: true,
                labelStyle: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.textGrayColor),
                label: Text(
                  widget.label,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.textGrayColor, height: 1),
                ),
                border: const UnderlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                    width: 0,
                  ),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                    width: 0,
                  ),
                ),
                focusedErrorBorder: const UnderlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                    width: 0,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                filled: true,
                fillColor: _validate
                    ? AppColors.backgroundColor
                    : Theme
                    .of(context)
                    .colorScheme
                    .error
                    .withOpacity(0.15),
                hintStyle: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.textGrayColor),
              ),
              keyboardType: widget.keyboardType,
              onEditingComplete: () {
                setState(() {
                  if (widget.formKey.currentState!.validate()) {
                    _validate = true;
                  } else {
                    _validate = false;
                  }
                });
              },
              onFieldSubmitted: (e) {
                setState(() {
                  if (widget.formKey.currentState!.validate()) {
                    _validate = true;
                  } else {
                    _validate = false;
                  }
                });
              },
              onChanged: widget.onFormChange,
              inputFormatters: widget.inputFormatters,
            ),
          ),
        ],
      ),
    );
  }
}