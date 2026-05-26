//
//  VC3.m
//  UINavigation_Assignment
//
//  Created by Shraddha Kolhapure on 25/05/26.
//

#import "VC3.h"

@interface VC3 ()

@end

@implementation VC3

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    [appearance configureWithOpaqueBackground];
    
    appearance.backgroundColor = [UIColor systemPurpleColor]; // Use systemGreenColor, systemRedColor, etc.
    
    appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

@end
