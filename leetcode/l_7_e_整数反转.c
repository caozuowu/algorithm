
/*
 * https://leetcode-cn.com/problems/reverse-integer/
 * 给你一个 32 位的有符号整数 x ，返回 x 中每位上的数字反转后的结果。
 */

int reverse(int x){
    int rev = 0;
    while (x != 0) {
        int pop = x % 10;
        x /= 10;
        if (rev > INT_MAX/10 || (rev == INT_MAX / 10 && pop > 7)) return 0;
        if (rev < INT_MIN/10 || (rev == INT_MIN / 10 && pop < -8)) return 0;
        rev = rev * 10 + pop;
    }
    return rev;
}