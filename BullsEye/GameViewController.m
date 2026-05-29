#import "GameViewController.h"

@interface GameViewController ()

@property UILabel *targetLabel;
@property UILabel *scoreLabel;
@property UILabel *roundLabel;
@property UISlider *slider;
@property UIButton *hitButton;
@property UIButton *startOverButton;
@property UIButton *infoButton;
@property int targetValue;
@property int totalScore;
@property int round;
@property NSMutableArray *roundScores;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.roundScores = [[NSMutableArray alloc] init];
    self.totalScore = 0;
    self.round = 0;

    self.targetLabel = [[UILabel alloc] init];
    self.targetLabel.textAlignment = NSTextAlignmentCenter;
    self.targetLabel.font = [UIFont systemFontOfSize:18.0];
    
    self.scoreLabel = [[UILabel alloc] init];
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    self.scoreLabel.font = [UIFont systemFontOfSize:18.0];
    
    self.roundLabel = [[UILabel alloc] init];
    self.roundLabel.textAlignment = NSTextAlignmentCenter;
    self.roundLabel.font = [UIFont systemFontOfSize:18.0];

    self.slider = [[UISlider alloc] init];
    self.slider.minimumValue = 1;
    self.slider.maximumValue = 100;

    self.hitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.hitButton setTitle:@"Hit Me" forState:UIControlStateNormal];
    self.hitButton.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
    [self.hitButton addTarget:self action:@selector(hitMeButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    self.startOverButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.startOverButton setTitle:@"Start Over" forState:UIControlStateNormal];
    [self.startOverButton addTarget:self action:@selector(startOverButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    self.infoButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.infoButton setTitle:@"Info" forState:UIControlStateNormal];
    [self.infoButton addTarget:self action:@selector(infoButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    self.targetLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.scoreLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.roundLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.slider.translatesAutoresizingMaskIntoConstraints = NO;
    self.hitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.startOverButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.infoButton.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:self.targetLabel];
    [self.view addSubview:self.scoreLabel];
    [self.view addSubview:self.roundLabel];
    [self.view addSubview:self.slider];
    [self.view addSubview:self.hitButton];
    [self.view addSubview:self.startOverButton];
    [self.view addSubview:self.infoButton];

    [NSLayoutConstraint activateConstraints:@[
        [self.targetLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:40.0],
        [self.targetLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20.0],
        [self.targetLabel.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20.0],
        
        [self.scoreLabel.topAnchor constraintEqualToAnchor:self.targetLabel.bottomAnchor constant:15.0],
        [self.scoreLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20.0],
        [self.scoreLabel.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20.0],
        
        [self.roundLabel.topAnchor constraintEqualToAnchor:self.scoreLabel.bottomAnchor constant:15.0],
        [self.roundLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20.0],
        [self.roundLabel.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20.0],
        
        [self.slider.topAnchor constraintEqualToAnchor:self.roundLabel.bottomAnchor constant:50.0],
        [self.slider.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:40.0],
        [self.slider.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-40.0],

        [self.hitButton.topAnchor constraintEqualToAnchor:self.slider.bottomAnchor constant:40.0],
        [self.hitButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.hitButton.widthAnchor constraintEqualToConstant:140.0],
        [self.hitButton.heightAnchor constraintEqualToConstant:44.0],

        [self.startOverButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-40.0],
        [self.startOverButton.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:40.0],
        [self.startOverButton.widthAnchor constraintEqualToConstant:120.0],
        [self.startOverButton.heightAnchor constraintEqualToConstant:40.0],
        
        [self.infoButton.topAnchor constraintEqualToAnchor:self.startOverButton.topAnchor],
        [self.infoButton.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-40.0],
        [self.infoButton.widthAnchor constraintEqualToConstant:120.0],
        [self.infoButton.heightAnchor constraintEqualToConstant:40.0]
    ]];

    [self startNewRound];
}

- (void)startNewRound {
    self.targetValue = arc4random_uniform(100) + 1;
    self.targetLabel.text = [NSString stringWithFormat:@"Target : %d", self.targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.totalScore];
    self.roundLabel.text = [NSString stringWithFormat:@"Round : %d", self.round];
}

- (void)hitMeButtonTapped {
    int sliderValue = (int)self.slider.value;
    int difference = abs(self.targetValue - sliderValue);
    int points = 100 - difference;

    self.totalScore += points;
    self.round++;

    NSString *roundText = [NSString stringWithFormat:@"Round %d : %d points", self.round, points];
    [self.roundScores addObject:roundText];

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Result" message:roundText preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];

    [self presentViewController:alert animated:YES completion:nil];
    [self startNewRound];
}

- (void)startOverButtonTapped {
    self.totalScore = 0;
    self.round = 0;
    [self.roundScores removeAllObjects];
    [self startNewRound];
}

- (void)infoButtonTapped {
    NSString *message = [self.roundScores componentsJoinedByString:@"\n"];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Round Scores" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];

    [self presentViewController:alert animated:YES completion:nil];
}

@end
