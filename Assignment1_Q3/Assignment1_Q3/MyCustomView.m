//
//  MyCustomView.m
//  Assignment1_Q3
//
//  Created by Shraddha Kolhapure on 22/05/26.
//




#import "MyCustomView.h"

@interface MyCustomView ()

@property UILabel *countLabel;

@property UIButton *incrementButton;

@property UISwitch *toggleSwitch;

@property UISlider *opacitySlider;

@property UIImageView *imageView;

@property NSInteger count;

@end

@implementation MyCustomView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];

    if (self) {

        self.backgroundColor = [UIColor whiteColor];

        self.count = 0;

        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 20, 200, 150)];

        self.imageView.image = [UIImage imageNamed:@"download"];

        self.imageView.contentMode = UIViewContentModeScaleAspectFit;

        [self addSubview:self.imageView];

        self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 190, 200, 40)];

        self.countLabel.textAlignment = NSTextAlignmentCenter;

        self.countLabel.font = [UIFont boldSystemFontOfSize:24];

        [self addSubview:self.countLabel];

        self.incrementButton = [UIButton buttonWithType:UIButtonTypeSystem];

        self.incrementButton.frame = CGRectMake(80, 250, 150, 50);

        [self.incrementButton setTitle:@"Increment" forState:UIControlStateNormal];

        [self.incrementButton addTarget:self action:@selector(incrementButtonTapped) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:self.incrementButton];

        self.toggleSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(120, 320, 0, 0)];

        [self.toggleSwitch setOn:YES];

        [self.toggleSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];

        [self addSubview:self.toggleSwitch];

        self.opacitySlider = [[UISlider alloc] initWithFrame:CGRectMake(40, 380, 220, 40)];

        self.opacitySlider.minimumValue = 0.0;

        self.opacitySlider.maximumValue = 1.0;

        self.opacitySlider.value = 1.0;

        [self.opacitySlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];

        [self addSubview:self.opacitySlider];

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];

        [self addGestureRecognizer:tap];

        [self updateUI];
    }

    return self;
}

- (void)incrementButtonTapped {

    self.count++;

    [self updateUI];
}

- (void)viewTapped:(UITapGestureRecognizer *)sender {

    CGPoint location = [sender locationInView:self];

    if (CGRectContainsPoint(self.incrementButton.frame, location) ||
        CGRectContainsPoint(self.imageView.frame, location) ||
        CGRectContainsPoint(self.countLabel.frame, location) ||
        CGRectContainsPoint(self.toggleSwitch.frame, location) ||
        CGRectContainsPoint(self.opacitySlider.frame, location)) {

        return;
    }

    self.count--;

    [self updateUI];
}

- (void)switchValueChanged:(UISwitch *)sender {

    self.incrementButton.enabled = sender.isOn;

    self.incrementButton.alpha = sender.isOn ? 1.0 : 0.5;
}

- (void)sliderValueChanged:(UISlider *)sender {

    self.imageView.alpha = sender.value;
}

- (void)updateUI {

    self.countLabel.text = [NSString stringWithFormat:@"Count : %ld", (long)self.count];

    if (self.count > 0) {

        self.backgroundColor = [UIColor systemGreenColor];

    } else if (self.count < 0) {

        self.backgroundColor = [UIColor systemRedColor];

    } else {

        self.backgroundColor = [UIColor whiteColor];
    }
}

@end
