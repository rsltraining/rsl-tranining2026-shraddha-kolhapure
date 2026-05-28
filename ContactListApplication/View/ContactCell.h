//
//  ContactCell.h
//  ContactListApplication
//
//  Created by Shraddha Kolhapure on 28/05/26.

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface ContactCell : UITableViewCell

- (void)configureWithContact:(Contact *)contact;

@end
