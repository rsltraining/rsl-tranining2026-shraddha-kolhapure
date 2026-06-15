//
//  ContactModelProvider.h
//  ContactListApplication
//
//  Created by Shraddha Kolhapure on 28/05/26.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactModelProvider : NSObject

- (NSInteger)numberOfContacts;
- (Contact *)contactAtIndex:(NSInteger)index;

@end
