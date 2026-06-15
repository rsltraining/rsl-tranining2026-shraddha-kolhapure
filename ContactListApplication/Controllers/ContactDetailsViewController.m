// ContactDetailsViewController.m
#import "ContactDetailsViewController.h"

@interface ContactDetailsViewController ()
@property (nonatomic, strong) Contact *contact;
@end

@implementation ContactDetailsViewController

- (instancetype)initWithContact:(Contact *)contact {
    self = [super init];
    if (self) {
        _contact = contact;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Details";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.contact.image];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = [NSString stringWithFormat:@"Name: %@", self.contact.name];
    nameLabel.font = [UIFont boldSystemFontOfSize:20];
    
    UILabel *phoneLabel = [[UILabel alloc] init];
    phoneLabel.text = [NSString stringWithFormat:@"Phone: %@", self.contact.phone];
    phoneLabel.font = [UIFont systemFontOfSize:16];
    
    UILabel *emailLabel = [[UILabel alloc] init];
    emailLabel.text = [NSString stringWithFormat:@"Email: %@", self.contact.email];
    emailLabel.font = [UIFont systemFontOfSize:16];
    

    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[imageView, nameLabel, phoneLabel, emailLabel]];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionEqualSpacing;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 15;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:stackView];
    
    [NSLayoutConstraint activateConstraints:@[
        [imageView.widthAnchor constraintEqualToConstant:100],
        [imageView.heightAnchor constraintEqualToConstant:100],
        [stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
    ]];
}

@end
