//
//  ViewController.m
//  MVC_Assignment
//
//  Created by Shraddha Kolhapure on 27/05/26.
//

#import "ViewController.h"
#import "Person.h"
#import "ProfileDetailView.h"
#import "ImagesViewController.h"

@interface ViewController ()
@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) ProfileDetailView *detailView;
@end

@implementation ViewController

- (void)loadView {
    self.detailView = [[ProfileDetailView alloc] init];
    self.view = self.detailView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Profile View";
    
    self.person = [[Person alloc] init];
    self.person.fname = @"Shraddha";
    self.person.lname = @"Kolhapure";
    self.person.age = 22;
    self.person.city = @"Pune";
    self.person.height = 5.5;
    self.person.profilePic = @[@"img1", @"img2", @"img3", @"img1", @"img2", @"img3"];
    self.person.profileViewed = NO;
    
    self.detailView.nameLabel.text = [NSString stringWithFormat:@"Name: %@ %@", self.person.fname, self.person.lname];
    self.detailView.detailsLabel.text = [NSString stringWithFormat:@"Age: %ld | City: %@\nHeight: %.1f ft",
                                         (long)self.person.age, self.person.city, self.person.height];
    self.detailView.profView.image = [UIImage imageNamed:self.person.profilePic.firstObject];
    
    [self.detailView.showButton addTarget:self action:@selector(showImages) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showImages {
    self.person.profileViewed = YES;
    NSLog(@"Profile Viewed status updated to: %@", self.person.profileViewed ? @"TRUE" : @"FALSE");
    
    ImagesViewController *vc = [[ImagesViewController alloc] init];
    vc.person = self.person;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
