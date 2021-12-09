

# C++ and Java Syntax Differences Cheat Sheet


## OOP

> nullptr vs. null

- C++
```c++
int *x = nullptr; // initialize pointer to nullptr
```

- Java
```java
// the compiler will catch the use of uninitialized references, but if you
// need to initialize a reference so it's known to be invalid, assign null
myClass x = null;
```

> Object declarations

- C++
```c++
myClass x; // on the stack

myClass *x = new myClass;  // or on the heap
```

- Java
```java
// always allocated on the heap (also, always need parens for constructor)
myClass x = new myClass();
```

> Accessing fields of objects

- C++
```c++
myClass x;
x.my_field; // If you're using a stack-based object, you access its fields with a dot
// But you use the arrow operator (->) to access fields of a class when working with a pointer
myClass x = new MyClass;
x->my_field;  // ok
```

- Java
```java
//always work with references (similar to pointers--see the next), so always use a dot:
myClass x = new MyClass();
x.my_field; // ok
```

> References vs. pointers

- C++
```c++
// references are immutable, use pointers for more flexibility
int bar = 7, qux = 6;
int& foo = bar;
```

- Java
```java
// references are mutable and store addresses only to objects; no raw pointers
myClass x;
x.foo(); // error, x is a null ``pointer''

// note that you always use . to access a field
```

> Inheritance

- C++
```c++
class Foo : public Bar
{ ... };
```

- Java
```java
class Foo extends Bar
{ ... }
```

> Protection levels

- C++
```c++
public:
    void foo();
    void bar();
```

- Java
```java
public void foo();
public void bar();
```

> Virtual functions

- C++
```c++
virtual int foo(); // or, non-virtually as simply int foo();
```

- Java
```java
// functions are virtual by default; use final to prevent overriding
int foo(); // or, final int foo();
```

> Abstract classes

- C++
```c++
// just need to include a pure virtual function
class Bar { public: virtual void foo() = 0; };    
```

- Java
```java
// syntax allows you to be explicit!
abstract class Bar { public abstract void foo(); }

// or you might even want to specify an interface
interface Bar { public void foo(); }

// and later, have a class implement the interface:
class Chocolate implements Bar
{
    public void foo() { /* do something */ }
}
```

## ArrayList

- C++
```c++
vector <int> v;
v.push_back(10);
v.pop_back();
v.size();
v.empty();
v.at(0)/v[0];


vector<int> v {1, 2, 3, 4};
// or
vector<int> v = {1, 2, 3, 4};
```

- Java
```java
List<Integer> v = new ArrayList<>();
v.add(10);
v.get(0);     // access an item
v.set(0, 20); // change an Item
v.remove(0);  // remove an Item
v.size();
v.clear();

// Array
String[] optypes = new String[]{"A", "B", "C"};

// List
List<Integer> v =
    new ArrayList<>(Arrays.asList(5, 4, 3, 2, 1));

List<Integer> copy = new ArrayList<>(origin);   // Create: From Existing (Clone)
```

> Sort / Reverse

- C++
```c++
sort/reverse(arr, arr+n);
sort/reverse(arr, arr+n, comp);
sort/reverse(v.begin(), v,end());
```

- Java
```java
Arrays.sort();
Collections.sort/reverse(list);
Collections.sort(list, Collections.reverseOrder());
Collections.sort(al, new MyComparator());

class MyComparator implements Comparator<T>{

    public int compare(T a, T b){return a.val - b.val;}

}
```

## Map

- C++
```c++
// unordered_map/ map
unordered_map<string, string> u;
 // Add two new entries to the unordered_map
u["BLACK"] = "#000000";
u["WHITE"] = "#FFFFFF";
for( const auto& [key, value] : u ) cout << key << ": " << value << "\n";
u.empty();
u.begin()/ u.end();
if (u.find("RED") != u.end()) { /* do something*/ }
u.erase("RED");
u.clear();
```

- Java
```java
// The HashMap gives you an unsorted, unordered Map, non-synchronized
Map<String, String> u = new HashMap<String, String>();
u.put("BLACK", "#000000");
u.put("WHITE", "#FFFFFF");
u.get("RED");    // access an Item
u.remove("RED"); // remove an Item
u.size();
u.clear();

// Print keys
for (String i : u.keySet()) {
  System.out.println(i + " value: " + u.get(i));
}

// Print values
for (String i : u.values()) {
  System.out.println(i);
}
```

`LinkedHashMap` extends `HashMap`. It maintains a linked list of the entries in the map, in the order in which they were inserted. This allows insertion-order iteration over the map. 
```java
//Here Insertion order maintains 
Map<Integer, String>lmap = new LinkedHashMap<Integer, String>();
```

A `TreeMap` is a `Map` that maintains its entries in ascending order, sorted according to the keys' natural ordering, or according to a Comparator provided at the time of the `TreeMap` constructor argument.
```java
Map<String, Integer> tMap = new TreeMap<String, Integer>();
```

> Summary

- Map is collection of key-value pair (associate) objects collection
- `HashMap` allows one null key, Values can be null or duplicate but keys have to be unique.
- Iteration order is not constant in the case of `HashMap`.
- When we need to maintain insertion order while iterating we should use `LinkedHashMap`.
- `LinkedHashMap` provides all the methods same as `HashMap`.
- `LinkedHashMap` is not threaded safe.
- `TreeMap` is sorted order collection either natural ordering or custom ordering as per comparator.


## Set

- C++
```c++
// unordered_set/set
// empty() / begin() / end() / find() / insert() / erase() / clear()
```

- Java
```java
HashSet<String> cars = new HashSet<String>();
cars.add("BMW");
cars.add("Ford");
cars.contains("Mazda"); // Check If an Item Exists
cars.remove("Volvo");   // Remove an Item
cars.clear();
cars.size();

for (String i : cars) {
  System.out.println(i);
}
```

> Differences Between HashSet, LinkedHashSet and TreeSet In Java

- `HashSet` uses `HashMap` internally to store it’s elements, doesn’t maintain any order of elements.
- `LinkedHashSet` uses `LinkedHashMap` internally to store it’s elements,  maintains insertion order of elements.
- `TreeSet` uses `TreeMap` internally to store it’s elements, orders the elements according to supplied Comparator.

> https://home.csulb.edu/~pnguyen/cecs277/lecnotes/hashtree.pdf


## LinkedList

- C++
```c++
// list
// begin() / end() / front() / back() / push_front() / pop_front() / push_back() / pop_back() 
// insert() / erase(iter) / remove(val)
```

- Java

The `LinkedList` has all of the same methods of `ArrayList` class because they both implement the `List` interface. `ArrayList` has a regular array inside it, `LinkedList`: each node has a link to the next node in the list.

```java
LinkedList<String> cars = new LinkedList<String>();
cars.add("Volvo");
cars.add("BMW");
addFirst();	   // Adds an item to the beginning of the list.	
addLast();	   // Add an item to the end of the list	
removeFirst(); // Remove an item from the beginning of the list.	
removeLast();  // Remove an item from the end of the list	
getFirst();    // Get the item at the beginning of the list	
getLast();     // Get the item at the end of the list
```


## String

- C++
```c++
// begin() / end() / size() / empty()
// operator[] / back() / front() / += / push_back() / pop_back() / insert / erase(str.begin()+9) 
// str.find(':') == string::npos
// isalpha / isdigit

istringstream iss(str);
string word;
while (iss >> word) {
	cout << word << endl;
}

istringstream input;
input.str("a;b;c;d");
for (string line; getline(input, line, ';')) {
	cout << line << endl;
}
```

- Java
```java
String myStr = "Hello";
char result = myStr.charAt(0); 

String myStr1 = "Hello";
String myStr2 = "Hello";
System.out.println(myStr1.compareTo(myStr2)); // Returns 0 because they are equal
equals()	// Compares two strings. Returns true if the strings are equal, and false if not

endsWith();	    // Checks whether a string ends with the specified character(s)
startsWith();   // Checks whether a string starts with specified characters
toCharArray();	// Converts this string to a new character array, char[]
toLowerCase();	// Converts a string to lower case letters
toUpperCase();	// Converts a string to upper case letters
isEmpty();   	// Checks whether a string is empty or not
```

## Queue

- C++
```c++
// queue
queue<int> q;
q.push(10);
q.pop();
q.front();

// priority_queue: empty() / top() / push() / pop()
```

- Java
```java
Queue<String> queue = new LinkedList<String>();
// or
Queue<String> queue = new PriorityQueue<String>();

//access via new for-loop
for(String element : queue) {
    //do something with each element
}

//access via Iterator
Iterator<String> iterator = queue.iterator();
while(iterator.hasNext(){
  String element = iterator.next();
}

// Add Element to Queue
// add() and offer() methods differ in how the behave if the Queue is full 
queue.add("element 1");    // throws an exception if full
queue.offer("element 2");  // whereas the offer() method just returns false

// Take Element From Queue, they differ if the Queue is empty.
String element2 = queue.remove(); // throws an exception if the Queue is empty
String element1 = queue.poll();   // returns null if empty

// Peek at the Queue, without taking the element out of the Queue
String firstElement = queue.element();  // If empty, throws an exception
String firstElement = queue.peek();     // return null if empty

queue.clear();  // Remove All Elements From Queue
queue.size();   // Get Queue Size
queue.isEmpty();

boolean containsMazda = queue.contains("Mazda"); // Check if Queue Contains Element
```

## Stack

- C++
```c++
stack<int> s;
s.push(10);
s.pop();
s.top();
s.size();
s.empty();
```

- Java
```java
Stack<String> stack = new Stack<String>();
stack.push("1");
String topElement = stack.pop();
String topElement = stack.peek();  // Peek at Top Element of Stack
int size = stack.size();
stack.empty();

Iterator iterator = stack.iterator();
while(iterator.hasNext()){
    Object value = iterator.next();
}
```