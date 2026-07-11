import 'package:flutter/material.dart';

class SegmentSelector extends StatelessWidget {
  final String title;
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String> onChanged;

  const SegmentSelector({
    super.key,
    required this.title,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: items.map((item) {
            final selected = item == selectedItem;

            return ChoiceChip(
              label: Text(item),
              selected: selected,
              onSelected: (_) => onChanged(item),
              selectedColor: Colors.cyan,
            );
          }).toList(),
        ),
      ],
    );
  }
}