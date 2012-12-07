// compile com
// gcc e17a.c wave_header.c -o e17a
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "wave_header.h"

int main(int argc, char** argv){
	FILE* infile;
	FILE* outfile;
	char filename[100];
	uint16_t *indata, *outdata;
	int nSamples, bytesPerSample;
	HeaderType header;

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

	// arquivo de saida, com o dobro da freq. de amostragem
	sprintf(filename, "ruido%s", argv[1]);
	outfile = fopen(filename, "wb");
	if(outfile == NULL){
		perror(filename);
		exit(1);
	}

	fread(&header, sizeof(HeaderType), 1, infile);
	nSamples = numSamples(&header);
	bytesPerSample = header.BitsPerSample / 8;
	indata = malloc(bytesPerSample * nSamples);
	fread(indata, bytesPerSample, nSamples, infile);

	ruido(&header, indata, &outdata);

	fwrite(&header, sizeof(HeaderType), 1, outfile);
	fwrite(outdata, bytesPerSample, nSamples, outfile);

	free(indata);
	free(outdata);
	fclose(infile);
	fclose(outfile);

	return 0;
}
