#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@" Storyboard Main Screen (1st VC) - viewDidLoad");
}


- (IBAction)openSecondVC:(id)sender {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    // Transition Style  Flip Horizontal
    secondVC.modalPresentationStyle = UIModalPresentationFullScreen;
    secondVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:secondVC animated:YES completion:nil];
}


- (IBAction)openThirdVC:(id)sender {
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    
    // Transition Style Standard Slide Up
    thirdVC.modalPresentationStyle = UIModalPresentationPageSheet;
    thirdVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:thirdVC animated:YES completion:nil];
}

@end
