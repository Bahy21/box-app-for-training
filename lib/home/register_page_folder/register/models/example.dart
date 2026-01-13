class Student{


   int age;
   String name;

  Student({required this.age, required this.name});

}



  Student st1 = Student(age: 5, name: 'dfgh');

  // Student st2 = Student(age: 10, name: '12');


  void yyy(){

    st1.age = 15;

    // print(" age is ${st2.age}");

  }