#import "ContentViewController.h"

@interface ContentViewController ()

@property UILabel *titleLabel;
@property UIButton *tapButton;
@property UIView *colorBox;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemGray6Color];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"Content View";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.tapButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.tapButton setTitle:@"Tap Here" forState:UIControlStateNormal];
    
    [self.tapButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.colorBox = [[UIView alloc] init];
    self.colorBox.backgroundColor = [UIColor systemBlueColor];
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.tapButton];
    [self.view addSubview:self.colorBox];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    self.titleLabel.frame = CGRectMake(20, 10, width - 40, 30);
    self.tapButton.frame = CGRectMake(20, 50, width - 40, 35);
    
    CGFloat boxHeight = height - 100;
    if (boxHeight < 0) boxHeight = 0;
    self.colorBox.frame = CGRectMake(20, 95, width - 40, boxHeight);
}

// Action method for button tap
- (void)buttonTapped:(UIButton *)sender {
    NSLog(@"Button tapped inside view controller: %@", self);
}

@end
