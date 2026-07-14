//
//  ProfileDetailView.m
//  MVC_Assignment
//
//  Created by Shraddha Kolhapure on 27/05/26.
//

#import "ProfileDetailView.h"

@implementation ProfileDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 300, 30)];
        _nameLabel.font = [UIFont boldSystemFontOfSize:18];
        [self addSubview:_nameLabel];
        
        _detailsLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 135, 300, 60)];
        _detailsLabel.numberOfLines = 2;
        [self addSubview:_detailsLabel];

        _profView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 210, 120, 120)];
        _profView.contentMode = UIViewContentModeScaleAspectFill;
        _profView.clipsToBounds = YES;
        _profView.layer.cornerRadius = 10.0;
        [self addSubview:_profView];
        
        _showButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _showButton.frame = CGRectMake(20, 360, 200, 44);
        [_showButton setTitle:@"Show Profile Images" forState:UIControlStateNormal];
        [_showButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _showButton.backgroundColor = [UIColor systemBlueColor];
        _showButton.layer.cornerRadius = 8.0;
        [self addSubview:_showButton];
    }
    return self;
}

@end
