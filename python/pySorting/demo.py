# demo.py 

import sys, time, random
import PySorting

print("\nUsing this list to check sorting:")
print ("Original list:")
print([1,5,0,6,10,3])
print ("Insertion sort:")
print(PySorting.insertion_sort([1,5,0,6,10,3]))
print ("Bubble sort:")
print(PySorting.bubble_sort([1,5,0,6,10,3]))
print ("Quick sort:")
print(PySorting.quick_sort([1,5,0,6,10,3]))
print ("Selection sort:")
print(PySorting.selection_sort([1,5,0,6,10,3]))
print ("Shell sort:")
print(PySorting.shell_sort([1,5,0,6,10,3]))
print ("Merge sort:")
print(PySorting.merge_sort([1,5,0,6,10,3]))
print ("Heap sort:")
print(PySorting.heap_sort([1,5,0,6,10,3]))
print ("Gnome sort:")
print(PySorting.gnome_sort([1,5,0,6,10,3]))
print ("Cocktail sort:")
print(PySorting.cocktail_sort([1,5,0,6,10,3]))




print("\nUsing following method to time sorting:")

sum = 0.0
print ("Insertion sort:")
for x in range(0,3):
	t1 = time.time()
	PySorting.insertion_sort([random.randint(0,1001) for x in range(0, 1000)])
	t2 = time.time()
	print ("%0.3f ms" % ((t2 - t1)*1000.0))
	sum += (t2 - t1)*1000.0
print ("Average time: %0.3f ms\n" % (sum/3))

sum = 0.0
print ("Bubble sort:")
for x in range(0,3):
	t1 = time.time()
	PySorting.bubble_sort([random.randint(0,1001) for x in range(0, 1000)])
	t2 = time.time()
	print ("%0.3f ms" % ((t2 - t1)*1000.0))
	sum += (t2 - t1)*1000.0
print ("Average time: %0.3f ms\n" % (sum/3))


sum = 0.0
print ("Quick sort:")
for x in range(0,3):
	t1 = time.time()
	PySorting.quick_sort([random.randint(0,1001) for x in range(0, 1000)])
	t2 = time.time()
	print ("%0.3f ms" % ((t2 - t1)*1000.0))
	sum += (t2 - t1)*1000.0
print ("Average time: %0.3f ms\n" % (sum/3))


sum = 0.0
print ("Selection sort:")
for x in range(0,3):
	t1 = time.time()
	PySorting.selection_sort([random.randint(0,1001) for x in range(0, 1000)])
	t2 = time.time()
	print ("%0.3f ms" % ((t2 - t1)*1000.0))
	sum += (t2 - t1)*1000.0
print ("Average time: %0.3f ms\n" % (sum/3))

sum = 0.0
print ("Shell sort:")
for x in range(0,3):
	t1 = time.time()
	PySorting.shell_sort([random.randint(0,1001) for x in range(0, 1000)])
	t2 = time.time()
	print ("%0.3f ms" % ((t2 - t1)*1000.0))
	sum += (t2 - t1)*1000.0
print ("Average time: %0.3f ms\n" % (sum/3))

sum = 0.0
print ("Heap sort:")
for x in range(0,3):
	t1 = time.time()
	PySorting.heap_sort([random.randint(0,1001) for x in range(0, 1000)])
	t2 = time.time()
	print ("%0.3f ms" % ((t2 - t1)*1000.0))
	sum += (t2 - t1)*1000.0
print ("Average time: %0.3f ms\n" % (sum/3))

sum = 0.0
print ("Gnome sort:")
for x in range(0,3):
	t1 = time.time()
	PySorting.gnome_sort([random.randint(0,1001) for x in range(0, 1000)])
	t2 = time.time()
	print ("%0.3f ms" % ((t2 - t1)*1000.0))
	sum += (t2 - t1)*1000.0
print ("Average time: %0.3f ms\n" % (sum/3))

sum = 0.0
print ("Cocktail sort:")
for x in range(0,3):
	t1 = time.time()
	PySorting.cocktail_sort([random.randint(0,1001) for x in range(0, 1000)])
	t2 = time.time()
	print ("%0.3f ms" % ((t2 - t1)*1000.0))
	sum += (t2 - t1)*1000.0
print ("Average time: %0.3f ms\n" % (sum/3))

