#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int main(int argc, char const *argv[])
{
	int pixel, width, height, max_level;
	char type[2];
	FILE *inp, *out;

	inp = fopen("lena.pgm", "r");
	out = fopen("output.pgm", "w");
	
	fscanf(inp, "%s", type);	
	
	fscanf(inp, "%d", &width);
	fscanf(inp, "%d", &height);

	fscanf(inp, "%d", &max_level);
	//max_level = (int)ceil(log2(max_level));

	int image[height][width];


	for(int i = 0; i < height; i++)
	{
		for (int j = 0; j < width; j++)
		{
			fscanf(inp, "%d", &image[i][j]);
			
		}		
	}
	fprintf(out, "%s %d %d %d\n", type, width, height, max_level);
	for(int i = 0; i < height; i++) {
		for(int j = 0; j < width; j++)
			fprintf(out, "%d ", abs(max_level - image[i][j]));
		fprintf(out, "\n");
	}


	fclose(inp);
	fclose(out);
	return 0;
}