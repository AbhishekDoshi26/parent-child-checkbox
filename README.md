<h2><b>parent_child_checkbox</b></h2>

<h3>Parent Child Checkbox is a type of checkbox where we can establish hierarchy in Checkboxes.</h3>
You can create a Parent Checkbox which has multiple checkboxes as their children! The value of parent checkbox depends on the value of children checkboxes and vice-versa.<br>
If we clicked on Parent Checkbox, all children checkboxes will be selected too. <br><br>

![alt text](https://miro.medium.com/max/1200/1*uq4jGrYXhZMEcXOv04mcoA.gif)

<h3>Properties available: </h3>
<table>
  <th>Parameter Name</th>
  <th>Parameter Type</th>
  <th>Description</th>
  <tr>
    <td>parent</td>
    <td>Text</td>
    <td>Text Widget to specify the Parent checkbox</td>
  </tr>
  <tr>
    <td>children</td>
    <td>List&ltText&gt</td>
    <td>List&ltText&gt Widgets to specify the Children checkboxes</td>
  </tr>
  <tr>
    <td>parentCheckboxColor</td>
    <td>Color</td>
    <td>Color of Parent CheckBox<br>Defaults to [ThemeData.toggleableActiveColor]</td>
  </tr>
  <tr>
    <td>childrenCheckboxColor</td>
    <td>Text Widget</td>
    <td>Text Widget to specify the Parent checkbox</td>
  </tr>
  <tr>
    <td>isParentSelected</td>
    <td>Getter</td>
    <td>Getter to get whether particular parent is selected or not.<br><br>Example: {'Parent 1' : true, 'Parent 2' : false} where Parent 1 and Parent 2 will be 2 separate      parents if you are using multiple ParentChildCheckbox in your code.<br><br>
  Default value will be false for all specified parents
    </td>
  </tr>
  <tr>
    <td>selectedChildrens</td>
    <td>Getter</td>
    <td> Getter to get which childrens are selected for a particular parent.<br><br> Example: {'Parent 1' : ['Children 1.1','Children 1.2'], 'Parent 2' : []} where Parent 1 and Parent 2 will be 2 separate parents if you are using multiple ParentChildCheckbox in your code.<br><br> Default value is {'Parent 1' : [], 'Parent 2' : []}
    </td>
  </tr>
</table>

<h3>Example:</h3>
<br><br>

```
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:parent_child_checkbox/parent_child_checkbox.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: Text('Parent Child Checkox')),
        body: Column(
          children: [
            ParentChildCheckbox(
              parent: Text('Parent 1'),
              children: [
                Text('Children 1.1'),
                Text('Children 1.2'),
                Text('Children 1.3'),
                Text('Children 1.4'),
              ],
              parentCheckboxColor: Colors.orange,
              childrenCheckboxColor: Colors.red,
            ),
            ParentChildCheckbox(
              parent: Text('Parent 2'),
              children: [
                Text('Children 2.1'),
                Text('Children 2.2'),
                Text('Children 2.3'),
                Text('Children 2.4'),
              ],
            ),
            ElevatedButton(
              child: Text('Get Data'),
              onPressed: () {
                log(ParentChildCheckbox.isParentSelected.toString());
                log(ParentChildCheckbox.selectedChildrens.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}


```

