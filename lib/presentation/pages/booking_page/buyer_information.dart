part of 'booking_page.dart';

class _BuyerInformation extends StatelessWidget {
  _BuyerInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContentCard(
      roundedTopBorder: true,
      roundedBottomBorder: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(AppLocalizations.of(context)!.buyerInformationTitle,style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(
            height: 15,
          ),
          const _PhoneNumberForm(),
          const SizedBox(
            height: 15,
          ),
          const _EmailNumberForm(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

// bool phoneValidator(String phoneNumber){
//   if(phoneNumber.le)
// }

class _PhoneNumberForm extends StatefulWidget {
  const _PhoneNumberForm({super.key});

  @override
  State<_PhoneNumberForm> createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<_PhoneNumberForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //PhoneCountryData? _countryData;
  final TextEditingController _phoneController = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (s) {
              if (s == null) return null;
              if (s.length == 0) return "Введите номер телефона";
              bool isValid = isPhoneValid(s);
              if (!isValid) {
                return "Некорректный номер";
              }
            },
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
            controller: _phoneController,
            decoration: InputDecoration(
              // alignLabelWithHint: true,
              // contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
              // //isDense: true,
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.textGrayColor),
              label: Text(
                AppLocalizations.of(context)!.phoneBookingInformation,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.textGrayColor, height: 1),
              ),
              //hintText: 'Type a phone number',
              //helperText: 'Helper Text',
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
              errorBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error, width: 2.0),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error, width: 2.0),
              ),

              floatingLabelBehavior: FloatingLabelBehavior.auto,
              filled: true,
              fillColor: AppColors.backgroundColor,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.textGrayColor),
              errorStyle: const TextStyle(
                color: Colors.red,
              ),
            ),
            onEditingComplete: () {
              setState(() {
                if (_formKey.currentState!.validate()) {
                  _validate = true;
                } else {
                  _validate = false;
                }
              });
            },
            onFieldSubmitted: (e) {
              setState(() {
                if (_formKey.currentState!.validate()) {
                  _validate = true;
                } else {
                  _validate = false;
                }
              });
            },
            keyboardType: TextInputType.phone,
            inputFormatters: [
              PhoneInputFormatter(
                allowEndlessPhone: false,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _EmailNumberForm extends StatefulWidget {
  const _EmailNumberForm({super.key});

  @override
  State<_EmailNumberForm> createState() => _EmailNumberFormState();
}

class _EmailNumberFormState extends State<_EmailNumberForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //PhoneCountryData? _countryData;
  final TextEditingController _emailController = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (email) {
              if (email == null) {
                return null;
              }
              if (email == '') {
                return "Введите email";
              }
              bool isValid = EmailValidator.validate(email);
              if (isValid == false) {
                return 'Некорректный email';
              }
            },
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
            controller: _emailController,
            decoration: InputDecoration(
              //errorText: _validate ? 'Value Can\'t Be Empty' : null,
              // alignLabelWithHint: true,
              // contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
              isDense: true,
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.textGrayColor),
              label: Text(
                AppLocalizations.of(context)!.emailBookingInformation,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.textGrayColor, height: 1),
              ),
              //hintText: 'Type a phone number',
              //helperText: 'Helper Text',
              // border: const UnderlineInputBorder(
              //   borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(10),
              //       topRight: Radius.circular(10),
              //       bottomLeft: Radius.circular(10),
              //       bottomRight: Radius.circular(10)),
              // ),

              // errorBorder:UnderlineInputBorder(
              //   borderRadius: const BorderRadius.only(
              //       topLeft: Radius.circular(10),
              //       topRight: Radius.circular(10),
              //       bottomLeft: Radius.circular(10),
              //       bottomRight: Radius.circular(10)),
              //   borderSide: BorderSide(
              //     width: 20,//_validate?0:4,
              //     color:Colors.green,
              //     //style: BorderStyle.none,
              //   ),
              // ),
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
              errorBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error, width: 2.0),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error, width: 2.0),
              ),

              floatingLabelBehavior: FloatingLabelBehavior.auto,
              filled: true,
              fillColor: AppColors.backgroundColor,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.textGrayColor),
            ),
            keyboardType: TextInputType.emailAddress,
            onEditingComplete: () {
              setState(() {
                if (_formKey.currentState!.validate()) {
                  _validate = true;
                } else {
                  _validate = false;
                }
              });
            },
            onFieldSubmitted: (e) {
              setState(() {
                if (_formKey.currentState!.validate()) {
                  _validate = true;
                } else {
                  _validate = false;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
