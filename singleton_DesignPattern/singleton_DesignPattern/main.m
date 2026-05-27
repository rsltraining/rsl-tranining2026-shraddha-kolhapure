//
//  main.m
//  singleton_DesignPattern
//
//  Created by Shraddha Kolhapure on 26/05/26.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Student.h"
#import "Professor.h"
#import "College.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        Student *s1= [[Student alloc] init];
        s1.name=@"Shraddha";
        s1.studentId=@"825";
        s1.branch=@"computer science";
        s1.year=4;
        s1.grade=@"A";
        
        Professor *p1=[[Professor alloc] init];
        p1.name=@"XYZ";
        p1.professorId=@"1";
        p1.subject=@"Science";
        
        College *c = [College sharedInstance];
        [c.students addObject:s1];
        [c.professors addObject:p1];

        [s1 viewDetailsForProfessor:p1];
        [p1 updateGradeForStudent:s1 toGrade:@"A+"];
        
        
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
