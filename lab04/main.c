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
            r = a + b;
        }
        end = clock();
        time_spent += (double)(end - begin) * 0.001;
        
    return time_spent;
}

double test_asm_add(int operation_tries, int a, int b){

    int r;
    double time_spent;
    clock_t begin, end;

    time_spent = 0;

        begin = clock();
        for(long int i = 0; i < operation_tries; i++){
            __asm__ ( 
                "addl %%ebx, %%eax;"
                : "=a" (r)
                : "a" (a), "b" (b) 
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
        r = a - b;
    }
    end = clock();
    time_spent += (double)(end - begin) * 0.001;

    return time_spent;
}

double test_asm_sub(int operation_tries, int a, int b) {
    int r;
    double time_spent;
    clock_t begin, end;

    time_spent = 0;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        __asm__(
            "subl %%ebx, %%eax;"
            : "=a"(r)
            : "a"(a), "b"(b));
    }
    end = clock();
    time_spent += (double)(end - begin) * 0.001;

    return time_spent;
}
double test_asm_mul(long int operation_tries, int a, int b) {
    int r;
    double time_spent = 0;
    clock_t begin, end;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        __asm__(
            "imull %%ebx, %%eax;"
            : "=a"(r)
            : "a"(a), "b"(b));
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
        r = a / b;
    }
    end = clock();
    time_spent = (double)(end - begin) * 0.001;

    return time_spent;
}

double test_asm_div(long int operation_tries, int a, int b) {
    int r;
    double time_spent = 0;
    clock_t begin, end;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        __asm__(
            "xor %%edx, %%edx;"
            "idivl %%ebx;"
            : "=a"(r)
            : "a"(a), "b"(b));
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
        r = a * b;
    }
    end = clock();
    time_spent = (double)(end - begin) * 0.001;

    return time_spent;
}


double test_c_float_add(int operation_tries, float a, float b) {
    float r;
    double time_spent;
    clock_t begin, end;

    time_spent = 0;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        r = a + b;
    }
    end = clock();
    time_spent += (double)(end - begin) * 0.001;

    return time_spent;
}

double test_asm_float_add(int operation_tries, float a, float b) {
    float r;
    double time_spent;
    clock_t begin, end;

    time_spent = 0;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        __asm__(
            "fld %[a];"
            "fadd %[b];"
            "fstp %[result];"
            : [result] "=m"(r)
            : [a]"m"(a), [b]"m"(b)
            : "st");
    }
    end = clock();
    time_spent += (double)(end - begin) * 0.001;

    return time_spent;
}

double test_c_float_mul(int operation_tries, float a, float b) {
    float r;
    double time_spent;
    clock_t begin, end;

    time_spent = 0;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        r = a * b;
    }
    end = clock();
    time_spent += (double)(end - begin) * 0.001;

    return time_spent;
}

double test_asm_float_mul(int operation_tries, float a, float b) {
    float r;
    double time_spent;
    clock_t begin, end;

    time_spent = 0;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        __asm__(
            "fld %[a];"
            "fmul %[b];"
            "fstp %[result];"
            : [result] "=m"(r)
            : [a]"m"(a), [b]"m"(b)
            : "st");
    }
    end = clock();
    time_spent += (double)(end - begin) * 0.001;

    return time_spent;
}

double test_c_float_div(int operation_tries, float a, float b) {
    float r;
    double time_spent;
    clock_t begin, end;

    time_spent = 0;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        r = a / b;
    }
    end = clock();
    time_spent += (double)(end - begin) * 0.001;

    return time_spent;
}

double test_asm_float_div(int operation_tries, float a, float b) {
    float r;
    double time_spent;
    clock_t begin, end;

    time_spent = 0;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        __asm__(
            "fld %[a];"
            "fdiv %[b];"
            "fstp %[result];"
            : [result] "=m"(r)
            : [a]"m"(a), [b]"m"(b)
            : "st");
    }
    end = clock();
    time_spent += (double)(end - begin) * 0.001;

    return time_spent;
}

double test_c_float_sub(long int operation_tries, float a, float b) {
    float r;
    double time_spent = 0;
    clock_t begin, end;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        r = a - b;
    }
    end = clock();
    time_spent = (double)(end - begin) * 0.001;

    return time_spent;
}

double test_asm_float_sub(long int operation_tries, float a, float b) {
    float r;
    double time_spent = 0;
    clock_t begin, end;

    begin = clock();
    for (long int i = 0; i < operation_tries; i++) {
        __asm__(
            "fld %[a];"
            "fsub %[b];"
            "fstp %[result];"
            : [result] "=m"(r)
            : [a]"m"(a), [b]"m"(b)
            : "st");
    }
    end = clock();
    time_spent = (double)(end - begin) * 0.001;

    return time_spent;
}

int main() {

    printf("\n\n FLOAT ADD TIME \n");
    for(long int j = 1000000; j < 10000000000; j*=10){
        double asm_avg = 0;
        double c_avg = 0;
        for(int i = 0; i < 100; i++){

            float d = (float)rand() / RAND_MAX;
            float c = (float)rand() / RAND_MAX;
            asm_avg += test_asm_float_add(j, d,c);
            c_avg += test_c_float_add(j, d,c);
        }
        asm_avg /= 100;
        c_avg /= 100;
        printf("c: %.6f ms\n", c_avg);
        printf("asm: %.6f ms\n\n", asm_avg);
    }

    printf("\n\n FLOAT SUB TIME \n");
    for(long int j = 1000000; j < 10000000000; j*=10){
        double asm_avg = 0;
        double c_avg = 0;
        for(int i = 0; i < 100; i++){

            float d = (float)rand() / RAND_MAX;
            float c = (float)rand() / RAND_MAX;
            asm_avg += test_asm_float_sub(j, d,c);
            c_avg += test_c_float_sub(j, d,c);
        }
        asm_avg /= 100;
        c_avg /= 100;
        printf("ctime: %.6f ms\n", c_avg);
        printf("int sub asm + c time: %.6f ms\n\n", asm_avg);
    }

    printf("\n\n FLOAT MUL TIME \n");
    for(long int j = 1000000; j < 10000000000; j*=10){
        double asm_avg = 0;
        double c_avg = 0;
        for(int i = 0; i < 100; i++){

            float d = (float)rand() / RAND_MAX;
            float c = (float)rand() / RAND_MAX;
            asm_avg += test_asm_float_mul(j, d,c);
            c_avg += test_c_float_mul(j, d,c);
        }
        asm_avg /= 100;
        c_avg /= 100;
        printf("c: %.6f ms\n", c_avg);
        printf("int sub asm + c: %.6f ms\n\n", asm_avg);
    }

    printf("\n\n FLOAT div TIME \n");
    for(long int j = 1000000; j < 10000000000; j*=10){
        double asm_avg = 0;
        double c_avg = 0;
        for(int i = 0; i < 100; i++){

            float d = (float)rand() / RAND_MAX;
            float c = (float)rand() / RAND_MAX;
            asm_avg += test_asm_float_div(j, d,c);
            c_avg += test_c_float_div(j, d,c);
        }
        asm_avg /= 100;
        c_avg /= 100;
        printf("c: %.6f ms\n", c_avg);
        printf("int sub asm + c: %.6f ms\n\n", asm_avg);
    }

}