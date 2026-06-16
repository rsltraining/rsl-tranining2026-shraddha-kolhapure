//
//  Professor.h
//  singleton_DesignPattern
//
//  Created by Shraddha Kolhapure on 26/05/26.
//


#import <Foundation/Foundation.h>
@class Student; // Forward declaration

@interface Professor : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *professorId;
@property (nonatomic, strong) NSString *subject;

- (void)updateGradeForStudent:(Student *)student toGrade:(NSString *)newGrade;

@end
