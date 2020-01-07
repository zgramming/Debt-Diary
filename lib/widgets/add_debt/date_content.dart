import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateContent extends StatefulWidget {
  final Function onPressed;
  DateContent({this.onPressed});
  @override
  _DateContentState createState() => _DateContentState();
}

class _DateContentState extends State<DateContent> {
  DateTime _selectedDate;

  String _thisYear;

  DateFormat _dateFormat = DateFormat();

  @override
  void initState() {
    _thisYear = _dateFormat.add_y().format(DateTime.now());
    super.initState();
  }

  void _pickedDate() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(int.tryParse(_thisYear)),
      lastDate: DateTime(2100),
    ).then((valueDate) {
      if (valueDate == null) {
        return;
      }
      _selectedDate = valueDate;
      widget.onPressed(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            (_selectedDate == null)
                ? "No Date Choosen"
                : (_selectedDate.isBefore(DateTime.now()))
                    ? "Invalid Date"
                    : "${DateFormat.yMd().format(_selectedDate)}",
            style: Theme.of(context).textTheme.title.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          OutlineButton(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            onPressed: _pickedDate,
            child: Text('Choose Date'),
            textTheme: ButtonTextTheme.primary,
          ),
        ],
      ),
    );
  }
}
