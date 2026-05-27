//
//  ViewController2.m
//  Delegation_DesignPattern
//
//  Created by Shraddha Kolhapure on 26/05/26.
//


#import "ViewController2.h"

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor]; // Distinct background for VC2
    
    NSArray *colors = @[@"Red", @"Green", @"Blue"];
    
    for (int i = 0; i < colors.count; i++) {
        UIButton *colorButton = [UIButton buttonWithType:UIButtonTypeSystem];
        
        colorButton.frame = CGRectMake(100, 200 + (i * 80), 200, 50);
        
        [colorButton setTitle:colors[i] forState:UIControlStateNormal];
        colorButton.backgroundColor = [UIColor whiteColor];
        colorButton.layer.cornerRadius = 8;
        colorButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
        
        [colorButton addTarget:self action:@selector(selectColorButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:colorButton];
    }
}

- (void)selectColorButtonPressed:(UIButton *)sender {
    UIColor *chosenColor;

    if ([sender.currentTitle isEqualToString:@"Red"]) {
        chosenColor = [UIColor redColor];
    } else if ([sender.currentTitle isEqualToString:@"Green"]) {
        chosenColor = [UIColor greenColor];
    } else {
        chosenColor = [UIColor blueColor];
    }

    if ([self.delegate respondsToSelector:@selector(didSelectColor:)]) {
        [self.delegate didSelectColor:chosenColor];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
