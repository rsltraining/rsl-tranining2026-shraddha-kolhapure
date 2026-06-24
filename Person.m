#import "Person.h"

@implementation Person

@synthesize fname,lname,age;

-(id)initData:(NSString *)f :(NSString *)l :(NSInteger)a
{
self=[super init];
if(self)
{
fname=f;
lname=l;
age=a;
}
return self;
}

-(void)show
{
NSLog(@"First Name : %@",fname);
NSLog(@"Last Name : %@",lname);
NSLog(@"Age : %ld",(long)age);
}

@end
