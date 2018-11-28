
# Noise reduction


## total variation denoising

In signal processing, total variation denoising, also known as total variation regularization, is a process, most often used in digital image processing, that has applications in noise removal.

It is based on the principle that signals with **excessive and possibly spurious detail have high total variation**, that is, the **integral of the absolute gradient** of the signal is high.

According to this principle, reducing the total variation of the signal subject to it being a close match to the original signal, **removes unwanted detail whilst preserving important details** such as edges. 

The concept was pioneered by Rudin, Osher, and Fatemi in 1992 and so is today known as the **ROF model**.

More details: [wikipedia](https://en.wikipedia.org/wiki/Total_variation_denoising)

I used [proxTV toolbox](https://github.com/albarji/proxTV) in Python to solve this optimization problem. Code from: [here](https://dsp.stackexchange.com/questions/43374/removing-low-frequencies-from-a-signal)

```python
import scipy.io as sio
import numpy as np
import matplotlib.pyplot as plt
import prox_tv as ptv

mat_struct = sio.loadmat('Signal1.mat')
noisy_signal = mat_struct['x'].T[0]

filtered_signal = ptv.tv1_1d(noisy_signal, 50)

time_vec = np.linspace(0, len(noisy_signal)/1500., len(noisy_signal))

plt.close('all')

fig, ax = plt.subplots(3,1,sharex=True)

ax[0].plot(time_vec,noisy_signal)
ax[0].set_title('noisy signal')

ax[1].plot(time_vec,filtered_signal)
ax[1].set_title('filtered signal')

ax[2].plot(time_vec,noisy_signal - filtered_signal)
ax[2].set_title('noise')
ax[2].set_xlabel('time (s)')

plt.tight_layout()
plt.show(block=False)
```

## USING PYWAVELETS TO REMOVE HIGH FREQUENCY NOISE

> Reference: [here](http://connor-johnson.com/2016/01/24/using-pywavelets-to-remove-high-frequency-noise/)

```
$ sudo pip install PyWavelets
```

The wavelet argument determines the type of wavelet, more wavelet types can be found here. I’ve specified the "db4" wavelet as the default, but the PyWavelets module supports over seventy different types of wavelets. Below is a list of possible wavelet parameters,

```
The Haar wavelet, "haar", produces a square signal
the “Discrete” Meyer wavelet, "dmey"
The Daubechies family of wavelets, "db1" through "db20"
The Symlets family, "sym2" through "sym20"
The Coiflet family, "coif1" through "coif5"
The Biorthognal and Reverse Biorthogonal families
"bior1.1", "rbio1.1"
"bior1.3", "rbio1.3"
"bior1.5", "rbio1.5"
"bior2.2", "rbio2.2"
"bior2.4", "rbio2.4"
"bior2.6", "rbio2.6"
"bior2.8", "rbio2.8"
"bior3.1", "rbio3.1"
"bior3.3", "rbio3.3"
"bior3.5", "rbio3.5"
"bior3.7", "rbio3.7"
"bior3.9", "rbio3.9"
"bior4.4", "rbio4.4"
"bior5.5", "rbio5.5"
"bior6.8", "rbio6.8"
```

The level argument determines the level of smoothing, but it depends on the length of the signal that you are smoothing, so start with 1, and then move up to 2, etc, until you get an error. (Scientific, I know.)

```python
%inline pylab # <-- add this if you're in an IPython notebook
import pywt
import numpy as np
import seaborn
from statsmodels.robust import mad
 
def waveletSmooth( x, wavelet="db4", level=1, title=None ):
    # calculate the wavelet coefficients
    coeff = pywt.wavedec( x, wavelet, mode="per" )
    # calculate a threshold
    sigma = mad( coeff[-level] )
    # changing this threshold also changes the behavior,
    # but I have not played with this very much
    uthresh = sigma * np.sqrt( 2*np.log( len( x ) ) )
    coeff[1:] = ( pywt.threshold( i, value=uthresh, mode="soft" ) for i in coeff[1:] )
    # reconstruct the signal using the thresholded coefficients
    y = pywt.waverec( coeff, wavelet, mode="per" )
    f, ax = plt.subplots()
    plot( x, color="b", alpha=0.5 )
    plot( y, color="b" )
    if title:
        ax.set_title(title)
    ax.set_xlim((0,len(y)))
```