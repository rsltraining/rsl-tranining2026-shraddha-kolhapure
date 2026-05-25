#import "SceneDelegate.h"
#import "FirstViewController.h"

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
   
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    
    FirstViewController *rootVC = [[FirstViewController alloc] init];
    
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
}

@end
