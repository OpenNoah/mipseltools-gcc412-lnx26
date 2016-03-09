#ifndef _MXU_H_
#define _MXU_H_

#define xr0 0
#define xr1 1
#define xr2 2
#define xr3 3
#define xr4 4
#define xr5 5
#define xr6 6
#define xr7 7
#define xr8 8
#define xr9 9
#define xr10 10
#define xr11 11
#define xr12 12
#define xr13 13
#define xr14 14
#define xr15 15
#define xr16 16

#define ptn0 0
#define ptn1 1
#define ptn2 2
#define ptn3 3


/***********************************LD/SD***********************************/
#define S32LDD(xra,rb,s12)									\
  do { 														\
    __asm__ __volatile ("S32LDD xr%0,%z1,%2"		        \
			: 												\
 	        :"K"(xra),"d" (rb),"I"(s12));					\
  } while (0)
  
#define S32STD(xra,rb,s12)									\
  do { 														\
    __asm__ __volatile ("S32STD xr%0,%z1,%2"		        \
		   : 												\
 	       :"K"(xra),"d" (rb),"I"(s12):"memory");					\
  } while (0)

#define S32LDDV(xra,rb,rc,strd2)							\
  do { 														\
    __asm__ __volatile ("S32LDDV xr%0,%z1,%z2,%3"		    \
		   : 												\
 	       :"K"(xra),"d" (rb),"d"(rc),"K"(strd2));		\
  } while (0)
  
#define S32STDV(xra,rb,rc,strd2)							\
  do { 														\
    __asm__ __volatile ("S32STDV xr%0,%z1,%z2,%3"		    \
		   : 												\
 	       :"K"(xra),"d" (rb),"d"(rc),"K"(strd2):"memory");		\
  } while (0)
  
#define S32LDI(xra,rb,s12)									\
  do { 														\
    __asm__ __volatile ("S32LDI xr%1,%z0,%2"		        \
		   :"+d" (rb)										\
 	       :"K"(xra),"I"(s12));								\
  } while (0)
  
#define S32SDI(xra,rb,s12)									\
  do { 														\
    __asm__ __volatile ("S32SDI xr%1,%z0,%2"		        \
		   :"+d" (rb)				\
 	       :"K"(xra),"I"(s12):"memory");			\
  } while (0)

#define S32LDIV(xra,rb,rc,strd2)							\
  do { 														\
    __asm__ __volatile ("S32LDIV xr%1,%z0,%z2,%3"	        \
		   :"+d" (rb)										\
 	       :"K"(xra),"d"(rc),"K"(strd2));					\
  } while (0)
  
#define S32SDIV(xra,rb,rc,strd2)							\
  do { 														\
    __asm__ __volatile ("S32SDIV xr%1,%z0,%z2,%3"	        \
		   :"+d" (rb)										\
 	       :"K"(xra),"d"(rc),"K"(strd2):"memory");					\
  } while (0)


/***********************************D16MUL***********************************/  
#define D16MUL_WW(xra,xrb,xrc,xrd)                              \
 do { 															\
    __asm__ __volatile ("D16MUL xr%0,xr%1,xr%2,xr%3,WW"         \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
   
#define D16MUL_LW(xra,xrb,xrc,xrd)                              \
 do { 															\
    __asm__ __volatile ("D16MUL xr%0,xr%1,xr%2,xr%3,LW"         \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
  
#define D16MUL_HW(xra,xrb,xrc,xrd)                              \
 do { 															\
    __asm__ __volatile ("D16MUL xr%0,xr%1,xr%2,xr%3,HW"         \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
     
#define D16MUL_XW(xra,xrb,xrc,xrd)                              \
 do { 															\
    __asm__ __volatile ("D16MUL xr%0,xr%1,xr%2,xr%3,XW"         \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 


/**********************************D16MULF*******************************/  
#define D16MULF_WW(xra,xrb,xrc)                                 \
	do { 														\
    __asm__ __volatile ("D16MULF xr%0,xr%1,xr%2,WW"            \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc));                  \
  } while (0)   
 
#define D16MULF_LW(xra,xrb,xrc)                                 \
 do { 															\
    __asm__ __volatile ("D16MULF xr%0,xr%1,xr%2,LW"            \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc));                  \
  } while (0) 
  
#define D16MULF_HW(xra,xrb,xrc)									\
 do { 															\
    __asm__ __volatile ("D16MULF xr%0,xr%1,xr%2,HW"            \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc));                  \
  } while (0) 
     
#define D16MULF_XW(xra,xrb,xrc)                                 \
 do { 															\
    __asm__ __volatile ("D16MULF xr%0,xr%1,xr%2,XW"            \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc));                  \
  } while (0) 


/***********************************D16MAC********************************/
#define D16MAC_AA_WW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,AA,WW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
   
#define D16MAC_AA_LW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,AA,LW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
 
#define D16MAC_AA_HW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,AA,HW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
     
#define D16MAC_AA_XW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,AA,XW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)

#define D16MAC_AS_WW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,AS,WW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
   
#define D16MAC_AS_LW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,AS,LW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
  
#define D16MAC_AS_HW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,AS,HW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
     
#define D16MAC_AS_XW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,AS,XW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)

#define D16MAC_SA_WW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,SA,WW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
   
#define D16MAC_SA_LW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,SA,LW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
  
#define D16MAC_SA_HW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,SA,HW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
     
#define D16MAC_SA_XW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,SA,XW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 

#define D16MAC_SS_WW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,SS,WW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
   
#define D16MAC_SS_LW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,SS,LW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
  
#define D16MAC_SS_HW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,SS,HW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
     
#define D16MAC_SS_XW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("D16MAC xr%0,xr%1,xr%2,xr%3,SS,XW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
  

/**********************************D16MACF*******************************/
#define D16MACF_AA_WW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,AA,WW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
   
#define D16MACF_AA_LW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,AA,LW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
 
#define D16MACF_AA_HW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,AA,HW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)
      
#define D16MACF_AA_XW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,AA,XW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)

#define D16MACF_AS_WW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,AS,WW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)
    
#define D16MACF_AS_LW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,AS,LW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)
   
#define D16MACF_AS_HW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,AS,HW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)
      
#define D16MACF_AS_XW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,AS,XW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)

#define D16MACF_SA_WW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,SA,WW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
   
#define D16MACF_SA_LW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,SA,LW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 

#define D16MACF_SA_HW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,SA,HW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
     
#define D16MACF_SA_XW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,SA,XW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 

#define D16MACF_SS_WW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,SS,WW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
   
#define D16MACF_SS_LW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,SS,LW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
  
#define D16MACF_SS_HW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,SS,HW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
     
#define D16MACF_SS_XW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MACF xr%0,xr%1,xr%2,xr%3,SS,XW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
  

/**********************************D16MADL*******************************/
#define D16MADL_AA_WW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,AA,WW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
 
#define D16MADL_AA_LW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,AA,LW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
 
#define D16MADL_AA_HW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,AA,HW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
     
#define D16MADL_AA_XW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,AA,XW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)

#define D16MADL_AS_WW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,AS,WW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
   
#define D16MADL_AS_LW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,AS,LW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
  
#define D16MADL_AS_HW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,AS,HW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)  
    
#define D16MADL_AS_XW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,AS,XW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)

#define D16MADL_SA_WW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,SA,WW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
   
#define D16MADL_SA_LW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,SA,LW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 

#define D16MADL_SA_HW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,SA,HW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)  
    
#define D16MADL_SA_XW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,SA,XW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 

#define D16MADL_SS_WW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,SS,WW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)
    
#define D16MADL_SS_LW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,SS,LW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
  
#define D16MADL_SS_HW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,SS,HW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)
      
#define D16MADL_SS_XW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("D16MADL xr%0,xr%1,xr%2,xr%3,SS,XW"     \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
  

/***********************************S16MAD*******************************/
#define S16MAD_A_HH(xra,xrb,xrc,xrd)                     \
 do {  															\
    __asm__ __volatile ("S16MAD xr%0,xr%1,xr%2,xr%3,A,0"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));       \
  } while (0) 

#define S16MAD_A_LL(xra,xrb,xrc,xrd)                     \
 do {  															\
    __asm__ __volatile ("S16MAD xr%0,xr%1,xr%2,xr%3,A,1"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));       \
  } while (0) 

#define S16MAD_A_HL(xra,xrb,xrc,xrd)                     \
 do {  															\
    __asm__ __volatile ("S16MAD xr%0,xr%1,xr%2,xr%3,A,2"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));       \
  } while (0) 

#define S16MAD_A_LH(xra,xrb,xrc,xrd)                     \
 do {  															\
    __asm__ __volatile ("S16MAD xr%0,xr%1,xr%2,xr%3,A,3"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));       \
  } while (0) 

#define S16MAD_S_HH(xra,xrb,xrc,xrd)                     \
 do {  															\
    __asm__ __volatile ("S16MAD xr%0,xr%1,xr%2,xr%3,S,0"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));       \
  } while (0) 

#define S16MAD_S_LL(xra,xrb,xrc,xrd)                     \
 do {  															\
    __asm__ __volatile ("S16MAD xr%0,xr%1,xr%2,xr%3,S,1"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));       \
  } while (0) 

#define S16MAD_S_HL(xra,xrb,xrc,xrd)                     \
 do {  															\
    __asm__ __volatile ("S16MAD xr%0,xr%1,xr%2,xr%3,S,2"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));       \
  } while (0) 

#define S16MAD_S_LH(xra,xrb,xrc,xrd)                     \
 do {  															\
    __asm__ __volatile ("S16MAD xr%0,xr%1,xr%2,xr%3,S,3"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));       \
  } while (0) 



/***********************************Q8MUL********************************/
#define Q8MUL(xra,xrb,xrc,xrd)									\
 do { 															\
    __asm__ __volatile ("Q8MUL xr%0,xr%1,xr%2,xr%3"				\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)


/***********************************Q8MAC********************************/
#define Q8MAC_AA(xra,xrb,xrc,xrd)								\
 do { 															\
    __asm__ __volatile ("Q8MAC xr%0,xr%1,xr%2,xr%3,AA"			\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)

#define Q8MAC_AS(xra,xrb,xrc,xrd)							    \
 do { 															\
    __asm__ __volatile ("Q8MAC xr%0,xr%1,xr%2,xr%3,AS"			\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)

#define Q8MAC_SA(xra,xrb,xrc,xrd)							    \
 do { 															\
    __asm__ __volatile ("Q8MAC xr%0,xr%1,xr%2,xr%3,SA"			\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)

#define Q8MAC_SS(xra,xrb,xrc,xrd)						        \
 do { 															\
    __asm__ __volatile ("Q8MAC xr%0,xr%1,xr%2,xr%3,SS"			\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)

/***********************************Q8MADL********************************/
#define Q8MADL_AA(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("Q8MADL xr%0,xr%1,xr%2,xr%3,AA"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)

#define Q8MADL_AS(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("Q8MADL xr%0,xr%1,xr%2,xr%3,AS"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)

#define Q8MADL_SA(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("Q8MADL xr%0,xr%1,xr%2,xr%3,SA"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)

#define Q8MADL_SS(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("Q8MADL xr%0,xr%1,xr%2,xr%3,SS"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)


/***********************************D32ADD********************************/
#define D32ADD_AA(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("D32ADD xr%0,xr%1,xr%2,xr%3,AA"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)

#define D32ADD_AS(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("D32ADD xr%0,xr%1,xr%2,xr%3,AS"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)

#define D32ADD_SA(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("D32ADD xr%0,xr%1,xr%2,xr%3,SA"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)

#define D32ADD_SS(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("D32ADD xr%0,xr%1,xr%2,xr%3,SS"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)


/***********************************D32ACC********************************/
#define D32ACC_AA(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("D32ACC xr%0,xr%1,xr%2,xr%3,AA"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)

#define D32ACC_AS(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("D32ACC xr%0,xr%1,xr%2,xr%3,AS"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)

#define D32ACC_SA(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("D32ACC xr%0,xr%1,xr%2,xr%3,SA"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)

#define D32ACC_SS(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("D32ACC xr%0,xr%1,xr%2,xr%3,SS"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)


/***********************************S32CPS********************************/
#define S32CPS(xra,xrb,xrc)								\
 do { 													\
    __asm__ __volatile ("S32CPS xr%0,xr%1,xr%2"		    \
                 :                                      \
                 :"K"(xra),"K"(xrb),"K"(xrc));          \
  } while (0)

#define S32ABS(xra,xrb)								    \
 do { 													\
    __asm__ __volatile ("S32CPS xr%0,xr%1,xr%2"			\
                 :                                      \
                 :"K"(xra),"K"(xrb),"K"(xrb));          \
  } while (0)

/***********************************Q16ADD********************************/
#define Q16ADD_AA_WW(xra,xrb,xrc,xrd)							\
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,AA,WW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
 
#define Q16ADD_AA_LW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,AA,LW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
 
#define Q16ADD_AA_HW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,AA,HW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)  
    
#define Q16ADD_AA_XW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,AA,XW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)
#define Q16ADD_AS_WW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,AS,WW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
   
#define Q16ADD_AS_LW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,AS,LW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)  
 
#define Q16ADD_AS_HW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,AS,HW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
     
#define Q16ADD_AS_XW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,AS,XW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)

#define Q16ADD_SA_WW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,SA,WW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
   
#define Q16ADD_SA_LW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,SA,LW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 

#define Q16ADD_SA_HW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,SA,HW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
     
#define Q16ADD_SA_XW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,SA,XW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)

#define Q16ADD_SS_WW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,SS,WW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
   
#define Q16ADD_SS_LW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,SS,LW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
  
#define Q16ADD_SS_HW(xra,xrb,xrc,xrd)                          \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,SS,HW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)
      
#define Q16ADD_SS_XW(xra,xrb,xrc,xrd)                           \
 do { 															\
    __asm__ __volatile ("Q16ADD xr%0,xr%1,xr%2,xr%3,SS,XW"      \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
  

/***********************************Q16ACC********************************/
#define Q16ACC_AA(xra,xrb,xrc,xrd)								\
 do { 															\
    __asm__ __volatile ("Q16ACC xr%0,xr%1,xr%2,xr%3,AA"		\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)
  
#define Q16ACC_AS(xra,xrb,xrc,xrd)							    \
 do { 															\
    __asm__ __volatile ("Q16ACC xr%0,xr%1,xr%2,xr%3,AS"		    \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
 
#define Q16ACC_SA(xra,xrb,xrc,xrd)								\
 do { 															\
    __asm__ __volatile ("Q16ACC xr%0,xr%1,xr%2,xr%3,SA"			\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0) 
     
#define Q16ACC_SS(xra,xrb,xrc,xrd)                              \
 do { 															\
    __asm__ __volatile ("Q16ACC xr%0,xr%1,xr%2,xr%3,SS"         \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));         \
  } while (0)


/***********************************D16CPS********************************/
#define D16CPS(xra,xrb,xrc)										\
 do { 															\
    __asm__ __volatile ("D16CPS xr%0,xr%1,xr%2"					\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc));					\
  } while (0)

#define D16ABS(xra,xrb)											\
 do { 															\
    __asm__ __volatile ("D16CPS xr%0,xr%1,xr%2"					\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrb));					\
  } while (0)


/*******************************D16AVG/D16AVGR*****************************/
#define D16AVG(xra,xrb,xrc)									\
 do {                                                           \
    __asm__ __volatile ("D16AVG xr%0,xr%1,xr%2"                 \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc));                  \
  } while (0)
#define D16AVGR(xra,xrb,xrc)									\
 do {                                                           \
    __asm__ __volatile ("D16AVGR xr%0,xr%1,xr%2"                \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc));                  \
  } while (0)

/************************************Q8ADD********************************/
#define Q8ADD_AA(xra,xrb,xrc)								\
	do { 													\
    __asm__ __volatile ("Q8ADD xr%0,xr%1,xr%2,AA"			\
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc));			 	\
  } while (0) 
 
#define Q8ADD_AS(xra,xrb,xrc)								\
 do { 														\
    __asm__ __volatile ("Q8ADD xr%0,xr%1,xr%2,AS"			\
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc));				\
  } while (0) 
 
#define Q8ADD_SA(xra,xrb,xrc)						        \
 do { 														\
    __asm__ __volatile ("Q8ADD xr%0,xr%1,xr%2,SA"			\
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc));			    \
  } while (0) 
     
#define Q8ADD_SS(xra,xrb,xrc)								\
 do { 														\
    __asm__ __volatile ("Q8ADD xr%0,xr%1,xr%2,SS"		    \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc));				\
  } while (0)


/************************************Q8ADDE********************************/
#define Q8ADDE_AA(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("Q8ADDE xr%0,xr%1,xr%2,xr%3,AA"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0) 
 
#define Q8ADDE_AS(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("Q8ADDE xr%0,xr%1,xr%2,xr%3,AS"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0) 
 
#define Q8ADDE_SA(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("Q8ADDE xr%0,xr%1,xr%2,xr%3,SA"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0) 
     
#define Q8ADDE_SS(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("Q8ADDE xr%0,xr%1,xr%2,xr%3,SS"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)

/************************************Q8ACCE********************************/
#define Q8ACCE_AA(xra,xrb,xrc,xrd)						    \
 do { 														\
    __asm__ __volatile ("Q8ACCE xr%0,xr%1,xr%2,xr%3,AA"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0) 
 
#define Q8ACCE_AS(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("Q8ACCE xr%0,xr%1,xr%2,xr%3,AS"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0) 
 
#define Q8ACCE_SA(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("Q8ACCE xr%0,xr%1,xr%2,xr%3,SA"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0) 
     
#define Q8ACCE_SS(xra,xrb,xrc,xrd)                          \
 do { 														\
    __asm__ __volatile ("Q8ACCE xr%0,xr%1,xr%2,xr%3,SS"     \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)


/************************************Q8ABD********************************/
#define Q8ABD(xra,xrb,xrc)									\
 do { 														\
    __asm__ __volatile ("Q8ABD xr%0,xr%1,xr%2"				\
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc));			    \
  } while (0)  


/************************************Q8SLT********************************/
#define Q8SLT(xra,xrb,xrc)									\
 do { 														\
    __asm__ __volatile ("Q8SLT xr%0,xr%1,xr%2"				\
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc));			    \
  } while (0)  


/************************************Q8SAD********************************/
#define Q8SAD(xra,xrb,xrc,xrd)								\
 do { 														\
    __asm__ __volatile ("Q8SAD xr%0,xr%1,xr%2,xr%3"      \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd));     \
  } while (0)

    
/********************************Q8AVG/Q8AVGR*****************************/ 
#define Q8AVG(xra,xrb,xrc)                                \
 do {                                                       \
    __asm__ __volatile ("Q8AVG xr%0,xr%1,xr%2"              \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc));              \
  } while (0) 
#define Q8AVGR(xra,xrb,xrc)                               \
 do {                                                       \
    __asm__ __volatile ("Q8AVGR xr%0,xr%1,xr%2"             \
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc));              \
  } while (0) 
  

/**********************************D32SHIFT******************************/
#define D32SLL(xra,xrb,xrc,xrd,SFT4)								\
	do { 															\
    __asm__ __volatile ("D32SLL xr%0,xr%1,xr%2,xr%3,%4"				\
                 :													\
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd),"K"(SFT4));   \
  } while (0) 

#define D32SLR(xra,xrb,xrc,xrd,SFT4)						        \
 do { 																\
    __asm__ __volatile ("D32SLR xr%0,xr%1,xr%2,xr%3,%4"			    \
                 :												    \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd),"K"(SFT4));   \
  } while (0)

#define D32SAR(xra,xrb,xrc,xrd,SFT4)					            \
 do { 																\
    __asm__ __volatile ("D32SAR xr%0,xr%1,xr%2,xr%3,%4"				\
                 :													\
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd),"K"(SFT4));   \
  } while (0)

#define D32SARL(xra,xrb,xrc,SFT4)			                    \
 do { 																\
    __asm__ __volatile ("D32SARL xr%0,xr%1,xr%2,%3"				    \
                 :												    \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(SFT4));	        \
  } while (0)

#define D32SLLV(xra,xrd,rb)									        \
 do { 																\
    __asm__ __volatile ("D32SLLV xr%0,xr%1,%z2"					    \
                 :												    \
                 :"K"(xra),"K"(xrd),"d"(rb));					    \
  } while (0) 

#define D32SLRV(xra,xrd,rb)										    \
 do { 																\
    __asm__ __volatile ("D32SLRV xr%0,xr%1,%z2"					    \
                 :												    \
                 :"K"(xra),"K"(xrd),"d"(rb));					    \
  } while (0)

#define D32SARV(xra,xrd,rb)										    \
 do { 																\
    __asm__ __volatile ("D32SARV xr%0,xr%1,%z2"					    \
                 :												    \
                 :"K"(xra),"K"(xrd),"d"(rb));					    \
  } while (0)

#define D32SARW(xra,xrb,xrc,rb)					                    \
 do { 																\
    __asm__ __volatile ("D32SARW xr%0,xr%1,xr%2,%3"				    \
                 :												    \
                 :"K"(xra),"K"(xrb),"K"(xrc),"d"(rb));			    \
  } while (0)


/**********************************Q16SHIFT******************************/
#define Q16SLL(xra,xrb,xrc,xrd,SFT4)									 \
	do { 																 \
    __asm__ __volatile ("Q16SLL xr%0,xr%1,xr%2,xr%3,%4"					 \
                 :														 \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd),"K"(SFT4));		 \
  } while (0) 

#define Q16SLR(xra,xrb,xrc,xrd,SFT4)									 \
	do { 																 \
    __asm__ __volatile ("Q16SLR xr%0,xr%1,xr%2,xr%3,%4"					 \
                 :													     \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd),"K"(SFT4));        \
  } while (0)

#define Q16SAR(xra,xrb,xrc,xrd,SFT4)									 \
	do { 																 \
    __asm__ __volatile ("Q16SAR xr%0,xr%1,xr%2,xr%3,%4"				     \
                 :														 \
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd),"K"(SFT4));        \
  } while (0)

#define Q16SLLV(xra,xrd,rb)										         \
	do { 																 \
    __asm__ __volatile ("Q16SLLV xr%0,xr%1,%z2"						     \
                 :													     \
                 :"K"(xra),"K"(xrd),"d"(rb));							 \
  } while (0) 

#define Q16SLRV(xra,xrd,rb)										         \
	do { 																 \
    __asm__ __volatile ("Q16SLRV xr%0,xr%1,%z2"						     \
                 :													     \
                 :"K"(xra),"K"(xrd),"d"(rb));						     \
  } while (0)

#define Q16SARV(xra,xrd,rb)											     \
	do { 																 \
    __asm__ __volatile ("Q16SARV xr%0,xr%1,%z2"						     \
                 :												         \
                 :"K"(xra),"K"(xrd),"d"(rb));						     \
  } while (0)


/*********************************MAX/MIN*********************************/ 
#define S32MAX(xra,xrb,xrc)										\
 do { 															\
    __asm__ __volatile ("S32MAX xr%0,xr%1,xr%2"					\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc));                  \
  } while (0)

#define S32MIN(xra,xrb,xrc)										\
 do { 															\
    __asm__ __volatile ("S32MIN xr%0,xr%1,xr%2"					\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc));                  \
  } while (0)

#define D16MAX(xra,xrb,xrc)										\
 do { 															\
    __asm__ __volatile ("D16MAX xr%0,xr%1,xr%2"					\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc));                  \
  } while (0)

#define D16MIN(xra,xrb,xrc)										\
 do { 															\
    __asm__ __volatile ("D16MIN xr%0,xr%1,xr%2"					\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc));                  \
  } while (0)

#define Q8MAX(xra,xrb,xrc)										\
 do { 															\
    __asm__ __volatile ("Q8MAX xr%0,xr%1,xr%2"					\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc));                  \
  } while (0)

#define Q8MIN(xra,xrb,xrc)										\
 do { 															\
    __asm__ __volatile ("Q8MIN xr%0,xr%1,xr%2"					\
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc));                  \
  } while (0)
       
                                
/*************************************MOVE********************************/ 
#define S32I2M(xra,rb)							\
  do { 											\
    __asm__ __volatile ("S32I2M xr%0,%z1"		\
		   :								    \
 	       :"K"(xra),"d"(rb));					\
  } while (0)
 
#define S32M2I(xra)								\
__extension__ ({								\
  int  __d;										\
  __asm__ __volatile ("S32M2I xr%1, %0" 		    \
	   :"=d"(__d)								\
 	   :"K"(xra));                              \
  __d; 											\
})  


/*********************************S32SFL**********************************/ 
#define S32SFL(xra,xrb,xrc,xrd,optn2)								\
	do { 															\
    __asm__ __volatile ("S32SFL xr%0,xr%1,xr%2,xr%3,ptn%4"			\
                 :													\
                 :"K"(xra),"K"(xrb),"K"(xrc),"K"(xrd),"K"(optn2));	\
  } while (0)
  

/*********************************S32ALN**********************************/ 
#define S32ALN(xra,xrb,xrc,rs)								    \
 do { 															\
    __asm__ __volatile ("S32ALN xr%0,xr%1,xr%2,%z3"			    \
                 :                                              \
                 :"K"(xra),"K"(xrb),"K"(xrc),"d"(rs));			\
  } while (0)
 

/*********************************Q16SAT**********************************/ 
#define Q16SAT(xra,xrb,xrc)									\
 do { 														\
    __asm__ __volatile ("Q16SAT xr%0,xr%1,xr%2"				\
                 :                                          \
                 :"K"(xra),"K"(xrb),"K"(xrc));				\
  } while (0)
  

#endif



