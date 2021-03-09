

/*
    https://leetcode-cn.com/problems/unique-paths/
    一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。
    机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。
    问总共有多少条不同的路径？
*/

#import <Foundation/Foundation.h>


int uniquePaths(int m, int n) {
    int mark[m][n];
    for (int i = 0 ; i < m ; i++) {
        mark[i][0] = 1;
    }
    for (int j = 0 ; j < n; j++) {
        mark[0][j] = 1;
    }
    
    for (int i = 1; i < m; i++) {
        for (int j = 1; j < n ; j ++) {
            mark[i][j] = mark[i-1][j] + mark[i][j-1];
        }
    }
    return mark[m-1][n-1];
}

