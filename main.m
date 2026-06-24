#import <Foundation/Foundation.h>
#import "Person.h"
#import "Employee.h"
#import "Organization.h"

int main()
{
NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];
Organization *o1=[[Organization alloc]initOrg:@"RSL":101];
Employee *e1=[[Employee alloc]initEmp:@"Shraddha":@"Kolhapure" :21 :@"EMP101" :o1];
[o1 addEmp:e1];
NSLog(@"Full Name : %@",[e1 fullName]);
[o1 show];
[e1 testNil];

Organization *o2=[[Organization alloc]initOrg:@"Google":102];
[e1 changeOrg:o2];

NSLog(@"Updated Org : %@",o2.orgName);

[pool drain];
return 0;
}
