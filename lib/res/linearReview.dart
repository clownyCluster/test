import 'barrel_file.dart';

class LinearReviewSummary extends StatelessWidget {
  const LinearReviewSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('4.7',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Text('${5 - index} star', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 4),
                    Expanded(
                      child: Container(
                        height: 8,
                        child: LinearProgressIndicator(
                          value: [0.04, 0.75, 0.14, 0.05, 0.01][index],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
