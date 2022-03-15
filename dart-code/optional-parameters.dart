class Student
{
  String name;
  String id;
  String grade;
  int marks;
  
  //Optional parameters
  Student(this.name,this.id,this.grade,[this.marks = 0]);
  
 
  
}

void main()
{  
  
  var aarav = Student('Aarav','AA123','8th Class',95);
  
  var sandhya = Student('Sandhya','SA123','8th Class');
  
  
  print("Aarav's marks are ${aarav.marks}");
  
  print("Sandhya's marks are ${sandhya.marks}");
 
}