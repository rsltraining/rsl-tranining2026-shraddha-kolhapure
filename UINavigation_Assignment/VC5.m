//
//  VC5.m
//  UINavigation_Assignment
//
//  Created by Shraddha Kolhapure on 25/05/26.
//

#import "VC5.h"

@interface VC5 ()

@end

@implementation VC5

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    [appearance configureWithOpaqueBackground];
    
    appearance.backgroundColor = [UIColor systemGrayColor];
    
    appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Home"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(goToV1:)];
       self.navigationItem.leftBarButtonItem = leftButton;
       UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                    target:self
                                                                                    action:@selector(doneButtonTapped:)];
       self.navigationItem.rightBarButtonItem = rightButton;
}
- (void)doneButtonTapped:(id)sender {
    NSLog(@"Right bar button tapped!");
}

- (IBAction)goToV4:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)goToV3:(id)sender {
    UIViewController *vc=[self.navigationController.viewControllers objectAtIndex:2];
    [self.navigationController popToViewController:vc animated:YES];
}

- (IBAction)goToV1:(id)sender {
    [self.navigationController popToRootViewControllerAnimated: YES];
}
@end
