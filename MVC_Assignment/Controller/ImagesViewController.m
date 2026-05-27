//
//  ImagesViewController.m
//  MVC_Assignment
//
//  Created by Shraddha Kolhapure on 27/05/26.
//

#import "ImagesViewController.h"
#import "Person.h"

@implementation ImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Gallery";
    
    NSInteger maxImg = MIN(4, self.person.profilePic.count);
    
    for (int i = 0; i < maxImg; i++) {
        int column = i % 2;
        int row = i / 2;
        
        CGFloat x = 20 + (column * 140);
        CGFloat y = 120 + (row * 140);
        
        UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, 120, 120)];
        imgv.image = [UIImage imageNamed:self.person.profilePic[i]];
        imgv.contentMode = UIViewContentModeScaleAspectFill;
        imgv.clipsToBounds = YES;
        imgv.layer.cornerRadius = 8.0;
        
        [self.view addSubview:imgv];
    }
   
    if (self.person.profilePic.count > 4) {
        UILabel *morelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 410, 300, 30)];
        morelabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
        morelabel.textColor = [UIColor darkGrayColor];
        
        unsigned long remainderCount = (unsigned long)(self.person.profilePic.count - 4);
        morelabel.text = [NSString stringWithFormat:@"%lu more profile images", remainderCount];
        
        [self.view addSubview:morelabel];
    }
}

@end

