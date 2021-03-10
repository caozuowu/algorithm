/*
'A' -> 1
'B' -> 2
...
'Z' -> 26

给你一个只含数字的 非空 字符串 num ，请计算并返回 解码 方法的 总数 。
*/

var numDecodings = function(s) {

    // var s = 'abc'
    // s.charAt()
    var str = s.split('');
    var dp = new Array(s.length)
    dp[0] = (str[0] == '0') ? 0 : 1

    for (var i = 1; i < s.length; i++) {
        
        if (str[i-1] == '1' || str[i-1] == '2' && Number(str[i]) < 7) {
            //如果后两位可以构成一个字母
            if (str[i] == '0') {
                //最后一位为0无法解析为字母 所以长度为0之前的长度
                dp[i] = dp[i-1]
            }else {
                dp[i] = (dp[i-2] || 1) + dp[i-1]
            }
        }else {
            //最后两位无法构成一个字母
            if (str[i] == '0') {
                return 0;
            }else {
                dp[i] = dp[i-1]
            }
        }
    }
    console.log(dp)
};

numDecodings("226")

