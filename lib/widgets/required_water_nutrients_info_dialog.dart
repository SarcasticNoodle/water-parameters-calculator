import 'package:flutter/material.dart';

class RequiredWaterNutrientsInfoDialog extends StatelessWidget {
  const RequiredWaterNutrientsInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('FAQ - Cal/Mag-Werte'),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          children: [
            ListTile(
              title: Text('Warum ist das Verhältnis von Calcium zu Magnesium wichtig?'),
              subtitle: Text('Für ein optimales Wachstum deiner Pflanzen sollte das Verhältnis von Calcium (Ca) zu Magnesium (Mg) idealerweise 3:1 betragen. Ein unausgeglichenes Verhältnis kann Nährstoffblockaden verursachen, was zu Wachstumsproblemen führt.'),
            ),
            ListTile(
              title: Text('Was kann ich tun, wenn meine Wasserwerte zu hoch sind?'),
              subtitle: Text('Wenn die Ca- oder Mg-Werte deines Wassers zu hoch sind, solltest du in Erwägung ziehen, einen Wasserfilter oder eine Vollentsalzungsanlage (VE-Anlage) zu nutzen, um die Nährstoffkonzentration anzupassen. Dies hilft dir, die Kontrolle über die Nährstoffzufuhr zu behalten und ein gesundes Verhältnis zu erreichen.'),
            ),
            ListTile(
              title: Text('Wie kann ich Calcium und Magnesium anpassen?'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Falls dein Wasser zu wenig Calcium oder Magnesium enthält, kannst du dies gezielt durch Düngemittel ergänzen.'),
                  Text('- Bei Calcium kann u.a. Calcium-Nitrat benutzt werden, um den Calciumgehalt im Wasser zu erhöhen.'),
                  Text('- Bei Magnesium kann z.B. Bittersalz (Magnesiumsulfat) eine Lösung sein, um den Magnesiumgehalt zu korrigieren.'),
                ],
              ),
            ),
            ListTile(
              title: Text('Tipp zum anpassen der Wasserwerte'),
              subtitle: Text('Versuche am besten deine Wasserwerte durch mischen von Leitungs- und gefiltertem Wasser zu ändern, sodass du nur die Nährstoffe hinzufügst, die nicht im Wasser sind - und um die Filter zu schonen.'),
            ),
            ListTile(
              title: Text('Was passiert, wenn das Verhältnis nicht stimmt?'),
              subtitle: Text('Ein Ungleichgewicht kann zu Mangelerscheinungen oder Blockaden führen, da Cannabis Pflanzen Calcium und Magnesium in einem spezifischen Verhältnis benötigen, um diese Nährstoffe effektiv aufzunehmen.'),
            ),
          ],
        ),
      ),
    );
  }
}
