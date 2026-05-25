#import "SceneDelegate.h"
#import "FirstViewController.h"

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    // 1. Capture the system window scene
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    
    // 2. Initialize your primary programmatic screen
    FirstViewController *rootVC = [[FirstViewController alloc] init];
    
    // 3. Mount it onto the root window and display it
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
}

@end
