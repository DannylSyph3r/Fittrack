import 'dart:math';

class BmiLogic {
  BmiLogic({required this.height, required this.weight});

  final int height;
  final int weight;

  late double normalWeightHigh;
  late double normalWeightLow;
  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String calculateNormalWeightLow() {
    normalWeightLow = 18.5 * pow(height / 100, 2);
    return normalWeightLow.toStringAsFixed(1);
  }

  String calculateNormalWeightHigh() {
     normalWeightHigh = 24.9 * pow(height / 100, 2);
     return normalWeightHigh.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.5) {
      return 'Underweight';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'Normal and Healthy';
    } else if (_bmi >= 25 && _bmi <=29.9) {
      return 'Overweight';
    } else if (_bmi >= 30 && _bmi <=39.9) {
      return 'Obesity';
    } else {
      return 'Severe Obesity';
    }
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return 'Based on the BMI calculation you provided, it appears that you may be underweight, with a BMI below 18.5. Being underweight can increase your risk for health problems, including a weakened immune system and nutrient deficiencies. It is important to speak with a healthcare professional about your BMI and overall health to determine the best course of action for achieving a healthy weight. A registered dietitian can provide guidance on developing a healthy eating plan to support your weight goals.';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'Your BMI calculation falls within the "normal and healthy" range, indicating that your weight is appropriate for your height. Maintaining a healthy BMI can reduce the risk of developing health problems such as heart disease and type 2 diabetes. It is important to focus on incorporating a balanced diet and regular physical activity into your lifestyle to continue maintaining a healthy BMI and improving your overall health and wellbeing.';
    } else if(_bmi >= 25 && _bmi <=29.9) {
      return 'Your BMI calculation falls within the "overweight" range, indicating excess body fat that can increase the risk of developing health problems such as heart disease and diabetes. It is important to speak with a healthcare professional to determine the best course of action for achieving a healthy weight. Lifestyle changes, such as increasing physical activity, reducing calorie intake, and quitting smoking can help improve overall health and reduce the risk of chronic diseases. A registered dietitian and personal trainer can provide guidance on developing a healthy eating and exercise plan.';
    } else if(_bmi >= 30 && _bmi <=39.9){
      return 'Your BMI calculation falls within the "obese" range, which can increase the risk of developing chronic diseases such as heart disease, stroke, and diabetes. It is important to speak with a healthcare professional to determine the best course of action for achieving a healthy weight. Lifestyle changes, such as increasing physical activity and reducing calorie intake, can help manage obesity and reduce the risk of chronic diseases. In some cases, weight loss medications or bariatric surgery may be recommended. A healthcare professional can provide personalized recommendations and support to achieve a healthy weight and improve overall health.';
    } else {
      return 'Your BMI calculation falls within the "severely obese" range, which can increase the risk of developing chronic diseases such as heart disease, stroke, and diabetes. It is important to speak with a healthcare professional to determine the best course of action for achieving a healthy weight. A registered dietitian and personal trainer can provide guidance on developing a healthy eating and exercise plan, but in some cases, weight loss medications or bariatric surgery may be recommended. Managing severe obesity can be challenging, but with the right support and tools, it is possible to improve health outcomes and reduce the risk of chronic diseases.';
    }
  }
}
