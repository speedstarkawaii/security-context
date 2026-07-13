// mon july 13
// identity.mm

__int64 assetid = 8;
uintptr_t securityctx_currentidentity = 0x1001C5A9D; // can be found @ printidentity function

using identitydef = int64_t(*)(int64_t);
auto GRABIDENTITY = reinterpret_cast<identitydef>(securityctx_currentidentity); // not proper btw u need to rebase 

struct SecurityContext
{
    int identity;    // +0x0
    uint64_t assetid;  // +0x8
};

__int64_t currentidentity(uintptr_t a1){
   char v1; // al
__int64 v2; // rax
  int v3; // r14d
  __int64 v4; // rbx
  
  v2 = GRABIDENTITY(a1);
  v3 = *(uintptr_t *)v2;
  v4 = *(uintptr_t *)(v2 + assetid);
  return v3;
}
