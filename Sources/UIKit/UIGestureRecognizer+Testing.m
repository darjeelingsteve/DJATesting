//
//  UIGestureRecognizer+Testing.m
//  DJATesting
//
//  Created by Stephen Anthony on 18/05/2021.
//

#import "UIGestureRecognizer+Testing.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation UIGestureRecognizer (Testing)

- (void)dja_simulateGestureRecognition {
    [self dja_simulateGestureRecognitionWithOverridenGestureRecogniser:self];
}

- (void)dja_simulateGestureRecognitionWithOverridenGestureRecogniser:(UIGestureRecognizer *)overridenGestureRecogniser {
    Class gestureRecogniserTargetClass = NSClassFromString(@"UIGestureRecognizerTarget");
    Ivar targetIvar = class_getInstanceVariable(gestureRecogniserTargetClass, "_target");
    Ivar actionIvar = class_getInstanceVariable(gestureRecogniserTargetClass, "_action");
    
    NSArray *gestureRecogniserTargets = [self valueForKey:@"targets"];
    
    for (id gestureRecogniserTarget in gestureRecogniserTargets) {
        id target = object_getIvar(gestureRecogniserTarget, targetIvar);
        SEL action = (__bridge void *)object_getIvar(gestureRecogniserTarget, actionIvar);
        void (*actionMethod)(id, SEL, id) = (void (*)(id, SEL, id))objc_msgSend;
        actionMethod(target, action, overridenGestureRecogniser);
    }
}

@end
