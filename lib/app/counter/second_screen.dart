import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoapp/app/counter/cubit/counter_cubit_cubit.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocListener<CounterCubitCubit, CounterCubitState>(
      listener: (context, state) {
        if (state.isCounter == true) {
          const SnackBar(
            content: Text('increment'),
            backgroundColor: Colors.green,
          );
        } else if (state.counterValue == false) {
          const SnackBar(
            content: Text('decrement'),
            backgroundColor: Colors.amberAccent,
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Counter App to Count on Click Of Button'),
          const SizedBox(height: 20),
          BlocBuilder<CounterCubitCubit, CounterCubitState>(
            builder: (context, state) {
              if (state.counterValue < 0) {
                return Text(
                  state.counterValue.toString(),
                  style: const TextStyle(fontSize: 22, color: Colors.red),
                );
              }
              return Text(
                state.counterValue.toString(),
                style: const TextStyle(fontSize: 22, color: Colors.blue),
              );
            },
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubitCubit>(context).increment();
                },
                child: const Text('+'),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubitCubit>(context).decrement();
                },
                child: const Text('-'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
