clear all;
close all;
clc;

Amp = 1;
freqHz = 1000;
fsHz = 65536;
dt = 1/fsHz;
t = 0:dt:1-dt;
sine = Amp * sin(2*pi*freqHz*t);
subplot(3,2,1);
plot(t,sine);
xlim([0 0.01])
xlabel("time");
ylabel("signal");

N = 65536;
transform = fft(sine,N)/N;
magTransform = abs(transform);

faxis = linspace(-fsHz/2,fsHz/2,N);
subplot(3,2,2);
plot(faxis/1000,fftshift(magTransform));
axis([-40 40 0 0.6])
xlabel('Frequency (KHz)')
ylabel('power of the signal')


square_wave=square(2*pi*freqHz*t);
subplot(3,2,3);
plot(t,square_wave);
xlim([0 0.01])
xlabel("time");
ylabel("square signal");

N = 65536;
transform = fft(square_wave,N)/N;
magTransform = abs(transform);
faxis = linspace(-fsHz/2,fsHz/2,N);
subplot(3,2,4);
plot(faxis/1000,fftshift(magTransform));
axis([-40 40 0 0.6])
xlabel('Frequency (KHz)')
ylabel('power of the signal')

triangle= sawtooth(2*pi*freqHz*t);
subplot(3,2,5);
plot(t,triangle);
xlim([0 0.01])
xlabel("time");
ylabel("triangular signal");

N = 65536;
transform = fft(triangle,N)/N;
magTransform = abs(transform);
faxis = linspace(-fsHz/2,fsHz/2,N);
subplot(3,2,6);
plot(faxis/1000,fftshift(magTransform));
axis([-40 40 0 0.6])
xlabel('Frequency (KHz)')
ylabel('power of the signal')