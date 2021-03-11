


//dp[i][j]表示将前i件物品装进限重为j的背包可以获得的最大价值, 0<=i<=N, 0<=j<=W
// 不装入第i件物品，即dp[i−1][j]；
// 装入第i件物品（前提是能装下），即dp[i−1][j−w[i]] + v[i]。
// dp[i][j] = max(dp[i−1][j], dp[i−1][j−w[i]]+v[i]) // j >= w[i]

var items = [
    { weight: 1, value: 10},
    { weight: 4, value: 9},
    { weight: 2, value: 5},
    { weight: 5, value: 15}
]

var capacity = 10

var maxValue = function(items, capacity) {

    //dp[i][j]表示将____前i件物品____装进限重为j的背包可以获得的最大价值
    var dp = new Array(items.length+1)
    for (var i = 0; i < items.length+1; i++) {
        dp[i] = new Array(capacity + 1)
        if (i == 0) {
            //表示将前0个物品 装入书包的最大价值为0
            dp[i].fill(0)   
        }
    }

    for (var i = 1; i < dp.length ; i++) {
        var item = items[i-1];
        for (var j = capacity; j >= item.weight /*能装下*/; j--) {
            dp[i][j] = Math.max(dp[i-1][j], dp[i-1][j-item.weight] + item.value)
        }
    }

    console.log(dp)
}

maxValue(items, capacity)