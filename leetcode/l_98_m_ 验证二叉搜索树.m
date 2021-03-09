

/*
    https://leetcode-cn.com/problems/validate-binary-search-tree/
    给定一个二叉树，判断其是否是一个有效的二叉搜索树。
*/


#import <Foundation/Foundation.h>

@interface TreeNode : NSObject
@property (nonatomic, assign) int val;
@property (nonatomic, strong) TreeNode * left;
@property (nonatomic, strong) TreeNode * right;
@end

@implementation TreeNode
@end

boolean_t deepSearch(TreeNode * node, int min, int max);
boolean_t deepSearch(TreeNode * node, int min, int max) {
    if (!node) {
        return true;
    }
    if (node.val <= min && node.val >= max) {
        return false;
    }else {
        return deepSearch(node.left, min, node.val) && deepSearch(node.right, node.val, max);
    }
}

boolean_t isValidBST(TreeNode * node) {
    return deepSearch(node, INT_MIN, INT_MAX);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
