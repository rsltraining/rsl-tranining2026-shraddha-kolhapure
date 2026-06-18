#import "ThirdViewController.h"

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemGreenColor];
    NSLog(@" 3rd VC - viewDidLoad (Created)");
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, self.view.frame.size.width - 40, 40)];
    titleLabel.text = @"Third View Controller";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:22];
    [self.view addSubview:titleLabel];
    
    // Programmatic Exit Button
    UIButton *dismissBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    dismissBtn.frame = CGRectMake(50, 300, self.view.frame.size.width - 100, 50);
    [dismissBtn setTitle:@"Dismiss Sheet" forState:UIControlStateNormal];
    [dismissBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    dismissBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [dismissBtn addTarget:self action:@selector(closeVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissBtn];
}

- (void)closeVC {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewWillAppear:(BOOL)animated { [super viewWillAppear:animated]; NSLog(@" 3rd VC - viewWillAppear"); }
- (void)viewDidAppear:(BOOL)animated { [super viewDidAppear:animated]; NSLog(@" 3rd VC - viewDidAppear"); }
- (void)viewWillDisappear:(BOOL)animated { [super viewWillDisappear:animated]; NSLog(@" 3rd VC - viewWillDisappear"); }
- (void)viewDidDisappear:(BOOL)animated { [super viewDidDisappear:animated]; NSLog(@" 3rd VC - viewDidDisappear"); }

@end
