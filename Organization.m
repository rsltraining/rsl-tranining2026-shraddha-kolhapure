#import "Organization.h"

@implementation Organization

@synthesize orgName,orgId,empList;

-(id)initOrg:(NSString *)o :(NSInteger)i
{
self=[super init];

if(self)
{
orgName=o;
orgId=i;
empList=[[NSMutableArray alloc]init];
}
return self;
}

-(void)addEmp:(id)e
{
[empList addObject:e];
}
-(void)show
{
NSLog(@"Organization Name : %@",orgName);
NSLog(@"Organization Id : %ld",(long)orgId);
NSLog(@"Employee List : %@",empList);
}
@end
