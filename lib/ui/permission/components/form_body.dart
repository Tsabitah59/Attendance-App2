import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class FormBody extends StatelessWidget {
  const FormBody({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final formController = TextEditingController();
    final toController = TextEditingController();
    var dropValueCategories = "Why you permit?";
    var categoryList = <String>[
      "Sick",
      "Other"
    ];
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText: "Your Name",
              // TODO - tambahin label style
              hintText: "Lesser Lord Kusanali",
              // TODO - tambahin hint style
              border: OutlineInputBorder(
                // TODO - ringkas ini ke const.dart
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                )
              ),
              enabledBorder: OutlineInputBorder(
                // TODO - ringkas ini ke const.dart
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                )
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Text(
              "Are You Taking for Permission?"
              // TODO - tambahin stylenya
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blueAccent,
                style: BorderStyle.solid,
                width: 1
              ),
            ),
            child: DropdownButton(
              items: categoryList.map((value) {
                // DropdownMenuItem itu tipenya Iterable, dipakein toList() biar tipenya berubah mnenjadi List  
                return DropdownMenuItem(
                  value: value.toString(),
                  child: Text(
                    value.toString()
                    // TODO - styling text si dropdown-nya
                  ),
                );
                // Mengonversi data acak menjadi berurutan
              }).toList(), 
              dropdownColor: Colors.white,
              value: dropValueCategories,
              onChanged: (value) {
                dropValueCategories = value.toString();
              },
              icon: SvgPicture.asset(
                'assets/icons/fi-rr-angle-down.svg'
              ),
              elevation: 16,
              // TODO - taulah kek biasa, styling text
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: [
                Text(
                  "From"
                  // TODO - Iya, styling lagi
                ),
                Expanded(
                  child: TextField(
                    readOnly: true,
                    // Menggunakan async await karena showDatePicker() adalah Future
                    onTap:() async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context, 
                        firstDate: DateTime(DateTime.now().year), 
                        lastDate: DateTime(DateTime.now().year)
                      );

                      if (pickedDate != null) {
                        // Untuk konversi data tanggal yang diambil menjadi format dd/mm/yyyy
                        formController.text = DateFormat('dd/mm/yyyy').format(pickedDate);
                      }
                    },

                    // TODO - Taukan, styling text lagi huft
                    controller: formController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      hintText: "Starting From"
                      // TODO - Ini juga
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Until"
                        // TODO - Kek biasa
                      ),
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          // Menggunakan async await karena showDatePicker() adalah Future
                          onTap:() async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context, 
                              // Memberi tahu semua tanggal yang available
                              firstDate: DateTime(DateTime.now().year), 
                              lastDate: DateTime(DateTime.now().year)
                            );

                            if (pickedDate != null) {
                              // Untuk konversi data tanggal yang diambil menjadi format dd/mm/yyyy
                              toController.text = DateFormat('dd/mm/yyyy').format(pickedDate);
                            }
                          },

                          // TODO - Taukan, styling text lagi huft
                          controller: toController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: "Until?"
                            // TODO - Ini juga
                          ),
                        ),
                      ),
                    ],
                  ),

                )
              ],
            ),
          )
        ],
      ),
    );
  }
}