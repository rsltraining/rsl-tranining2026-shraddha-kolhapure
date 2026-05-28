// ContactDataSource.h
#import <UIKit/UIKit.h>
#import "ContactModelProvider.h"

@interface ContactDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithModelProvider:(ContactModelProvider *)modelProvider;

@end
