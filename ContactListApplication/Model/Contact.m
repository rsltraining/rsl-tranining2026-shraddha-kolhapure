//
//  Contact.m
//  ContactListApplication
//
//  Created by Shraddha Kolhapure on 28/05/26.
//

#import "Contact.h"

@implementation Contact

- (instancetype)initWithName:(NSString *)name phone:(NSString *)phone email:(NSString *)email image:(UIImage *)image {
    self = [super init];
    if (self) {
        _name = name;
        _phone = phone;
        _email = email;
        _image = image;
    }
    return self;
}

@end
