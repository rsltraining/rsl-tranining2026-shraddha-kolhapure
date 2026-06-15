// ContactCell.m
#import "ContactCell.h"

@implementation ContactCell

- (void)configureWithContact:(Contact *)contact {
    UIListContentConfiguration *content = [self defaultContentConfiguration];
    content.text = contact.name;
    content.image = contact.image;
    
    content.imageProperties.maximumSize = CGSizeMake(40, 40);
    content.imageProperties.tintColor = [UIColor systemBlueColor];
    
    self.contentConfiguration = content;
}

@end
