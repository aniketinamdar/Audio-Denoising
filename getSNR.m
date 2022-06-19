function SNR = getSNR(clean_file, noisy_file)
clean_audio = audioread(clean_file);
noisy_audio = audioread(noisy_file);
n = min(numel(clean_audio), numel(noisy_audio));
SNR =  20*log10(norm(clean_audio(1:n))/norm(clean_audio(1:n)-noisy_audio(1:n)));
end