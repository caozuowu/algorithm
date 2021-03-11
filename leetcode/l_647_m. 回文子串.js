

//计算有多少个回文子串
var countSubstrings = function(s) {
    var length = s.length
    var dp = new Array(length)
    for (var i = 0; i < length; i++) {
        dp[i] = new Array(length)
        dp[i].fill(false)
    }


    var count = 0;

    for (var l = 0; l <= length; l ++) {
        for (var i = 0; i < length -l; i++) {
            var j = i + l
            // console.log('i = ', i, 'j = ', j)
            if (l == 0) {
                dp[i][j] = true
            }else if (l == 1) {
                dp[i][j] = s.charAt(i) == s.charAt(j)
                if (s.charAt(i) == s.charAt(j)) {
                    count++
                }
            }else {
                dp[i][j] = s.charAt(i) == s.charAt(j) && dp[i+1][j-1]
                if (s.charAt(i) == s.charAt(j) && dp[i+1][j-1]) {
                    count++
                }
            }
        }
    }

    console.log(dp)
    console.log(count)
};

console.log(countSubstrings('aaaa'))