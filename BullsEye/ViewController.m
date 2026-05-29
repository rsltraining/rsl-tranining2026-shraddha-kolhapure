#import "ViewController.h"
#import "GameViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GameViewController *gameVC = [[GameViewController alloc] init];
    
    [self addChildViewController:gameVC];
    gameVC.view.frame = self.view.bounds;
    gameVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:gameVC.view];
    
    [NSLayoutConstraint activateConstraints:@[
        [gameVC.view.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [gameVC.view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [gameVC.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [gameVC.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]
    ]];
    
    [gameVC didMoveToParentViewController:self];
}

@end
