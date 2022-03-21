import 'package:flutter/material.dart';
import 'package:way_for_ball/utils/shared_prefs.dart';
import 'package:velocity_x/velocity_x.dart';

class Volume {
  static show(BuildContext context) {
    double _currentSliderValue = 100;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xff1e3266),
        content: SizedBox(
          width: 100,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              const Text(
                "Volume",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SoundSlider(
                onChanged: (value) {
                  _currentSliderValue = value;
                },
              ),
              const HeightBox(20),
              ElevatedButton(
                onPressed: () {
                  SharedPrefUtils.volume = _currentSliderValue.toString();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff356cb1),
                ),
                child: const Text("OK"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SoundSlider extends StatefulWidget {
  final void Function(double) onChanged;

  const SoundSlider({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<SoundSlider> createState() => _SoundSliderState();
}

class _SoundSliderState extends State<SoundSlider> {
  double _currentSliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 100,
      divisions: 5,
      activeColor: const Color(0xff356cb1),
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
          widget.onChanged(value);
        });
      },
    );
  }
}
