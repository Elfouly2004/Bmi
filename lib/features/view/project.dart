import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/bmi_cubit.dart';
import '../controller/bmi_state.dart';
import 'home1.dart';

class FirstPage extends StatelessWidget {
  final String h;
  const FirstPage(this.h, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirstPageCubit(),
      child: BlocBuilder<FirstPageCubit, FirstPageState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xff0A0E21),
            appBar: AppBar(
              backgroundColor: const Color(0xff1A1F38),
              title: const Center(
                child: Text(
                  "BMI Calculator",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    genderSelection(context, "Female", "assets/images/Vector.png", false, state.male),
                    genderSelection(context, "Male", "assets/images/mars.png", true, state.male),
                  ],
                ),
                heightSlider(context, state.height),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    incrementDecrementBox(context, "WEIGHT", state.weight, context.read<FirstPageCubit>().incrementWeight, context.read<FirstPageCubit>().decrementWeight),
                    incrementDecrementBox(context, "AGE", state.age, context.read<FirstPageCubit>().incrementAge, context.read<FirstPageCubit>().decrementAge),
                  ],
                ),
                const SizedBox(height: 100),
                calculateButton(context, state.height, state.weight, h),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget genderSelection(BuildContext context, String label, String asset, bool isMale, bool currentGender) {
    return InkWell(
      onTap: () => context.read<FirstPageCubit>().toggleGender(isMale),
      child: Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: currentGender == isMale ? Colors.blue : const Color(0xff1a1f38),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(asset, height: 50, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 24)),
          ],
        ),
      ),
    );
  }

  Widget heightSlider(BuildContext context, double height) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff1a1f38),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text("HEIGHT", style: TextStyle(color: Colors.white, fontSize: 25)),
          Text("${height.round()} cm", style: const TextStyle(color: Colors.white, fontSize: 20)),
          Slider(
            min: 0,
            max: 200,
            value: height,
            onChanged: (value) => context.read<FirstPageCubit>().updateHeight(value),
          ),
        ],
      ),
    );
  }

  Widget incrementDecrementBox(BuildContext context, String label, int value, VoidCallback onIncrement, VoidCallback onDecrement) {
    return Container(
      width: 150,
      height: 180,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff1a1f38),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 23)),
          Text("$value", style: const TextStyle(color: Colors.white, fontSize: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle, size: 40, color: Colors.white),
                onPressed: onDecrement,
              ),
              IconButton(
                icon: const Icon(Icons.add_circle, size: 40, color: Colors.white),
                onPressed: onIncrement,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget calculateButton(BuildContext context, double height, int weight, String h) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Gameplay(height, weight, h)),
        );
      },
      child: Container(
        width: 420,
        height: 60,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          color: const Color(0xfff10606),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text("CALCULATE", style: TextStyle(fontSize: 30, color: Colors.white)),
      ),
    );
  }
}
