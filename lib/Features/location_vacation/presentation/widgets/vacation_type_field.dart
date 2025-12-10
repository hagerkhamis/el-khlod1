import 'package:flutter/material.dart';

class VacationTypeField extends StatelessWidget {
  final List<Map<String, dynamic>> types;
  final String? selectedTypeId;
  final TextEditingController controller;
  final ValueChanged<String> onSelected;

  const VacationTypeField({
    required this.types,
    required this.selectedTypeId,
    required this.controller,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  controller.text = types.firstWhere(
  (t) => t['vacation_id'].toString() == selectedTypeId,
  orElse: () => {'vacation_name': ''},
)['vacation_name'] ?? '';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("نوع الإجازة",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 6),
          TextField(
            readOnly: true,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: PopupMenuButton<String>(
                icon: const Icon(Icons.arrow_drop_down),
                onSelected: onSelected,
                itemBuilder: (context) => types.map((type) {
                  return PopupMenuItem<String>(
                    value: type['vacation_id'].toString(),
                    child: Text(type['vacation_name']),
                  );
                }).toList(),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
