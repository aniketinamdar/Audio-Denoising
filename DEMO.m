%================INPUT FILES====================
noisy_speech    = 'test/hazzyaudio.wav';
noise           = 'test/whitenoise.wav';

%================INPUT PARAMS==================
params.nwin     = 1024;
params.show_log = false;
params.noise    = noise;

%================PROCESSING====================
fprintf('Playing input file %s...\n', noisy_speech);
[noisy_speech_signal,sr] = audioread(noisy_speech);
sound(noisy_speech_signal,sr);

fprintf('Denoising...\n');
output_file = NMFdenoiser(noisy_speech,params);

fprintf('Playing output file %s...\n', output_file);
[denoised_speech_signal,sr] = audioread(output_file);
sound(denoised_speech_signal,sr);