//
//  main.cpp
//  c1_1_2
//
//  Created by zuowu on 2018/2/9.
//  Copyright © 2018年 zuowu. All rights reserved.
//

#include <iostream>
/*
 1
 试编写一个模板函数 input ，它要求用户输入一个非负数，并负责验证用户所输入的数是
 否真的大于或等于 0，如果不是，它将告诉用户该输入非法，需要重新输入一个数。在函数非 成功退出之前，应给用户三次机会。如果输入成功，函数应当把所输入的数作为引用参数返回。 输入成功时，函数应返回 true, 否则返回 false 。上机测试该函数。
 */

/*
 * 2.试编写一个模板函数，用来测试数组 a 中的元素是否按升序排列(即 a [ i ]≤a [ i + 1 ] , 其中 0≤ i < n - 1)。
 *   如果不是，函数应返回false,否则应返回true。上机测试该函数。
 */
bool ascending(int arr[], int len){
    for (int i = 0; i < len; i ++){
        if (arr[i+1] && arr[i+1] < arr[i]) {
            return false;
        }
    }
    return true;
}

/*
 * 3.试编写一个非递归函数来计算n!,并上机测试函数的正确性
 */
int factorial(int n){
    int result = 1;
    for (int i = n; i >= 1; i--) {
        result *= i;
    }
    return result;
}

/*
 * 4.1)试编写一个计算斐波那契数列Fn的递归函数,并上机测试其正确性
 *   3) 试编写一个非递归的函数来计算斐波那契数列F,该函数应能直接计算出每个斐波那n契数.上机测试代码的正确性.
 */
int feibolaqie(int n){
    if (n == 1 || n == 2){
        return 1;
    }
    return feibolaqie(n-1) + feibolaqie(n-2);
}
int F(int n){
    int a = 1;
    int b = 1;
    int result = 0;
    if (n == 1 || n == 2){
        return 1;
    }
    for (int i = 3; i <= n; i++) {
        result = a + b;
        b = a;
        a = result;
    }
    return result;
}

/*
 * 5.试编写一个递归函数，用来输出n 个元素的所有子集。例如，三个元素{a, b, c} 的所有
 *   子集是: { }(空集)，{ a }, { b }, { c }, { a , b}, { a , c}, { b , c} 和{ a , b , c}
 */


/*
 * 6.试编写一个递归函数来确定元素 x 是否属于数组 a[ 0 :n - 1 ]
 */

bool F1(int x, int arr[], int n, int index){
    if (index < n && index >= 0) {
        if(arr[index] == x) {
            return true;
        }else {
            return F1(x, arr, n, index + 1);
        }
    }else{
        return false;
    }
}



int main(int argc, const char * argv[]) {

    std::cout <<factorial(10)<<"\n";
    std::cout <<feibolaqie(10)<<"\n";
    return 0;
}





