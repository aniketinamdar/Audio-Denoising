
speech_sparsity = [0 .1 .2 .5 1 10];
noisy_speech    = 'test/hazzyaudio.wav';
noise           = 'test/whitenoise.wav';
clean_speech    = 'test/te.wav';
params.nwin     = 256;
params.noise    = noise;
params.show_log = false;

fprintf('Evaluating speech enhancement on %s\n using several speech sparsity values (lambda_s)...\n', noisy_speech);

outputSNR = zeros(size(speech_sparsity));
for i = 1:numel(speech_sparsity)
    params.speech_sparsity = speech_sparsity(i);
    outputFile = NMFdenoiser(noisy_speech, params);
    outputSNR(i) = getSNR(clean_speech, outputFile);
    fprintf('lambda=%.1f leads to SNR=%.2f dB\n', speech_sparsity(i),outputSNR(i)); 
end