// compile com
// gcc e14.c wave_inHeader.c -o e14
//
// O programa le um arquivo de audio de entrada
// e gera 6 outros, decimados por fatores de 2, 4, 8, 16, 32 e 64

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "wave_header.h"

int main(int argc, char** argv){
	FILE* infile;
	FILE* outfile;
	char filename[100];
	uint16_t* indata, *outdata = NULL;
	int nSamples, bytesPerSample, i;
	HeaderType inHeader, outHeader;

	if(argc < 2){
		printf("usage: %s <infile>\n", argv[0]);
		return 1;
	}

	// arquivo de entrada
	infile = fopen(argv[1], "rb");
	if(infile == NULL){
		perror(argv[1]);
		exit(1);
	}

	fread(&inHeader, sizeof(HeaderType), 1, infile);
	nSamples = numSamples(&inHeader);
	bytesPerSample = inHeader.BitsPerSample / 8;
	indata = malloc(bytesPerSample * nSamples);
	fread(indata, bytesPerSample, nSamples, infile);

	// decimacao por fator de 2 a 64
	for(i = 2; i <= 64; i*=2){
		sprintf(filename, "%d%s", i, argv[1]);
		outfile = fopen(filename, "wb");
		if(outfile == NULL){
			perror(filename);
			exit(1);
		}
		
		decimar(&inHeader, &outHeader, indata, &outdata, i);

		fwrite(&outHeader, sizeof(HeaderType), 1, outfile);
		nSamples = numSamples(&outHeader);
		fwrite(outdata, bytesPerSample, nSamples, outfile);
	}

	return 0;
}
