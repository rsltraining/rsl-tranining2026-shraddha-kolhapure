#import "SceneDelegate.h"
#import "ViewController.h"
#import "GameViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene
willConnectToSession:(UISceneSession *)session
options:(UISceneConnectionOptions *)connectionOptions {

    self.window =
    [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];

    
    // Uncomment this for Custom UIView Assignment
    self.window.rootViewController = [[ViewController alloc] init];

    
    // Uncomment this for Bull's Eye Game
     //self.window.rootViewController = [[GameViewController alloc] init];

    
    [self.window makeKeyAndVisible];
}

@end
