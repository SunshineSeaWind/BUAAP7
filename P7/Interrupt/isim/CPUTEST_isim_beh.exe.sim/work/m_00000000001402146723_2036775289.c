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
static const char *ng0 = "D:/Verilog/Interrupt/LData.v";
static unsigned int ng1[] = {32U, 0U};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {24, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {3U, 0U};
static unsigned int ng7[] = {36U, 0U};
static unsigned int ng8[] = {33U, 0U};
static int ng9[] = {16, 0};
static unsigned int ng10[] = {37U, 0U};
static unsigned int ng11[] = {35U, 0U};



static void Cont_34_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3512);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 3416);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Always_35_1(char *t0)
{
    char t4[8];
    char t16[8];
    char t28[8];
    char t29[8];
    char t39[8];
    char t43[8];
    char t52[8];
    char t53[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    int t27;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t40;
    char *t41;
    char *t42;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;

LAB0:    t1 = (t0 + 3096U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 3432);
    *((int *)t2) = 1;
    t3 = (t0 + 3128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(35, ng0);

LAB5:    xsi_set_current_line(36, ng0);
    t5 = (t0 + 1048U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 26);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 26);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 63U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 63U);

LAB6:    t14 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t14, 6);
    if (t15 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng10)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng11)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB15;

LAB16:
LAB18:
LAB17:
LAB19:    goto LAB2;

LAB7:    xsi_set_current_line(37, ng0);

LAB20:    xsi_set_current_line(38, ng0);
    t17 = (t0 + 1208U);
    t18 = *((char **)t17);
    memset(t16, 0, 8);
    t17 = (t16 + 4);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (t20 >> 0);
    *((unsigned int *)t16) = t21;
    t22 = *((unsigned int *)t19);
    t23 = (t22 >> 0);
    *((unsigned int *)t17) = t23;
    t24 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t24 & 3U);
    t25 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t25 & 3U);

LAB21:    t26 = ((char*)((ng2)));
    t27 = xsi_vlog_unsigned_case_compare(t16, 2, t26, 2);
    if (t27 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 2, t2, 2);
    if (t15 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 2, t2, 2);
    if (t15 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 2, t2, 2);
    if (t15 == 1)
        goto LAB28;

LAB29:
LAB31:
LAB30:
LAB32:    goto LAB19;

LAB9:    xsi_set_current_line(55, ng0);

LAB37:    xsi_set_current_line(56, ng0);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    memset(t28, 0, 8);
    t3 = (t28 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t28) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 0);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t12 & 3U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 3U);

LAB38:    t7 = ((char*)((ng2)));
    t27 = xsi_vlog_unsigned_case_compare(t28, 2, t7, 2);
    if (t27 == 1)
        goto LAB39;

LAB40:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t28, 2, t2, 2);
    if (t15 == 1)
        goto LAB41;

LAB42:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t28, 2, t2, 2);
    if (t15 == 1)
        goto LAB43;

LAB44:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t28, 2, t2, 2);
    if (t15 == 1)
        goto LAB45;

LAB46:
LAB48:
LAB47:
LAB49:    goto LAB19;

LAB11:    xsi_set_current_line(73, ng0);

LAB54:    xsi_set_current_line(74, ng0);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    memset(t29, 0, 8);
    t3 = (t29 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 1);
    t10 = (t9 & 1);
    *((unsigned int *)t29) = t10;
    t11 = *((unsigned int *)t6);
    t12 = (t11 >> 1);
    t13 = (t12 & 1);
    *((unsigned int *)t3) = t13;

LAB55:    t7 = ((char*)((ng2)));
    t27 = xsi_vlog_unsigned_case_compare(t29, 1, t7, 1);
    if (t27 == 1)
        goto LAB56;

LAB57:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t29, 1, t2, 1);
    if (t15 == 1)
        goto LAB58;

LAB59:
LAB61:
LAB60:
LAB62:    goto LAB19;

LAB13:    xsi_set_current_line(85, ng0);

LAB65:    xsi_set_current_line(86, ng0);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    memset(t39, 0, 8);
    t3 = (t39 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 1);
    t10 = (t9 & 1);
    *((unsigned int *)t39) = t10;
    t11 = *((unsigned int *)t6);
    t12 = (t11 >> 1);
    t13 = (t12 & 1);
    *((unsigned int *)t3) = t13;

LAB66:    t7 = ((char*)((ng2)));
    t27 = xsi_vlog_unsigned_case_compare(t39, 1, t7, 1);
    if (t27 == 1)
        goto LAB67;

LAB68:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t39, 1, t2, 1);
    if (t15 == 1)
        goto LAB69;

LAB70:
LAB72:
LAB71:
LAB73:    goto LAB19;

LAB15:    xsi_set_current_line(97, ng0);

LAB76:    xsi_set_current_line(98, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t5, 0, 0, 32, 0LL);
    goto LAB19;

LAB22:    xsi_set_current_line(39, ng0);

LAB33:    xsi_set_current_line(40, ng0);
    t30 = (t0 + 1368U);
    t31 = *((char **)t30);
    memset(t29, 0, 8);
    t30 = (t29 + 4);
    t32 = (t31 + 4);
    t33 = *((unsigned int *)t31);
    t34 = (t33 >> 0);
    *((unsigned int *)t29) = t34;
    t35 = *((unsigned int *)t32);
    t36 = (t35 >> 0);
    *((unsigned int *)t30) = t36;
    t37 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t37 & 255U);
    t38 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t38 & 255U);
    t40 = ((char*)((ng3)));
    t41 = (t0 + 1368U);
    t42 = *((char **)t41);
    memset(t43, 0, 8);
    t41 = (t43 + 4);
    t44 = (t42 + 4);
    t45 = *((unsigned int *)t42);
    t46 = (t45 >> 7);
    t47 = (t46 & 1);
    *((unsigned int *)t43) = t47;
    t48 = *((unsigned int *)t44);
    t49 = (t48 >> 7);
    t50 = (t49 & 1);
    *((unsigned int *)t41) = t50;
    xsi_vlog_mul_concat(t39, 24, 1, t40, 1U, t43, 1);
    xsi_vlogtype_concat(t28, 32, 32, 2U, t39, 24, t29, 8);
    t51 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t51, t28, 0, 0, 32, 0LL);
    goto LAB32;

LAB24:    xsi_set_current_line(42, ng0);

LAB34:    xsi_set_current_line(43, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t29, 0, 8);
    t3 = (t29 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 8);
    *((unsigned int *)t29) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 8);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t12 & 255U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 255U);
    t7 = ((char*)((ng3)));
    t14 = (t0 + 1368U);
    t17 = *((char **)t14);
    memset(t43, 0, 8);
    t14 = (t43 + 4);
    t18 = (t17 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 15);
    t22 = (t21 & 1);
    *((unsigned int *)t43) = t22;
    t23 = *((unsigned int *)t18);
    t24 = (t23 >> 15);
    t25 = (t24 & 1);
    *((unsigned int *)t14) = t25;
    xsi_vlog_mul_concat(t39, 24, 1, t7, 1U, t43, 1);
    xsi_vlogtype_concat(t28, 32, 32, 2U, t39, 24, t29, 8);
    t19 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t19, t28, 0, 0, 32, 0LL);
    goto LAB32;

LAB26:    xsi_set_current_line(45, ng0);

LAB35:    xsi_set_current_line(46, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t29, 0, 8);
    t3 = (t29 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 16);
    *((unsigned int *)t29) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 16);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t12 & 255U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 255U);
    t7 = ((char*)((ng3)));
    t14 = (t0 + 1368U);
    t17 = *((char **)t14);
    memset(t43, 0, 8);
    t14 = (t43 + 4);
    t18 = (t17 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 23);
    t22 = (t21 & 1);
    *((unsigned int *)t43) = t22;
    t23 = *((unsigned int *)t18);
    t24 = (t23 >> 23);
    t25 = (t24 & 1);
    *((unsigned int *)t14) = t25;
    xsi_vlog_mul_concat(t39, 24, 1, t7, 1U, t43, 1);
    xsi_vlogtype_concat(t28, 32, 32, 2U, t39, 24, t29, 8);
    t19 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t19, t28, 0, 0, 32, 0LL);
    goto LAB32;

LAB28:    xsi_set_current_line(48, ng0);

LAB36:    xsi_set_current_line(49, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t29, 0, 8);
    t3 = (t29 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 24);
    *((unsigned int *)t29) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 24);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t12 & 255U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 255U);
    t7 = ((char*)((ng3)));
    t14 = (t0 + 1368U);
    t17 = *((char **)t14);
    memset(t43, 0, 8);
    t14 = (t43 + 4);
    t18 = (t17 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 31);
    t22 = (t21 & 1);
    *((unsigned int *)t43) = t22;
    t23 = *((unsigned int *)t18);
    t24 = (t23 >> 31);
    t25 = (t24 & 1);
    *((unsigned int *)t14) = t25;
    xsi_vlog_mul_concat(t39, 24, 1, t7, 1U, t43, 1);
    xsi_vlogtype_concat(t28, 32, 32, 2U, t39, 24, t29, 8);
    t19 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t19, t28, 0, 0, 32, 0LL);
    goto LAB32;

LAB39:    xsi_set_current_line(57, ng0);

LAB50:    xsi_set_current_line(58, ng0);
    t14 = (t0 + 1368U);
    t17 = *((char **)t14);
    memset(t39, 0, 8);
    t14 = (t39 + 4);
    t18 = (t17 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 0);
    *((unsigned int *)t39) = t21;
    t22 = *((unsigned int *)t18);
    t23 = (t22 >> 0);
    *((unsigned int *)t14) = t23;
    t24 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t24 & 255U);
    t25 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t25 & 255U);
    t19 = ((char*)((ng2)));
    xsi_vlogtype_concat(t29, 32, 32, 2U, t19, 24, t39, 8);
    t26 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t26, t29, 0, 0, 32, 0LL);
    goto LAB49;

LAB41:    xsi_set_current_line(60, ng0);

LAB51:    xsi_set_current_line(61, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t39, 0, 8);
    t3 = (t39 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 8);
    *((unsigned int *)t39) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 8);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t12 & 255U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 255U);
    t7 = ((char*)((ng2)));
    xsi_vlogtype_concat(t29, 32, 32, 2U, t7, 24, t39, 8);
    t14 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t14, t29, 0, 0, 32, 0LL);
    goto LAB49;

LAB43:    xsi_set_current_line(63, ng0);

LAB52:    xsi_set_current_line(64, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t39, 0, 8);
    t3 = (t39 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 16);
    *((unsigned int *)t39) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 16);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t12 & 255U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 255U);
    t7 = ((char*)((ng2)));
    xsi_vlogtype_concat(t29, 32, 32, 2U, t7, 24, t39, 8);
    t14 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t14, t29, 0, 0, 32, 0LL);
    goto LAB49;

LAB45:    xsi_set_current_line(66, ng0);

LAB53:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t39, 0, 8);
    t3 = (t39 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 24);
    *((unsigned int *)t39) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 24);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t12 & 255U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 255U);
    t7 = ((char*)((ng2)));
    xsi_vlogtype_concat(t29, 32, 32, 2U, t7, 24, t39, 8);
    t14 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t14, t29, 0, 0, 32, 0LL);
    goto LAB49;

LAB56:    xsi_set_current_line(75, ng0);

LAB63:    xsi_set_current_line(76, ng0);
    t14 = (t0 + 1368U);
    t17 = *((char **)t14);
    memset(t43, 0, 8);
    t14 = (t43 + 4);
    t18 = (t17 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 0);
    *((unsigned int *)t43) = t21;
    t22 = *((unsigned int *)t18);
    t23 = (t22 >> 0);
    *((unsigned int *)t14) = t23;
    t24 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t24 & 65535U);
    t25 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t25 & 65535U);
    t19 = ((char*)((ng9)));
    t26 = (t0 + 1368U);
    t30 = *((char **)t26);
    memset(t53, 0, 8);
    t26 = (t53 + 4);
    t31 = (t30 + 4);
    t33 = *((unsigned int *)t30);
    t34 = (t33 >> 15);
    t35 = (t34 & 1);
    *((unsigned int *)t53) = t35;
    t36 = *((unsigned int *)t31);
    t37 = (t36 >> 15);
    t38 = (t37 & 1);
    *((unsigned int *)t26) = t38;
    xsi_vlog_mul_concat(t52, 16, 1, t19, 1U, t53, 1);
    xsi_vlogtype_concat(t39, 32, 32, 2U, t52, 16, t43, 16);
    t32 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t32, t39, 0, 0, 32, 0LL);
    goto LAB62;

LAB58:    xsi_set_current_line(78, ng0);

LAB64:    xsi_set_current_line(79, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t43, 0, 8);
    t3 = (t43 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 16);
    *((unsigned int *)t43) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 16);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t12 & 65535U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 65535U);
    t7 = ((char*)((ng9)));
    t14 = (t0 + 1368U);
    t17 = *((char **)t14);
    memset(t53, 0, 8);
    t14 = (t53 + 4);
    t18 = (t17 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 31);
    t22 = (t21 & 1);
    *((unsigned int *)t53) = t22;
    t23 = *((unsigned int *)t18);
    t24 = (t23 >> 31);
    t25 = (t24 & 1);
    *((unsigned int *)t14) = t25;
    xsi_vlog_mul_concat(t52, 16, 1, t7, 1U, t53, 1);
    xsi_vlogtype_concat(t39, 32, 32, 2U, t52, 16, t43, 16);
    t19 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t19, t39, 0, 0, 32, 0LL);
    goto LAB62;

LAB67:    xsi_set_current_line(87, ng0);

LAB74:    xsi_set_current_line(88, ng0);
    t14 = (t0 + 1368U);
    t17 = *((char **)t14);
    memset(t52, 0, 8);
    t14 = (t52 + 4);
    t18 = (t17 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 0);
    *((unsigned int *)t52) = t21;
    t22 = *((unsigned int *)t18);
    t23 = (t22 >> 0);
    *((unsigned int *)t14) = t23;
    t24 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t24 & 65535U);
    t25 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t25 & 65535U);
    t19 = ((char*)((ng2)));
    xsi_vlogtype_concat(t43, 32, 32, 2U, t19, 16, t52, 16);
    t26 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t26, t43, 0, 0, 32, 0LL);
    goto LAB73;

LAB69:    xsi_set_current_line(90, ng0);

LAB75:    xsi_set_current_line(91, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t52, 0, 8);
    t3 = (t52 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 16);
    *((unsigned int *)t52) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 16);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t12 & 65535U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 65535U);
    t7 = ((char*)((ng2)));
    xsi_vlogtype_concat(t43, 32, 32, 2U, t7, 16, t52, 16);
    t14 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t14, t43, 0, 0, 32, 0LL);
    goto LAB73;

}


extern void work_m_00000000001402146723_2036775289_init()
{
	static char *pe[] = {(void *)Cont_34_0,(void *)Always_35_1};
	xsi_register_didat("work_m_00000000001402146723_2036775289", "isim/CPUTEST_isim_beh.exe.sim/work/m_00000000001402146723_2036775289.didat");
	xsi_register_executes(pe);
}
