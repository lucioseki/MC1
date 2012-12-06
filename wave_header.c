#include <stdio.h>
#include "wave_header.h"

void print_header(HeaderType* h){
	printf("ChunkID: %.4s\n", &(h->ChunkID));
	printf("ChunkSize: %ld\n", h->ChunkSize);
	printf("Format: %.4s\n", &(h->Format));
	printf("Subchunk1ID: %.4s\n", &(h->Subchunk1ID));
	printf("Subchunk1Size: %ld\n", h->Subchunk1Size);
	printf("AudioFormat: %hu\n", h->AudioFormat);
	printf("NumChannels: %hu\n", h->NumChannels);
	printf("SampleRate: %ld\n", h->SampleRate);
	printf("ByteRate: %ld\n", h->ByteRate);
	printf("BlockAlign: %hu\n", h->BlockAlign);
	printf("BitsPerSample: %hu\n", h->BitsPerSample);
	printf("Subchunk2ID: %.4s\n", &(h->Subchunk2ID));
	printf("Subchunk2Size: %d\n", h->Subchunk2Size);
}

int NumSamples(HeaderType* h){
	return h->Subchunk2Size * 8 / h->BitsPerSample;
}

int Time(HeaderType* h){
	return NumSamples(h) / ( h-> SampleRate * h->NumChannels);
}
