//
//  College.m
//  singleton_DesignPattern
//
//  Created by Shraddha Kolhapure on 26/05/26.
//

#import "College.h"

@implementation College

+ (instancetype)sharedInstance {
    static College *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        
        sharedInstance.students = [[NSMutableArray alloc] init];
        sharedInstance.professors = [[NSMutableArray alloc] init];
    });
    return sharedInstance;
}

@end
