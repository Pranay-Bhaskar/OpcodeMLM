// NOTE: Real AES requires full S-box, MixColumns, etc.
// This is just a stub for educational structure.
#include <stdio.h>

void aes_encrypt_block(unsigned char in[16], unsigned char key[16], unsigned char out[16]){
    for(int i=0;i<16;i++) out[i]=in[i]^key[i]; // XOR only (not real AES!)
}