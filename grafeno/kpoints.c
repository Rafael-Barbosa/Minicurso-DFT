#include<stdio.h>

int main (int argc, char **argv)
{
	float x0,y0,z0;
	float x1,y1,z1;
	int nkpoints;
	int i;

	printf("Enter starting point :\n");
	scanf("%f %f %f",&x0,&y0,&z0);
	printf("Enter end point :\n");
	scanf("%f %f %f",&x1,&y1,&z1);
	printf("\nEnter number of kpoints :\n");
	scanf("%d",&nkpoints);
	double spacing1,spacing2,spacing3;
	spacing1 = (x1-x0)/(nkpoints-1);
	spacing2 = (y1-y0)/(nkpoints-1);
	spacing3 = (z1-z0)/(nkpoints-1);

	for(i=0;i<nkpoints;i++)
	   {
	    printf("  %.8f   %.8f   %.8f   1.00000000\n",x0+spacing1*i,y0+spacing2*i,z0+spacing3*i);
	   }
	return 0;
}
