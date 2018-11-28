#!/usr/bin/env python
# PySorting.py - implementation of sort algorithm in Python

"""The implementation of sort algorithm in Python

:param alist: some mutable unordered alist
:return: the some alist ordered by ascending

Examples:
>>> insertion_sort([1,5,3,2,0])
[0,1,2,3,5]
"""

# concatenate two sorted lists, used in quick sorting
def _concatenate_lists(list_1, middle, list_2):
	alist = []  # create a new list
	if list_1 is not None:
		alist.extend(list_1)

	if middle is not None:
		alist.append(middle) # append the middle if there is one

	if list_2 is not None:
		alist.extend(list_2) # append each of the elements from list_2

	return alist  # return the list

# used in heap sorting
def _heapify(unsorted, index, heap_size):
	greatest = index
	left_index = 2 * index + 1
	right_index = 2 * index + 2
	if left_index < heap_size and unsorted[left_index] > unsorted[greatest]:
		greatest = left_index

	if right_index < heap_size and unsorted[right_index] > unsorted[greatest]:
		greatest = right_index

	if greatest != index:
		tmp = unsorted[greatest]
		unsorted[greatest] = unsorted[index]
		unsorted[index] = tmp
		_heapify(unsorted, greatest, heap_size)





def insertion_sort(alist):

	length = len(alist)
	for i in range(1,length):
		for j in range(i,length):
			if alist[j] < alist[i]:
				tmp = alist[i]
				alist[i] = alist[j]
				alist[j] = tmp
		# Or using the following loop to replace the j for loop
		# while 0 < i and alist[i] < alist[i - 1]:
		# 	alist[i], alist[i - 1] = alist[i - 1], alist[i]
		# 	i -= 1
	return alist

def bubble_sort(alist):
	length = len(alist)
	for i in range(length-1,0,-1):
		for j in range(i):
			if alist[j] > alist[j+1]:
				tmp = alist[j]
				alist[j] = alist[j+1]
				alist[j+1] = tmp
	return alist

def quick_sort(alist):
	smaller = []
	greater = []
	if len(alist) <= 1:
		return alist
	pivot = alist.pop()
	for i in alist:
		if i < pivot:
			smaller.append(i)
		else:
			greater.append(i)
	return _concatenate_lists(quick_sort(smaller), pivot, quick_sort(greater))

def selection_sort(alist):
	length = len(alist)
	for i in range(length-1, 0, -1):
		 pos = 0
		 for j in range(1, i+1):
		 	if alist[j] > alist[pos]:
		 		pos = j
		 tmp = alist[i]
		 alist[i] = alist[pos]
		 alist[pos] = tmp
	return alist

def shell_sort(alist):
	# shell sort using shell's gap sequence: n/2, n/4, ..., 1
	length = len(alist)
	gap = length // 2
	# loop over the gaps
	while gap > 0:
		# do the insertion sort
		for i in range(gap,length):
			val = alist[i]
			j = i
			while j >= gap and alist[j - gap] > val:
				alist[j] = alist[j - gap]
				j -= gap
			alist[j] = val
		gap //= 2
	return alist

def merge_sort(alist):
	length = len(alist)
	if length > 1:
		midpoint = length // 2
		left_half = merge_sort(alist[:midpoint])
		right_half = merge_sort(alist[midpoint:])
		i = 0
		j = 0
		k = 0
		left_length = len(left_half)
		right_length = len(right_half)
		while i < left_length and j < right_length:
			if left_half[i] < right_half[j]:
				alist[k] = left_half[i]
				i += 1
			else:
				alist[k] = right_half[j]
				j += 1
			k += 1
		while i < left_length:
			alist[k] = left_half[i]
			i += 1
			k += 1
		while j < right_length:
			alist[k] = right_half[j]
			j += 1
			k += 1
	return alist

def heap_sort(alist):
	length = len(alist)
	for i in range(length // 2 - 1,-1,-1):
		_heapify(alist, i, length)
	for i in range(length-1,0,-1):
		tmp = alist[0]
		alist[0] = alist[i]
		alist[i] = tmp
		_heapify(alist, 0, i)
	return alist

def gnome_sort(alist):
	i = 1
	length = len(alist)
	while i < length:
		if alist[i] >= alist[i-1]:
			i += 1
		else:
			tmp = alist[i]
			alist[i] = alist[i-1]
			alist[i-1] = tmp
			if i > 1:
				i -= 1
	return alist

def cocktail_sort(alist):
	length = len(alist)
	for i in range(length-1,0,-1):
		swapped = False
		for j in range(i,0,-1):
			if alist[j] < alist[j-1]:
				tmp = alist[j]
				alist[j] = alist[j-1]
				alist[j-1] = tmp
				swapped = True
		for j in range(i):
			if alist[j] > alist[i]:
				alist[j], alist[j+1] = alist[j+1], alist[j]
				swapped = True
		if not swapped:
			return alist

