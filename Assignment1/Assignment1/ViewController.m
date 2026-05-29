#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.count = 0;
    [self updateUI];
    
    UITapGestureRecognizer *screenTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(screenTapped:)];
    screenTap.delegate = self;
    screenTap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:screenTap];
    
    [self.toggleSwitch setOn:YES animated:NO];
    self.incrementButton.enabled = YES;
    self.opacitySlider.minimumValue = 0.0;
    self.opacitySlider.maximumValue = 1.0;
    self.opacitySlider.value = 1.0;
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    self.imageView.alpha = sender.value;
}

- (IBAction)switchValueChanged:(UISwitch *)sender {
    self.incrementButton.enabled = sender.isOn;
    self.incrementButton.alpha = sender.isOn ? 1.0 : 0.5;
}

- (IBAction)incrementButtonTapped:(UIButton *)sender {
    self.count++;
    [self updateUI];
}

- (IBAction)screenTapped:(UITapGestureRecognizer *)sender {
    self.count--;
    [self updateUI];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (!self.toggleSwitch.isOn) {
        return NO;
    }
    
    if ([touch.view isDescendantOfView:self.incrementButton]) {
        return NO;
    }
    if ([touch.view isKindOfClass:[UISwitch class]]) {
        return NO;
    }
    if ([touch.view isKindOfClass:[UISlider class]]) {
        return NO;
    }
    
    return YES;
}

- (void)updateUI {
    self.countLabel.text = [NSString stringWithFormat:@"Count : %ld", (long)self.count];
    
    if (self.count == 0) {
        self.view.backgroundColor = [UIColor whiteColor];
    } else if (self.count >= 1) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor redColor];
    }
}

@end
