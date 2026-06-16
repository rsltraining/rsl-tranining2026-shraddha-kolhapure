//
//  Student.m
//  singleton_DesignPattern
//
//  Created by Shraddha Kolhapure on 26/05/26.
//

#import "Student.h"
#import "Professor.h"

@implementation Student

- (void)viewDetailsForProfessor:(Professor *)professor {
    NSLog(@"- Student viewing Professor Details -");
    NSLog(@"Student %@ is looking up their professor.", self.name);
    NSLog(@"Professor Name: %@", professor.name);
    NSLog(@"Department/Subject: %@", professor.subject);
    NSLog(@"Professor ID: %@", professor.professorId);
}

@end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

