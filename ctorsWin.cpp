#include <iostream>
#define SECNAME ".CRT$XC"
#pragma section(SECNAME,long,read)

void foo(){
  std::cout << "foo" << std::endl;
}

typedef void (__cdecl *_PVFV)();
__declspec(allocate(SECNAME)) _PVFV dummy[]={foo};

int main(){return 0;}