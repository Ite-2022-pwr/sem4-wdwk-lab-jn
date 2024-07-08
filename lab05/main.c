#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>




double test_c_add(int operation_tries, int a, int b){

    int r;
    double time_spent;
    clock_t begin, end;

    time_spent = 0;


        begin = clock();
        for(long int i = 0; i < operation_tries; i++){
		for(int j = 0; j < 4; j++){
			 r = a + b;
		}
           
        }
        end = clock();
        time_spent += (double)(end - begin) * 0.001;
        
    return time_spent;
}

double test_asm_add(int operation_tries, int a, int b, int c, int d){

    int r;
    double time_spent;
    clock_t begin, end;

    time_spent = 0;

        begin = clock();
        for(long int i = 0; i < operation_tries; i++){
            __asm__ ( 
                "movups %0, %%xmm0\n\t"
		"movups %1, %%xmm1\n\t"
		"movups %2, %%xmm2\n\t"
		"movups %3, %%xmm3\n\t"
		"vpunpcklqdq %%xmm0, %%xmm0, %%xmm1\n\t"
		"vpunpcklqdq %%xmm1, %%xmm2, %%xmm3\n\t"
		"addps %%xmm0, %%xmm1"
		: "=m" (r)
                : "m" (a), "m" (b), "m" (c), "m" (d)
		: "xmm0", "xmm1"
                );
        }
        end = clock();
        time_spent += (double)(end - begin) * 0.001;
        
    return time_spent;
}


double test_c_sub(int operation_tries, int a, int b) {
    int r;
    double time_spent;
    clock_t begin, end;

    time_spent = 0;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        for(int j = 0; j < 4; j++){
		 r = a - b;
	}
    }
    end = clock();
    time_spent += (double)(end - begin) * 0.001;

    return time_spent;
}

double test_asm_sub(int operation_tries, int a, int b, int c, int d) {
    int r;
    double time_spent;
    clock_t begin, end;

    time_spent = 0;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
       __asm__ ( 
                "movups %0, %%xmm0\n\t"
		"movups %1, %%xmm1\n\t"
		"movups %2, %%xmm2\n\t"
		"movups %3, %%xmm3\n\t"
		"vpunpcklqdq %%xmm0, %%xmm0, %%xmm1\n\t"
		"vpunpcklqdq %%xmm1, %%xmm2, %%xmm3\n\t"
		"subps %%xmm0, %%xmm1"
		: "=m" (r)
                : "m" (a), "m" (b), "m" (c), "m" (d)
		: "xmm0", "xmm1"
                );
    }
    end = clock();
    time_spent += (double)(end - begin) * 0.001;

    return time_spent;
}
double test_asm_mul(long int operation_tries, int a, int b, int c, int d) {
    int r;
    double time_spent = 0;
    clock_t begin, end;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        
            __asm__ ( 
                "movups %0, %%xmm0\n\t"
		"movups %1, %%xmm1\n\t"
		"movups %2, %%xmm2\n\t"
		"movups %3, %%xmm3\n\t"
		"vpunpcklqdq %%xmm0, %%xmm0, %%xmm1\n\t"
		"vpunpcklqdq %%xmm1, %%xmm2, %%xmm3\n\t"
		"mulps %%xmm0, %%xmm1"
		: "=m" (r)
                : "m" (a), "m" (b), "m" (c), "m" (d)
		: "xmm0", "xmm1"
                );
    }
    end = clock();
    time_spent = (double)(end - begin) * 0.001;

    return time_spent;
}

double test_c_div(long int operation_tries, int a, int b) {
    int r;
    double time_spent = 0;
    clock_t begin, end;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
         for(int j = 0; j < 4; j++){
		 r = a / b;
	}
    }
    end = clock();
    time_spent = (double)(end - begin) * 0.001;

    return time_spent;
}

double test_asm_div(long int operation_tries, int a, int b, int c, int d) {
    int r;
    double time_spent = 0;
    clock_t begin, end;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        __asm__ ( 
                "movups %0, %%xmm0\n\t"
		"movups %1, %%xmm1\n\t"
		"movups %2, %%xmm2\n\t"
		"movups %3, %%xmm3\n\t"
		"vpunpcklqdq %%xmm0, %%xmm0, %%xmm1\n\t"
		"vpunpcklqdq %%xmm1, %%xmm2, %%xmm3\n\t"
		"divps %%xmm0, %%xmm1"
		: "=m" (r)
                : "m" (a), "m" (b), "m" (c), "m" (d)
		: "xmm0", "xmm1"
                );
    }
    end = clock();
    time_spent = (double)(end - begin) * 0.001;

    return time_spent;
}

double test_c_mul(long int operation_tries, int a, int b) {
    int r;
    double time_spent = 0;
    clock_t begin, end;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
         for(int j = 0; j < 4; j++){
		 r = a * b;
	}
    }
    end = clock();
    time_spent = (double)(end - begin) * 0.001;

    return time_spent;
}


int main() {

    printf("\n\n INT ASM ADD TIME \n");
    for(long int j = 10000000; j <= 10000000; j*=10){
        double asm_avg = 0;
        double c_avg = 0;
        for(int i = 0; i < 100; i++){
		c_avg += test_c_add(j,1023, 1232);
            asm_avg += test_asm_add(j, 1023, 1232,654,123);
        }
        asm_avg /= 100;
        c_avg /= 100;
        printf("c: %.6f ms\n", c_avg);
        printf("asm: %.6f ms\n\n", asm_avg);
    }

printf("\n\n INT ASM Subb TIME \n");
    for(long int j = 10000000; j <= 10000000; j*=10){
        double asm_avg = 0;
        double c_avg = 0;
        for(int i = 0; i < 100; i++){
		c_avg += test_c_sub(j,1023, 1232);
            asm_avg += test_asm_sub(j, 1023, 1232,654,123);
        }
        asm_avg /= 100;
        c_avg /= 100;
        printf("c: %.6f ms\n", c_avg);
        printf("asm: %.6f ms\n\n", asm_avg);
    }
printf("\n\n INT ASM mul TIME \n");
    for(long int j = 10000000; j <= 10000000; j*=10){
        double asm_avg = 0;
        double c_avg = 0;
        for(int i = 0; i < 100; i++){
		c_avg += test_c_mul(j,1023, 1232);
            asm_avg += test_asm_mul(j, 1023, 1232,654,123);
        }
        asm_avg /= 100;
        c_avg /= 100;
        printf("c: %.6f ms\n", c_avg);
        printf("asm: %.6f ms\n\n", asm_avg);
    }
printf("\n\n INT ASM div TIME \n");
    for(long int j = 10000000; j <= 10000000; j*=10){
        double asm_avg = 0;
        double c_avg = 0;
        for(int i = 0; i < 100; i++){
		c_avg += test_c_div(j,1023, 1232);
            asm_avg += test_asm_div(j, 1023, 1232,654,123);
        }
        asm_avg /= 100;
        c_avg /= 100;
        printf("c: %.6f ms\n", c_avg);
        printf("asm: %.6f ms\n\n", asm_avg);
    }

}
