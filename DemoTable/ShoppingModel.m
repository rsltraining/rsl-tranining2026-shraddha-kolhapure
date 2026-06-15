// ShoppingModel.m
//  DemoTable
//
//  Created by Shraddha Kolhapure on 28/05/26.

#import "ShoppingModel.h"

@interface ShoppingModel ()
@property (nonatomic, strong) NSArray *shoppingList;
@end

@implementation ShoppingModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _shoppingList = @[@"Milk", @"Eggs", @"Noodles", @"Apples", @"Chicken", @"Tea Powder", @"Pasta"];
    }
    return self;
}

- (NSInteger)numberOfItems {
    return self.shoppingList.count;
}

- (NSString *)itemAtIndex:(NSInteger)index {
    return [self.shoppingList objectAtIndex:index];
}

@end
