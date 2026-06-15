//
//  ContactModelProvider.m
//  ContactListApplication
//
//  Created by Shraddha Kolhapure on 28/05/26.
//

#import "ContactModelProvider.h"

@interface ContactModelProvider ()
@property (nonatomic, strong) NSArray<Contact *> *contacts;
@end

@implementation ContactModelProvider

- (instancetype)init {
    self = [super init];
    if (self) {
       
        _contacts = @[
            [[Contact alloc] initWithName:@"Akshat Kolhapure"
                                    phone:@"123-456"
                                   email:@"akshatk@gmail.com"
                                   image:[UIImage imageNamed:@"prof1"]],
            
            [[Contact alloc] initWithName:@"Jayant k"
                                    phone:@"512-342"
                                   email:@"jayantk@gmail.com"
                                   image:[UIImage imageNamed:@"prof2"]],
            
            [[Contact alloc] initWithName:@"krish s"
                                    phone:@"903-0199"
                                   email:@"krish@gmail.com"
                                   image:[UIImage imageNamed:@"prof3"]],
            
            [[Contact alloc] initWithName:@"sayli attarde"
                                    phone:@"87530-0175"
                                   email:@"sayli@gmail.com"
                                   image:[UIImage imageNamed:@"prof1"]],
            
            [[Contact alloc] initWithName:@"rasika dehade"
                                    phone:@"80800-0115"
                                   email:@"rasika@gmail.com"
                                   image:[UIImage imageNamed:@"prof2"]]
        ];
    }
    return self;
}

- (NSInteger)numberOfContacts {
    return self.contacts.count;
}

- (Contact *)contactAtIndex:(NSInteger)index {
    return [self.contacts objectAtIndex:index];
}

@end
