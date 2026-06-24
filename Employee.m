#import "Employee.h"

@implementation Employee

@synthesize eid,org;

-(id)initEmp:(NSString *)f:(NSString *)l:(NSInteger)a :(NSString *)e :(Organization *)o
{
self=[super initData:f:l:a];
if(self)
{
eid=e;
org=o;
}
return self;
}

-(NSString *)fullName
{
NSString *name;
name=[NSString stringWithFormat:@"%@ %@", fname, lname];
return name;
}

-(void)changeOrg:(Organization *)o
{
org=o;
}
-(void)testNil
{
self.fname=nil;

NSLog(@"After nil : %@",self.fname);
}
@end
