# cars_list

A new Flutter project.

## Getting Started

### Steps:

1. Remove the entire code and then replace it with a simple Stateless Widget.
2. Implement the scaffold and app bar in the stateless widget.

### What will a Car Object have ?

It'll have a Photo of car, Model, Make as well as the top speed of the car.

3. Create a car class.
4. Add a list of car objects in our main.dart (Dummy list for now).
5. Initially we will map the car objects list to a list of Card(child:Text(object.model))

### Change the UI of the Card
From our design we know that our CarUI is gonna have a row with 3 children (2 children for now as we will image later). 
The first child is a column(model , make) and the second child is a Text widget(topSpeed).
Since all of them can be procured only from a car object we will create a CarUI Constructor that take a car object.

6. Finally we will replace the Card(child:Text(object.model)) with the CarUI

## Add a Car from our App
1. We will add some Text Edits for the Car object and then have a submit button which will add it to the list.
2. We need to create a seperate Widget CarForm to store all of those TextFields including the submit button.
3. Do note that CarFrom has to be a stateful widget because we need to get the values of textfields inside a controller.
4. Using the controller get the values and print them to the screen.

## Display the Car in the list 
1. Now we know that we cannot add a car to the list in a stateless Widget.
2. Since we are generating the list through the column in our main.dart (stless widget) , let's move the column into our CarForm(Stful Widget).
3. So our CarForm will need to access the carList from main.dart so we can go ahead and create a constructor.
4. Finally we should change the onPressed in our text button to add a car object to our carList.

## Focus on the UI
1. We want our model no to have the primary focus, let's bold it and increase it's font size.