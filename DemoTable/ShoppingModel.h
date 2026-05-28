//
//  ShoppingModel.h
//  DemoTable
//
//  Created by Shraddha Kolhapure on 28/05/26.
//


#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface ShoppingModel : NSObject

- (NSInteger)numberOfItems;
- (NSString *)itemAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
