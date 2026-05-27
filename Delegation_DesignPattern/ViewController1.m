//
//  ViewController1.m
//  Delegation_DesignPattern
//
//  Created by Shraddha Kolhapure on 26/05/26.
//

// ViewController1.m
#import "ViewController1.h"
#import "ViewController2.h"

@interface ViewController1 () <ColorChangeUsingDelegate> // Adopt the protocol
@end

@implementation ViewController1

- (void)viewDidLoad {
   [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *goToVC2Button = [UIButton buttonWithType:UIButtonTypeSystem];
    goToVC2Button.frame = CGRectMake(66, 325, 260, 50);
    [goToVC2Button setTitle:@"Choose Background Color" forState:UIControlStateNormal];
    goToVC2Button.titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    
    [goToVC2Button addTarget:self action:@selector(goToVC2Pressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:goToVC2Button];
}

- (void)goToVC2Pressed:(UIButton *)sender {
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    vc2.delegate = self;
    vc2.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc2 animated:YES completion:nil];
}

#pragma mark - ViewController2Delegate Method
- (void)didSelectColor:(UIColor *)color {
    self.view.backgroundColor = color;
}

@end
