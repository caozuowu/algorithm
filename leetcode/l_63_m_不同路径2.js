


var uniquePathsWithObstacles = function(obstacleGrid) {

    var m = obstacleGrid.length;
    var n = obstacleGrid[0].lenghth;
    
    var dp = [];
    for (var i = 0; i < m; i ++) {
        dp[i] = new Array(n)
    }

    console.log(dp)

    for (var i = 0; i < m && obstacleGrid[i][0]; i++) {
        dp[i][0] = 1;
    }

    for (var i = 0; i < n && obstacleGrid[0][i]; i++) {
        dp[0][i] = 1;
    }

    for (var i = 1; i < m; i++) {
        for (var j = 1; j < n; j++) {
            if (obstacleGrid[i][j] == 1) {
                continue;
            }
            dp[i][j] = dp[i-1][j] + dp[i][j-1];
        }
    }

    return dp[m - 1][n - 1];

};