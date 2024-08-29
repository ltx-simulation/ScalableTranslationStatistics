#include <unistd.h>

void msleep(unsigned int tms) {
  usleep(tms);
}