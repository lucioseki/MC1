// compile com
// gcc e13.c wave_header.c -o e13
//
// O programa gera dois arquivos com diferentes frequencias de amostragem,
// uma com o dobro, outra com a metade.
// Quando dobro a frequencia de amostragem, eu considero como se duas amostras representassem apenas uma. Logo, o som fica mais alto e a duracao cai pela metade.
// Quando reduzo a freq. de amostragem pela metade, considero que uma amostra representa duas. Logo, o som fica mais grave e a duracao dobra.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "wave_header.h"

int main(int argc, char** argv){
	FILE* infile;
	FILE* outfile;
	char filename[100];
	uint16_t* data;
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
	sprintf(filename, "cima%s", argv[1]);
	outfile = fopen(filename, "wb");
	if(outfile == NULL){
		perror(filename);
		exit(1);
	}

	fread(&header, sizeof(HeaderType), 1, infile);
	nSamples = numSamples(&header);
	bytesPerSample = header.BitsPerSample / 8;
	data = malloc(bytesPerSample * nSamples);
	fread(data, bytesPerSample, nSamples, infile);
	printf("Duracao original: %d\n", duration(&header));

	// aumentando freq. de amostragem
	// o som fica mais agudo
	// e a reproducao fica pausada.
	header.SampleRate *= 2;
	// se corrigir o ByteRate
	// a reproducao fica continua
	// e a duracao cai pela metade
	header.ByteRate *= 2; 
	fwrite(&header, sizeof(HeaderType), 1, outfile);
	fwrite(data, bytesPerSample, nSamples, outfile);
	printf("Duracao alta freq.: %d\n", duration(&header));
	fclose(outfile);

	// arquivo de saida
	// com metade da freq. de amostragem
	// se nao corrigir o ByteRate, o player nao reproduz.
	sprintf(filename, "baixo%s", argv[1]);
	outfile = fopen(filename, "wb");
	if(outfile == NULL){
		perror(filename);
		exit(1);
	}

	rewind(infile);
	fread(&header, sizeof(HeaderType), 1, infile);

	header.SampleRate /= 2;
	// se corrigir o ByteRate
	// o som fica mais grave, e a duracao dobra
	header.ByteRate /= 2;
	fwrite(&header, sizeof(HeaderType), 1, outfile);
	fwrite(data, bytesPerSample, nSamples, outfile);
	printf("Duracao baixa freq.: %d\n", duration(&header));

	free(data);
	fclose(infile);
	fclose(outfile);

	return 0;
}
