__declspec(dllexport) double Add(double a, double b) { return a + b; }
__declspec(dllexport) double Sub(double a, double b) { return a - b; }
__declspec(dllexport) double Mul(double a, double b) { return a * b; }
//- cl /LDd Math.c ����dll obj exp lib�ĸ��ļ�
//- cl Math.c /LD /DEF Math.def
//- cl /c TestMath.c
//- link TestMath.obj Math.lib

/* @��������ݷǱ���ģ��Ǻ�������ţ�
  ����������ŵ��뺯�����Ⱥ�������һ��㣬�����Ƽ�
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

//* __cdecl Ĭ�ϣ�__fastcall
//* __stdcall add�����γ�_Add@16 16�Ƕ�ջ��С def��д�����ض��� Add=_Add@16
//* ָ���������� /EXPORT=_Add

//& ��bar.dllԭ���Ļ���ַ0x10000000��foo.dllռ�ã����ض�����ַ���ı�Ĭ�ϻ���ַ0x10010000������ֱ���޸Ļ���ַ��ʡ���ض�����ַ�Ĺ��̣�����Ļ���ַ������64K�ı����� link /BASE:0x10010000,0x10000 /DLL bar.obj
//& ��һ�ַ�������MSVC����(֮ǰΪbind.exe) editbin /REBASE:BASE=0x10020000 bar.dll
//- DLL�󶨣����������浽���������ÿ�ξͲ������½���dll ��dll�ı���ض���ַ�ᱨ��
//- editbin /BIND TestMath.exe
//- dumpbin /IMPORTS TestMath.exe