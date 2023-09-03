part of 'booking_page.dart';

class _TouristInformationCard extends StatefulWidget {
  const _TouristInformationCard(
      {required this.touristIndex, this.tourist});

  final int touristIndex;
  final Tourist? tourist;

  @override
  State<_TouristInformationCard> createState() =>
      _TouristInformationCardState();
}

class _TouristInformationCardState extends State<_TouristInformationCard> {
  bool _isOpen = false;
  final GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> sonameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> birthdayFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> citizenshipFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passportNumberFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passportDateFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController sonameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController citizenshipController = TextEditingController();
  final TextEditingController passportNumberController = TextEditingController();
  final TextEditingController passportDateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _isOpen = true;
  }

  @override
  Widget build(BuildContext context) {
    return AppContentCard(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                getTouristTitleLocalization(widget.touristIndex + 1, context),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              Builder(builder: (context) {
                if (widget.touristIndex > 0 && widget.tourist != null) {
                  return _DeleteButton(onPressed: () {
                    context
                        .read<BookingBloc>()
                        .add(BookingDeleteTouristEvent(widget.touristIndex));
                  });
                }
                return SizedBox.shrink();
              }),
              Builder(builder: (context) {
                if (widget.tourist == null) {
                  return _AddButton(onPressed: () {
                    context.read<BookingBloc>().add(BookingAddTouristEvent());
                    setState(() {
                      _isOpen = !_isOpen;
                    });
                  });
                } else {
                  return _ExpandedButton(
                    onPressed: () {
                      setState(() {
                        _isOpen = !_isOpen;
                      });
                    },
                  );
                }
              })
            ],
          ),
          if (widget.tourist != null)
            ExpandedSection(
              expand: _isOpen,
              child: BlocBuilder<BookingBloc, BookingState>(
                builder: (context, state) {
                  return Column(
                    key: ValueKey<Tourist?>(widget.tourist),
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      AppForm(
                        controller: nameController,
                        forceValidate: state.shouldHighlightEmptyFields,
                        formKey: nameFormKey,
                        keyboardType: TextInputType.text,
                        onFormChange: <String>(string){
                          context.read<BookingBloc>().add(BookingFormChangeEvent(formValue: string, formType: FormType.name,touristIndex: widget.touristIndex));
                        },
                        label: AppLocalizations.of(context)!.touristNameLabel,
                        validator: <String>(string) {
                          if (string == null || string.length >= 1) return null;
                          if (string.length == 0) return AppLocalizations.of(context)!.touristNameError;
                          bool isValid = isPhoneValid(string);
                          if (!isValid) {
                            return AppLocalizations.of(context)!.touristNameError;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AppForm(
                        controller: sonameController,
                        forceValidate: state.shouldHighlightEmptyFields,
                        formKey: sonameFormKey,
                        keyboardType: TextInputType.text,
                        onFormChange: <String>(string){
                          context.read<BookingBloc>().add(BookingFormChangeEvent(formValue: string, formType: FormType.soname,touristIndex: widget.touristIndex));
                        },
                        label: AppLocalizations.of(context)!.touristSonameLabel,
                        validator: <String>(string) {
                          if (string == null || string.length >= 1) return null;
                          if (string.length == 0) return AppLocalizations.of(context)!.touristSonameError;
                          bool isValid = isPhoneValid(string);
                          if (!isValid) {
                            return AppLocalizations.of(context)!.touristSonameError;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AppForm(
                        controller: birthdayController,
                        forceValidate: state.shouldHighlightEmptyFields,
                        formKey: birthdayFormKey,
                        keyboardType: TextInputType.datetime,
                        onFormChange:<String>(string){
                          context.read<BookingBloc>().add(BookingFormChangeEvent(formValue: string, formType: FormType.birthday,touristIndex: widget.touristIndex));
                        },
                        label: AppLocalizations.of(context)!.touristBirthdayLabel,
                        validator: <String>(string) {
                          print(string.length);
                          if (string == null || string.length == 10) {
                            return null;
                          }
                          if (string.length == 0) return AppLocalizations.of(context)!.touristBirthdayError;
                          bool isValid = isPhoneValid(string);
                          if (!isValid) {
                            return AppLocalizations.of(context)!.touristBirthdayError;
                          }
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          DateFormatter()
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AppForm(
                        controller: citizenshipController,
                        forceValidate: state.shouldHighlightEmptyFields,
                        formKey: citizenshipFormKey,
                        keyboardType: TextInputType.text,
                        onFormChange:<String>(string){
                          context.read<BookingBloc>().add(BookingFormChangeEvent(formValue: string, formType: FormType.citizenship,touristIndex: widget.touristIndex));
                        },
                        label:  AppLocalizations.of(context)!.touristCitizenshipLabel,
                        validator: <String>(string) {
                          if (string == null || string.length >= 2) return null;
                          if (string.length == 0) return AppLocalizations.of(context)!.touristCitizenshipError;
                          // todo no need bc its demo)))
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AppForm(
                        controller: passportNumberController,
                        forceValidate: state.shouldHighlightEmptyFields,
                        formKey: passportNumberFormKey,
                        keyboardType: TextInputType.number,
                        onFormChange: <String>(string){
                          context.read<BookingBloc>().add(BookingFormChangeEvent(formValue: string, formType: FormType.passportNumber,touristIndex: widget.touristIndex));
                        },
                        label: AppLocalizations.of(context)!.touristPassportNumberLabel,
                        validator: <String>(string) {
                          if (string == null || string.length >5) return null;
                          if (string.length == 0) return AppLocalizations.of(context)!.touristPassportNumberError;
                          // todo no need bc its demo)))
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AppForm(
                        controller:passportDateController,
                        forceValidate: state.shouldHighlightEmptyFields,
                        formKey:passportDateFormKey,
                        keyboardType: TextInputType.datetime,
                        onFormChange: <String>(string){
                          context.read<BookingBloc>().add(BookingFormChangeEvent(formValue: string, formType: FormType.passportDate,touristIndex: widget.touristIndex));
                        },
                        label: AppLocalizations.of(context)!.touristPassportDateLabel,
                        validator: <String>(string) {
                          print(string.length);
                          if (string == null || string.length == 10) {
                            return null;
                          }
                          if (string.length == 0) return AppLocalizations.of(context)!.touristPassportDateError;
                          bool isValid = isPhoneValid(string);
                          if (!isValid) {
                            AppLocalizations.of(context)!.touristPassportDateError;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  );
                },
              ),
            ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class _TouristsList extends StatelessWidget {
  const _TouristsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.touristsList.length + 1,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            if (index == state.touristsList.length) {
              return _TouristInformationCard(
                  touristIndex: index); //this card with add button;
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: _TouristInformationCard(
                touristIndex: index,
                tourist: state.touristsList[index],
              ),
            );
          },
        );
      },
    );
  }
}

///
///
/// Buttons
class _ExpandedButton extends StatefulWidget {
  const _ExpandedButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<_ExpandedButton> createState() => _ExpandedButtonState();
}

class _ExpandedButtonState extends State<_ExpandedButton> {
  bool isDown = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.blue.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6), // <-- Radius
              ),
            ),
            onPressed: () {
              setState(() {
                isDown = !isDown;
                widget.onPressed();
              });
            },
            icon: RotatedBox(
                quarterTurns: isDown ? 1 : -1,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ))));
  }
}

class _AddButton extends StatefulWidget {
  const _AddButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<_AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<_AddButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6), // <-- Radius
              ),
            ),
            onPressed: () {
              setState(() {
                widget.onPressed();
              });
            },
            icon: const Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            )));
  }
}

class _DeleteButton extends StatefulWidget {
  const _DeleteButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<_DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<_DeleteButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor:
                  Theme.of(context).colorScheme.error.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6), // <-- Radius
              ),
            ),
            onPressed: () {
              setState(() {
                widget.onPressed();
              });
            },
            icon: Icon(
              Icons.close,
              size: 20,
              color: Theme.of(context).colorScheme.error,
            )));
  }
}
