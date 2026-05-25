#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    NSLog(@" 1st VC - viewDidLoad (Created)");
    
    // Add a structural label
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 40)];
    titleLabel.text = @"First View Controller";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:22];
    [self.view addSubview:titleLabel];
    
    // Button 1: Triggers Transition Style A
    UIButton *btnOne = [UIButton buttonWithType:UIButtonTypeSystem];
    btnOne.frame = CGRectMake(50, 250, self.view.frame.size.width - 100, 50);
    [btnOne setTitle:@"Open Second VC (Flip Transition)" forState:UIControlStateNormal];
    btnOne.titleLabel.font = [UIFont systemFontOfSize:16];
    [btnOne addTarget:self action:@selector(openSecondScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnOne];
    
    // Button 2: Triggers Transition Style B
    UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeSystem];
    btnTwo.frame = CGRectMake(50, 330, self.view.frame.size.width - 100, 50);
    [btnTwo setTitle:@"Open Third VC (Sheet Presentation)" forState:UIControlStateNormal];
    btnTwo.titleLabel.font = [UIFont systemFontOfSize:16];
    [btnTwo addTarget:self action:@selector(openThirdScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTwo];
}

- (void)openSecondScreen {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    secondVC.modalPresentationStyle = UIModalPresentationFullScreen;
    secondVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:secondVC animated:YES completion:nil];
}

- (void)openThirdScreen {
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    

    thirdVC.modalPresentationStyle = UIModalPresentationPageSheet;
    thirdVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:thirdVC animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated { [super viewWillAppear:animated]; NSLog(@" 1st VC - viewWillAppear"); }
- (void)viewDidAppear:(BOOL)animated { [super viewDidAppear:animated]; NSLog(@" 1st VC - viewDidAppear"); }
- (void)viewWillDisappear:(BOOL)animated { [super viewWillDisappear:animated]; NSLog(@" 1st VC - viewWillDisappear"); }
- (void)viewDidDisappear:(BOOL)animated { [super viewDidDisappear:animated]; NSLog(@" 1st VC - viewDidDisappear"); }

@end
