//
//  ViewController.h
//  Assignment1
//
//  Created by Shraddha Kolhapure on 21/05/26.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIButton *incrementButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (weak, nonatomic) IBOutlet UISlider *opacitySlider;

@property (assign, nonatomic) NSInteger count;

- (IBAction)incrementButtonTapped:(UIButton *)sender;
- (IBAction)screenTapped:(UITapGestureRecognizer *)sender;
- (IBAction)switchValueChanged:(UISwitch *)sender;
- (IBAction)sliderValueChanged:(UISlider *)sender;

@end
