import 'package:car_rental_app/bloc/trip_bloc/trip_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EndDatePicker extends StatefulWidget {
  const EndDatePicker({super.key});

  @override
  State<EndDatePicker> createState() => _EndDatePickerState();
}

class _EndDatePickerState extends State<EndDatePicker> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripBloc, TripState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
              initialDate: DateTime.now(),
            );

            if (picked != null) {
              context.read<TripBloc>().add(PickEndDate(picked));
            }
          },
          child: BlocBuilder<TripBloc, TripState>(
            builder: (context, state) {
              String text = "";

              if (state is TripDatesSelected && state.endDate != null) {
                text = state.endDate!.toLocal().toString().split(" ")[0];
              }

              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(text, style: const TextStyle(fontSize: 16)),
                    Spacer(),
                    Icon(Icons.calendar_month),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
