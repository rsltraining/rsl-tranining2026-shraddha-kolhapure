#import "ViewController.h"
#import "MyCustomView.h"

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    MyCustomView *customView = [[MyCustomView alloc] initWithFrame:CGRectMake(20, 80, 320, 500)];

    [self.view addSubview:customView];
}

@end
