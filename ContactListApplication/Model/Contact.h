//
//  Contact.h
//  ContactListApplication
//
//  Created by Shraddha Kolhapure on 28/05/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Contact : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithName:(NSString *)name phone:(NSString *)phone email:(NSString *)email image:(UIImage *)image;

@end
