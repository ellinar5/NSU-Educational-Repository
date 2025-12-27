#include <stdio.h>
#include <string.h> 

int main() {
    int x, y, z;
    printf("Enter x,y and z:\n");
    scanf_s ("%d %d %d", &x, &y, &z);
    int size = 0;
    
    if (x <= 0 || y <= 0 || z <= 0)
    {
        if (x <= 0)
        {
            size = 1;
        }
        else if (y <= 0)
        {
            size = 2;
        }
        else if (z <= 0)
        {
            size = 3;
        }
    }

    if(x<100 || y<100 || z<100)
    {
        if (x > 0 && y > 0 && z > 0)
        {
            int s = 2 * (x * y + x * z + y * z);
            printf("Surface area of ​​a parallelepiped: %d", s);
        }
        else
        {
            printf("Invalid input data: -%d", size);
        }
        
    }

    return 0;
}

        

  
