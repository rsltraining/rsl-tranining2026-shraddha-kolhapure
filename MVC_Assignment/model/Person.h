//
//  Person.h
//  MVC_Assignment
//
//  Created by Shraddha Kolhapure on 27/05/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, strong) NSString *fname;
@property (nonatomic, strong) NSString *lname;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) NSArray<NSString *> *profilePic;
@property (nonatomic, assign) BOOL profileViewed;

@end

NS_ASSUME_NONNULL_END
