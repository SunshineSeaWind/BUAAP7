/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Verilog/Interrupt/IM.v";
static const char *ng1 = "code.txt";
static const char *ng2 = "interrupt.txt";
static unsigned int ng3[] = {16768U, 0U};



static void Initial_27_0(char *t0)
{
    char *t1;

LAB0:    xsi_set_current_line(27, ng0);

LAB2:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 1608);
    xsi_vlogfile_readmemh(ng1, 0, t1, 0, 0, 0, 0);
    xsi_set_current_line(29, ng0);
    t1 = (t0 + 1768);
    xsi_vlogfile_readmemh(ng2, 0, t1, 0, 0, 0, 0);

LAB1:    return;
}

static void Cont_31_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t24[8];
    char t31[8];
    char t48[8];
    char t55[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    char *t47;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;
    char *t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    char *t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;

LAB0:    t1 = (t0 + 2936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1048U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB5;

LAB4:    t8 = (t2 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB5;

LAB8:    if (*((unsigned int *)t5) < *((unsigned int *)t2))
        goto LAB6;

LAB7:    memset(t4, 0, 8);
    t10 = (t6 + 4);
    t11 = *((unsigned int *)t10);
    t12 = (~(t11));
    t13 = *((unsigned int *)t6);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t10) != 0)
        goto LAB11;

LAB12:    t17 = (t4 + 4);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t17);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB13;

LAB14:    t41 = *((unsigned int *)t4);
    t42 = (~(t41));
    t43 = *((unsigned int *)t17);
    t44 = (t42 || t43);
    if (t44 > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t17) > 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t4) > 0)
        goto LAB19;

LAB20:    memcpy(t3, t48, 8);

LAB21:    t65 = (t0 + 3336);
    t66 = (t65 + 56U);
    t67 = *((char **)t66);
    t68 = (t67 + 56U);
    t69 = *((char **)t68);
    memcpy(t69, t3, 8);
    xsi_driver_vfirst_trans(t65, 0, 31);
    t70 = (t0 + 3256);
    *((int *)t70) = 1;

LAB1:    return;
LAB5:    t9 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB7;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB7;

LAB9:    *((unsigned int *)t4) = 1;
    goto LAB12;

LAB11:    t16 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB12;

LAB13:    t21 = (t0 + 1608);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t25 = (t0 + 1608);
    t26 = (t25 + 72U);
    t27 = *((char **)t26);
    t28 = (t0 + 1608);
    t29 = (t28 + 64U);
    t30 = *((char **)t29);
    t32 = (t0 + 1048U);
    t33 = *((char **)t32);
    memset(t31, 0, 8);
    t32 = (t31 + 4);
    t34 = (t33 + 4);
    t35 = *((unsigned int *)t33);
    t36 = (t35 >> 2);
    *((unsigned int *)t31) = t36;
    t37 = *((unsigned int *)t34);
    t38 = (t37 >> 2);
    *((unsigned int *)t32) = t38;
    t39 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t39 & 2047U);
    t40 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t40 & 2047U);
    xsi_vlog_generic_get_array_select_value(t24, 32, t23, t27, t30, 2, 1, t31, 11, 2);
    goto LAB14;

LAB15:    t45 = (t0 + 1768);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    t49 = (t0 + 1768);
    t50 = (t49 + 72U);
    t51 = *((char **)t50);
    t52 = (t0 + 1768);
    t53 = (t52 + 64U);
    t54 = *((char **)t53);
    t56 = (t0 + 1048U);
    t57 = *((char **)t56);
    memset(t55, 0, 8);
    t56 = (t55 + 4);
    t58 = (t57 + 4);
    t59 = *((unsigned int *)t57);
    t60 = (t59 >> 2);
    *((unsigned int *)t55) = t60;
    t61 = *((unsigned int *)t58);
    t62 = (t61 >> 2);
    *((unsigned int *)t56) = t62;
    t63 = *((unsigned int *)t55);
    *((unsigned int *)t55) = (t63 & 2047U);
    t64 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t64 & 2047U);
    xsi_vlog_generic_get_array_select_value(t48, 32, t47, t51, t54, 2, 1, t55, 11, 2);
    goto LAB16;

LAB17:    xsi_vlog_unsigned_bit_combine(t3, 32, t24, 32, t48, 32);
    goto LAB21;

LAB19:    memcpy(t3, t24, 8);
    goto LAB21;

}


extern void work_m_00000000002806665974_0467708899_init()
{
	static char *pe[] = {(void *)Initial_27_0,(void *)Cont_31_1};
	xsi_register_didat("work_m_00000000002806665974_0467708899", "isim/CPUTEST_isim_beh.exe.sim/work/m_00000000002806665974_0467708899.didat");
	xsi_register_executes(pe);
}
