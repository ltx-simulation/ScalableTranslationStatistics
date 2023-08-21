#include <unistd.h>

int msleep(unsigned int tms) {
  return usleep(tms * 1000);
}