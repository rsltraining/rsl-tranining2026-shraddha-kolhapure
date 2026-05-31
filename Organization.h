#import <Foundation/Foundation.h>

@interface Organization : NSObject
{
NSString *orgName;
NSInteger orgId;
NSMutableArray *empList;
}

@property(retain) NSString *orgName;
@property NSInteger orgId;
@property(retain) NSMutableArray *empList;

-(id)initOrg:(NSString *)o :(NSInteger)i;
-(void)addEmp:(id)e;
-(void)show;

@end
