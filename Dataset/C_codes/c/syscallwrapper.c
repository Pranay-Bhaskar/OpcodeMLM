#include <unistd.h>

ssize_t my_write(int fd,const void* buf,size_t count){
    return write(fd,buf,count);
}