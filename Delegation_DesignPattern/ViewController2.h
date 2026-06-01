//
//  ViewController2.h
//  Delegation_DesignPattern
//
//  Created by Shraddha Kolhapure on 26/05/26.
//

// ViewController2.h
#import <UIKit/UIKit.h>

@protocol ColorChangeUsingDelegate <NSObject>
- (void)didSelectColor:(UIColor *)color;
@end

@interface ViewController2 : UIViewController

@property (nonatomic, weak) id<ColorChangeUsingDelegate> delegate;

@end
