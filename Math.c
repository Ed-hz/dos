__declspec(dllexport) double Add(double a, double b) { return a + b; }
__declspec(dllexport) double Sub(double a, double b) { return a - b; }
__declspec(dllexport) double Mul(double a, double b) { return a * b; }
//- cl /LDd Math.c 生成dll obj exp lib四个文件
//- cl Math.c /LD /DEF Math.def
//- cl /c TestMath.c
//- link TestMath.obj Math.lib

/* @后面的内容非必须的，是函数的序号，
  这样就用序号导入函数，比函数名快一点点，但不推荐
  LIBRARY Math
  EXPORTS
  Add @1
  Sub @2
  Mul @3
  Div @4
*/
//- cl /c Math.c
//- link /DLL /DEF:Math.def Math.obj
//-dumpbin /EXPORTS Math.dll

//* __cdecl 默认，__fastcall
//* __stdcall add会修饰成_Add@16 16是堆栈大小 def里写导出重定向 Add=_Add@16
//* 指定导出函数 /EXPORT=_Add

//& 若bar.dll原本的基地址0x10000000被foo.dll占用，会重定基地址到改变默认基地址0x10010000。可以直接修改基地址，省略重定基地址的过程，这里的基地址必须是64K的倍数。 link /BASE:0x10010000,0x10000 /DLL bar.obj
//& 另一种方法是用MSVC工具(之前为bind.exe) editbin /REBASE:BASE=0x10020000 bar.dll
//- DLL绑定，将函数保存到导入表，这样每次就不用重新解析dll 但dll改变或重定基址会报错
//- editbin /BIND TestMath.exe
//- dumpbin /IMPORTS TestMath.exe