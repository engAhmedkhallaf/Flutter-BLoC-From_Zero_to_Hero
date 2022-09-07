import 'package:bloc_from_zero_to_hero/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondCounterScreen extends StatelessWidget {
  const SecondCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('Counter Value')),
            BlocConsumer<CounterCubit, CounterState>(
              listener: ((context, state) {
                if (state.wasUpdated == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(
                        milliseconds: 300,
                      ),
                    ),
                  );
                } else if (state.wasUpdated == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(
                        milliseconds: 300,
                      ),
                    ),
                  );
                }
              }),
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: const TextStyle(
                    fontSize: 60.0,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: '3',
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decremet();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
                FloatingActionButton(
                  heroTag: '4',
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).incremet();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('counter3');
              },
              color: Colors.blueGrey,
              textColor: Colors.white,
              child: const Text(
                'Third Screen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
