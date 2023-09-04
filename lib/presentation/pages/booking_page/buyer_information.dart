part of 'booking_page.dart';

class _BuyerInformation extends StatelessWidget {
  const _BuyerInformation();

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
          Text(
            AppLocalizations.of(context)!.buyerInformationTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 15,
          ),
          _PhoneNumberForm(),
          const SizedBox(
            height: 15,
          ),
          _EmailForm(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class _PhoneNumberForm extends StatelessWidget {
  _PhoneNumberForm();

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PhoneInputFormatter phoneInputFormatter = PhoneInputFormatter();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        return AppForm(
          forceValidate: state.shouldHighlightEmptyFields,
          formKey: formKey,
          controller: controller,
          keyboardType: TextInputType.number,
          onFormWasInvalid: <String>(string){
            context.read<BookingBloc>().add(const BookingFormChangeEvent(formValue: '', formType: FormType.phoneNumber));
          },
          onFormWasValid: <String>(string){
            context.read<BookingBloc>().add(BookingFormChangeEvent(formValue: string, formType: FormType.phoneNumber));
          },
          label: AppLocalizations.of(context)!.phoneBookingInformation,
          validator: <String>(phoneNumber) {
            if (phoneNumber == null) return null;
            if (phoneNumber.length == 0) return "Введите номер телефона";
            bool isValid = isPhoneValid(phoneNumber);
            if (!isValid) {
              return "Некорректный номер";
            }
          },
          inputFormatters: [
            phoneInputFormatter
          ],
        );
      },
    );
  }
}

class _EmailForm extends StatelessWidget {
  _EmailForm();

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        return AppForm(
          controller: controller,
          forceValidate: state.shouldHighlightEmptyFields,
          formKey: formKey,
          keyboardType: TextInputType.emailAddress,
          validator: <String>(email) {
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
          onFormWasValid: <String>(string){
            context.read<BookingBloc>().add(BookingFormChangeEvent(formValue: string, formType: FormType.mail));
          },
          onFormWasInvalid: <String>(string){
            context.read<BookingBloc>().add(const BookingFormChangeEvent(formValue: '', formType: FormType.mail));
          },
          label: AppLocalizations.of(context)!.emailBookingInformation,);
      }
    );
  }
}
