//
//  VC2.m
//  UINavigation_Assignment
//
//  Created by Shraddha Kolhapure on 25/05/26.
//

#import "VC2.h"

@interface VC2 ()

@end

@implementation VC2

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    [appearance configureWithOpaqueBackground];
    
    appearance.backgroundColor = [UIColor systemRedColor]; // Use systemGreenColor, systemRedColor, etc.
    
    appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}
@end
