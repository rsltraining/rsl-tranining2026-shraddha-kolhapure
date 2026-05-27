//
//  Student.h
//  singleton_DesignPattern
//
//  Created by Shraddha Kolhapure on 26/05/26.
//

#import <Foundation/Foundation.h>
@class Professor;

@interface Student : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *studentId;
@property (nonatomic, strong) NSString *branch;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, strong) NSString *grade;

- (void)viewDetailsForProfessor:(Professor *)professor;

@end
