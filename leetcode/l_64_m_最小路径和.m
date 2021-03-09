
/*
    https://leetcode-cn.com/problems/minimum-path-sum/
    给定一个包含非负整数的 m x n 网格 grid ，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
 */

int minPathSum(int ** grid,int m, int n) {
    
    int mark[m][n];

    for (int i = 0; i < m; i ++) {
        for (int j = 0; j < n; j++) {
            if (i == 0 || j == 0) {
                mark[i][j] = grid[i][j];
            }else {
                mark[i][j] = 0;
            }
        }
    }
    
    for (int i = 1; i < m; i++) {
        for (int j = 1; j < n; j++) {
            mark[i][j] = MIN(mark[i-1][j], mark[i][j-1]) + grid[i][j];
        }
    }
    return mark[m-1][n-1];
}
