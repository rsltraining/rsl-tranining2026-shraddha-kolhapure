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

    self.targetLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 100, 250, 40)];

    [self.view addSubview:self.targetLabel];

    self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 150, 250, 40)];

    [self.view addSubview:self.scoreLabel];

    self.roundLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 200, 250, 40)];

    [self.view addSubview:self.roundLabel];

    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(40, 280, 300, 40)];

    self.slider.minimumValue = 1;

    self.slider.maximumValue = 100;

    [self.view addSubview:self.slider];

    self.hitButton = [UIButton buttonWithType:UIButtonTypeSystem];

    self.hitButton.frame = CGRectMake(120, 350, 120, 40);

    [self.hitButton setTitle:@"Hit Me" forState:UIControlStateNormal];

    [self.hitButton addTarget:self action:@selector(hitMeButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.hitButton];

    self.startOverButton = [UIButton buttonWithType:UIButtonTypeSystem];

    self.startOverButton.frame = CGRectMake(40, 430, 120, 40);

    [self.startOverButton setTitle:@"Start Over" forState:UIControlStateNormal];

    [self.startOverButton addTarget:self action:@selector(startOverButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.startOverButton];

    self.infoButton = [UIButton buttonWithType:UIButtonTypeSystem];

    self.infoButton.frame = CGRectMake(220, 430, 120, 40);

    [self.infoButton setTitle:@"Info" forState:UIControlStateNormal];

    [self.infoButton addTarget:self action:@selector(infoButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.infoButton];

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
