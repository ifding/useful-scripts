import numpy as np
import matplotlib.pyplot as plt
from scipy.fftpack import fft
from scipy.signal import blackman

def simple_sine_wave():
	t = np.linspace(0, 2*np.pi, 1000, endpoint=True)
	f = 3.0 # frequency in Hz
	A = 100.0 # amplitude in Unit
	s = A * np.sin(2*np.pi*f*t)  # signal

	#plt.plot(t,s)
	#plt.xlabel('Time ($s$)')
	#plt.ylabel('Amplitude ($Unit$)')

	# do the Discrete Fourier Transform with the FFT
	Y = np.fft.fft(s)
	# if is perfectly mirrored at the half, 
	# let's just take the first half
	N = len(Y)/2+1

	# it is called the amplitude spectrum of the time
	# domain signal and was calculated with Discrete
	# Fourier Transform with the Chuck-Norris-Fast FFT
	#plt.plot(np.abs(Y[:N]))
	
	# real physical values for Amplitude and Frequency
	dt = t[1] - t[0]
	fa = 1.0/dt
	# x-axis: the frequency axis of the FFT
	X = np.linspace(0, fa/2, N, endpoint=True)
	
	# y-axis: the amplitude of the FFT signal
	# in most implementation, the output Y of the FFT
	# is normalized with the number of samples
	plt.plot(X, 2.0*(np.abs(Y[:N]))/N)
	plt.xlabel('Frequency ($Hz$)')
	plt.ylabel('Amplitude ($Unit$)')

	plt.show()

def fft_windowed_signal():
	t = np.linspace(0, 2*np.pi, 1000, endpoint=True)
	f = 3.0 # frequency in Hz
	A = 100.0 # amplitude in Unit
	s = A * np.sin(2*np.pi*f*t)  # signal

	# do the Discrete Fourier Transform with the FFT
	Y = np.fft.fft(s)
	# if is perfectly mirrored at the half, 
	# let's just take the first half
	N = len(Y)/2+1

	# it is called the amplitude spectrum of the time
	# domain signal and was calculated with Discrete
	# Fourier Transform with the Chuck-Norris-Fast FFT
	#plt.plot(np.abs(Y[:N]))
	
	# real physical values for Amplitude and Frequency
	dt = t[1] - t[0]
	fa = 1.0/dt
	# x-axis: the frequency axis of the FFT
	X = np.linspace(0, fa/2, N, endpoint=True)

	# introduce windowing to eliminate the leakage effect
	hann = np.hanning(len(s))
	#hamm = np.hamming(len(s))
	#black = np.blackman(len(s))

	#plt.plot(t, hann*s)
	#plt.xlabel('Time ($s$)')
	#plt.ylabel('Amplitude ($Unit$)')
	#plt.title('Signal with hanning window function applied')
	
	Yhann = np.fft.fft(hann*s)
	plt.figure(figsize=(7,3))
	plt.subplot(121)
	plt.plot(t,s)
	plt.title('Time Domain Signal')
	plt.ylim(np.min(s)*3, np.max(s)*3)
	plt.xlabel('Time ($s$)')
	plt.ylabel('Amplitude ($Unit$)')

	plt.subplot(122)
	plt.plot(X, 2.0*np.abs(Yhann[:N])/N)
	plt.title('Frequency Domain Signal')
	plt.xlabel('Frequency ($Hz$)')
	plt.ylabel('Amplitude ($Unit$)')

	plt.annotate("FFT", 
		xy=(0.0, 0.2), xycoords='axes fraction',
		xytext=(-0.8, 0.2), textcoords='axes fraction',
		size=30, va="center", ha="center",
		arrowprops=dict(arrowstyle="simple",
			connectionstyle="arc3, rad=0.2"))
	plt.tight_layout()
	plt.show()

def sine_fftpack():
	# number of sample points
	N = 600
	# sample spacing
	T = 1.0/800.0
	x = np.linspace(0.0, N*T, N)
	y = np.sin(50.0*2.0*np.pi*x)+0.5*np.sin(80.0*2.0*np.pi*x)
	yf = fft(y)
	xf = np.linspace(0.0, 1.0/(2.0*T), N//2)
	plt.plot(xf, 2.0/N*np.abs(yf[0:N//2]))
	plt.grid()
	plt.show()

def sine_fftpack_windowing():
	# the fft input signal is inherently truncated, this
	# truncation can be modelled as multiplication, which
	# is the cause of spectral leakage. Windowing the signal
	# with a dedicated window function helps mitigate
	# spectral leakage.
	N = 600   # number of sample point
	T = 1.0/800.0   # sample spacing
	x = np.linspace(0.0, N*T, N)
	y = np.sin(50.0*2.0*np.pi*x)+0.5*np.sin(80.0*2.0*np.pi*x)
	yf = fft(y)
	w = blackman(N)
	ywf = fft(y*w)
	xf = np.linspace(0.0, 1.0/(2.0*T), N/2)
	plt.semilogy(xf, 2.0/N*np.abs(yf[0:N//2]))
	plt.semilogy(xf, 2.0/N*np.abs(ywf[0:N//2]))
	plt.legend(['FFT', 'FFT w. window'])
	plt.grid()
	plt.show()

def main():
	#simple_sine_wave()
	#fft_windowed_signal()
	#sine_fftpack()
	sine_fftpack_windowing()

if __name__ == '__main__':
	main()