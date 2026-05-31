#import <Foundation/Foundation.h>

@interface Person : NSObject
{
NSString *fname;
NSString *lname;
NSInteger age;
}

@property(retain) NSString *fname;
@property(retain) NSString *lname;
@property NSInteger age;

-(id)initData:(NSString *)f :(NSString *)l:(NSInteger)a;
-(void)show;

@end
