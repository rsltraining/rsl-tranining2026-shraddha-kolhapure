#import "ContainerViewController.h"
#import "ContentViewController.h"

@interface ContainerViewController ()

@property UIView *topBox;
@property UIView *middleBox;
@property UIView *bottomBox;

// Keep references to child view controllers so we can adjust their frames in viewDidLayoutSubviews
@property ContentViewController *firstVC;
@property ContentViewController *secondVC;
@property ContentViewController *thirdVC;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.topBox = [[UIView alloc] init];
    self.middleBox = [[UIView alloc] init];
    self.bottomBox = [[UIView alloc] init];
    
    [self.view addSubview:self.topBox];
    [self.view addSubview:self.middleBox];
    [self.view addSubview:self.bottomBox];
    
   
    self.firstVC = [[ContentViewController alloc] init];
    [self addChildViewController:self.firstVC];
    [self.topBox addSubview:self.firstVC.view];
    [self.firstVC didMoveToParentViewController:self];
    
    self.secondVC = [[ContentViewController alloc] init];
    [self addChildViewController:self.secondVC];
    [self.middleBox addSubview:self.secondVC.view];
    [self.secondVC didMoveToParentViewController:self];
    
    self.thirdVC = [[ContentViewController alloc] init];
    [self addChildViewController:self.thirdVC];
    [self.bottomBox addSubview:self.thirdVC.view];
    [self.thirdVC didMoveToParentViewController:self];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height / 3;
    
   
    self.topBox.frame = CGRectMake(0, 0, width, height);
    self.middleBox.frame = CGRectMake(0, height, width, height);
    self.bottomBox.frame = CGRectMake(0, height * 2, width, height);
    
  
    self.firstVC.view.frame = self.topBox.bounds;
    self.secondVC.view.frame = self.middleBox.bounds;
    self.thirdVC.view.frame = self.bottomBox.bounds;
}

@end
