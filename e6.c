// compile com
// gcc e6.c wave_header.c -o e6
#include <stdio.h>
#include <stdlib.h>
#include "wave_header.h"

int main(int argc, char** argv){
	HeaderType header;

	if(argc < 2){
		printf("usage: %s <infile>\n", argv[0]);
		return 1;
	}

	FILE* infile = fopen(argv[1], "rb");
	if(infile == NULL){
		perror(argv[1]);
		exit(1);
	}

	fread(&header, sizeof(HeaderType), 1, infile);
	
	print_header(&header);

	return 0;
}
