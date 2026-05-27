//
//  College.h
//  singleton_DesignPattern
//
//  Created by Shraddha Kolhapure on 26/05/26.
//

#import <Foundation/Foundation.h>

@interface College : NSObject

@property (nonatomic, strong) NSMutableArray *students;
@property (nonatomic, strong) NSMutableArray *professors;

+ (instancetype)sharedInstance;

@end
