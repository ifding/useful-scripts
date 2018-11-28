

[find length of sequences of identical values in a numpy array](https://stackoverflow.com/questions/1066758/find-length-of-sequences-of-identical-values-in-a-numpy-array-run-length-encodi)

Fully numpy vectorized and generic RLE for any array (works with strings, booleans etc too).
Outputs tuple of run lengths, start positions, and values.

```python
import numpy as np

def rle(inarray):
        """ run length encoding. Partial credit to R rle function. 
            Multi datatype arrays catered for including non Numpy
            returns: tuple (runlengths, startpositions, values) """
        ia = np.array(inarray)                  # force numpy
        n = len(ia)
        if n == 0: 
            return (None, None, None)
        else:
            y = np.array(ia[1:] != ia[:-1])     # pairwise unequal (string safe)
            i = np.append(np.where(y), n - 1)   # must include last element posi
            z = np.diff(np.append(-1, i))       # run lengths
            p = np.cumsum(np.append(0, z))[:-1] # positions
            return(z, p, ia[i])
```

Pretty fast (i7):
```python
xx = np.random.randint(0, 5, 1000000)
%timeit yy = rle(xx)
100 loops, best of 3: 18.6 ms per loop
```
Multiple data types:
```python
rle([True, True, True, False, True, False, False])
Out[8]: 
(array([3, 1, 1, 2]),
 array([0, 3, 4, 5]),
 array([ True, False,  True, False], dtype=bool))

rle(np.array([5, 4, 4, 4, 4, 0, 0]))
Out[9]: (array([1, 4, 2]), array([0, 1, 5]), array([5, 4, 0]))

rle(["hello", "hello", "my", "friend", "okay", "okay", "bye"])
Out[10]: 
(array([2, 1, 1, 2, 1]),
 array([0, 2, 3, 4, 6]),
 array(['hello', 'my', 'friend', 'okay', 'bye'], 
       dtype='|S6'))
```

Same results as Alex Martelli above:
```python
xx = np.random.randint(0, 2, 20)

xx
Out[60]: array([1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1])

am = runs_of_ones_array(xx)

tb = rle(xx)

am
Out[63]: array([4, 5, 2, 5])

tb[0][tb[2] == 1]
Out[64]: array([4, 5, 2, 5])

%timeit runs_of_ones_array(xx)
10000 loops, best of 3: 28.5 µs per loop

%timeit rle(xx)
10000 loops, best of 3: 38.2 µs per loop
Slightly slower than Alex (but still very fast), and much more flexible.
```
