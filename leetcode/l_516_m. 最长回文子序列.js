

var longestPalindromeSubseq = function(s) {
    
    var length = s.length
    var dp = new Array(length)
    for (var i = 0; i < length; i++) {
        dp[i] = new Array(length)
        dp[i].fill(0)
    }

    // for (var l = 0; l <= length; l++) {
    //     for (var i = 0; i < length-l; i++) {
    //         var j = i+l;
    //         if (l == 0) {
    //             dp[i][j] = 1
    //         }else if (l == 1) {
    //             dp[i][j] = s.charAt(i) == s.charAt(j) ? 2 : 1
    //         }else {
    //             if (s.charAt(i) == s.charAt(j)) {
    //                 dp[i][j] = dp[i+1][j-1] + 2
    //             }
    //             else {
    //                 dp[i][j] = Math.max(dp[i+1][j], dp[i][j-1])
    //             }
    //         }
    //     }
    // }

    for (var i = length-1; i >= 0; i--) {
        dp[i][i] = 1;
        for (var j = i + 1; j < length; j++) {
            if (s.charAt(i) == s.charAt(j)) {
                dp[i][j] = dp[i+1][j-1] + 2
            }else {
                dp[i][j] = Math.max(dp[i+1][j], dp[i][j-1])
            }
        }
    }

    console.log(dp)

    return dp[0][length-1]
};

console.log(longestPalindromeSubseq("abcba"))