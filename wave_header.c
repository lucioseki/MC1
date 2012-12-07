#include <stdio.h>
#include <stdlib.h>
#include "wave_header.h"

void print_header(HeaderType* h){
	printf("ChunkID: %.4s\n", (char*)&(h->ChunkID));
	printf("ChunkSize: %d\n", h->ChunkSize);
	printf("Format: %.4s\n", (char*)&(h->Format));
	printf("Subchunk1ID: %.4s\n", (char*)&(h->Subchunk1ID));
	printf("Subchunk1Size: %d\n", h->Subchunk1Size);
	printf("AudioFormat: %hu\n", h->AudioFormat);
	printf("NumChannels: %hu\n", h->NumChannels);
	printf("SampleRate: %d\n", h->SampleRate);
	printf("ByteRate: %d\n", h->ByteRate);
	printf("BlockAlign: %hu\n", h->BlockAlign);
	printf("BitsPerSample: %hu\n", h->BitsPerSample);
	printf("Subchunk2ID: %.4s\n", (char*)&(h->Subchunk2ID));
	printf("Subchunk2Size: %d\n", h->Subchunk2Size);
}

int numSamples(HeaderType* h){
	return h->Subchunk2Size * 8 / h->BitsPerSample;
}

int duration(HeaderType* h){
	return numSamples(h) / ( h-> SampleRate * h->NumChannels);
}

void decimar(HeaderType* inHeader, HeaderType* outHeader, uint16_t* indata, uint16_t** outdata, int fator){
	int i, j, lim;
	int bytesPerSample = inHeader->BitsPerSample/8;
	int nSamples = numSamples(inHeader);
	*outdata = malloc(bytesPerSample * nSamples / fator);

	// copia e faz as alteracoes necessarias
	*outHeader = *inHeader;
	outHeader->Subchunk2Size /= fator;
	outHeader->ChunkSize = outHeader->Subchunk1Size + outHeader->Subchunk2Size;
	outHeader->SampleRate /= fator;
	outHeader->ByteRate = outHeader->SampleRate * outHeader->NumChannels * bytesPerSample;

	// quantidade de iteracoes para realizar
	lim = inHeader->Subchunk2Size / (bytesPerSample * fator);

	// copia amostras pulando intervalos de fator
	for(i = 0; i < lim; i++){
		for(j = 0; j < inHeader->NumChannels; j++){
			(*outdata)[i+j] = indata[i*fator + j];
		}
	}
}

void ruido(HeaderType* h, uint16_t* indata, uint16_t** outdata){
	int i;
	int bytesPerSample = h->BitsPerSample/8;
	int nSamples = numSamples(h);
	*outdata = malloc(bytesPerSample * nSamples);

	for(i = 0; i < nSamples; i++){
		(*outdata)[i] = indata[i] + rand() % 65535;
	}
}
