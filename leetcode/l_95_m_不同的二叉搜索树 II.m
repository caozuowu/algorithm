

/*
    https://leetcode-cn.com/problems/unique-binary-search-trees-ii/solution/
    给定一个整数 n，生成所有由 1 ... n 为节点所组成的 二叉搜索树 
*/

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject
@property (nonatomic, assign) int val;
@property (nonatomic, strong) TreeNode * left;
@property (nonatomic, strong) TreeNode * right;
@end

@implementation TreeNode
@end

NSArray<TreeNode *> * generateTrees(int star, int end) {
    
    if (star > end) {
        TreeNode * node = [[TreeNode alloc] init];
        node.val = -1;
        node.left = node.right = nil;
        return @[node];
    }
    
    NSMutableArray * allTrees = [NSMutableArray arrayWithCapacity:0];
    
    for (int i = star; i <= end; i++) {
        NSArray * leftTreeNodes= generateTrees(star, i-1);
        NSArray * rightTreeNodes = generateTrees(i+1, end);
        for (TreeNode * left in leftTreeNodes) {
            for (TreeNode * right in rightTreeNodes) {
                TreeNode * node = [[TreeNode alloc] init];
                node.val = i;
                node.left = left;
                node.right = right;
                [allTrees addObject:node];
            }
        }
    }
    
    return allTrees;
}