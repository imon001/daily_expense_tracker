import 'package:flutter/material.dart';

import '../../model/expense_model.dart';

class NewExpenseItems extends StatelessWidget {
  const NewExpenseItems({
    super.key,
    required this.enteredTitle,
    required this.enteredAmount,
    required this.submitData,
    required this.pickDate,
    this.seltecedDate,
    required this.selectedCategory,
  });

  final TextEditingController enteredTitle, enteredAmount;
  final DateTime? seltecedDate;
  final void Function() submitData, pickDate;

  final Widget selectedCategory;
  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constrain) {
      final width = constrain.maxWidth;
      final height = constrain.maxHeight;

      return SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(18, 5, 18, keyboardSpace + 20),
            child: Column(
              children: [
                if (width >= height)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _titleField()),
                      const SizedBox(
                        width: 80,
                      ),
                      _amountField(),
                    ],
                  )
                else
                  _titleField(),
                const SizedBox(
                  height: 8,
                ),
                if (width >= height)
                  Row(
                    children: [
                      _categoryDropDown(),
                      const SizedBox(
                        width: 120,
                      ),
                      _date(),
                    ],
                  )
                else
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _amountField(),
                      const Spacer(),
                      _date(),
                    ],
                  ),
                const SizedBox(
                  height: 12,
                ),
                if (width >= height)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _customButton(context),
                    ],
                  )
                else
                  Row(
                    children: [
                      _categoryDropDown(),
                      const Spacer(),
                      _customButton(context),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _customButton(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: const Color.fromARGB(220, 76, 175, 79),
          onPressed: submitData,
          child: const Text("Save"),
        ),
        const SizedBox(
          width: 7,
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: const Color.fromARGB(220, 244, 67, 54),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }

  Widget _categoryDropDown() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: selectedCategory,
    );
  }

  Widget _date() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          seltecedDate == null ? "No Date selected" : dateFormate.format(seltecedDate!),
          style: const TextStyle(fontSize: 16),
        ),
        IconButton(
          onPressed: pickDate,
          icon: const Icon(Icons.calendar_month),
        ),
      ],
    );
  }

  Widget _amountField() {
    return Expanded(
      child: TextFormField(
        controller: enteredAmount,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          prefixText: "\$",
          prefixStyle: TextStyle(fontSize: 16),
          labelText: "amount",
        ),
      ),
    );
  }

  Widget _titleField() {
    return TextFormField(
      controller: enteredTitle,
      keyboardType: TextInputType.name,
      maxLength: 50,
      decoration: const InputDecoration(
        labelText: "Title",
      ),
    );
  }
}
