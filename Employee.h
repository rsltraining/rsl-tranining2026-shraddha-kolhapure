#import <Foundation/Foundation.h>
#import "Person.h"
#import "Organization.h"

@interface Employee : Person
{
NSString *eid;
Organization *org;
}
@property(retain) NSString *eid;
@property(readonly) Organization *org;

-(id)initEmp:(NSString *)f :(NSString *)l :(NSInteger)a :(NSString *)e :(Organization *)o;
-(NSString *)fullName;
-(void)changeOrg:(Organization *)o;
-(void)testNil;

@end
