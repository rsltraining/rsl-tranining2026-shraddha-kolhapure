#import "VC1.h"

@implementation VC1


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    [appearance configureWithOpaqueBackground];
    
    appearance.backgroundColor = [UIColor systemBlueColor]; // Use systemGreenColor, systemRedColor, etc.
    
    appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

@end
