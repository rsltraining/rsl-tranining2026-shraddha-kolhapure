#import "Professor.h"
#import "Student.h"

@implementation Professor

- (void)updateGradeForStudent:(Student *)student toGrade:(NSString *)newGrade {
    student.grade = newGrade;
    NSLog(@"Professor %@ updated Student %@'s grade to %@", self.name, student.name, newGrade);
}

@end
