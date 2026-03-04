#include <stdio.h>
#include <math.h>

long long modexp(long long base,long long exp,long long mod){
    long long res=1;
    while(exp>0){
        if(exp%2==1) res=(res*base)%mod;
        base=(base*base)%mod;
        exp/=2;
    }
    return res;
}

long long encrypt(long long msg,long long e,long long n){
    return modexp(msg,e,n);
}

long long decrypt(long long cipher,long long d,long long n){
    return modexp(cipher,d,n);
}