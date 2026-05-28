// ContactDelegate.h
#import <UIKit/UIKit.h>
#import "ContactModelProvider.h"

@interface ContactDelegate : NSObject <UITableViewDelegate>

- (instancetype)initWithModelProvider:(ContactModelProvider *)modelProvider
                    selectionCallback:(void (^)(NSIndexPath *indexPath))selectionCallback;

@end
