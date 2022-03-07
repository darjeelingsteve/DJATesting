//
//  UIGestureRecognizer+Testing.h
//  DJATesting
//
//  Created by Stephen Anthony on 18/05/2021.
//

#import <UIKit/UIKit.h>
#import <TargetConditionals.h>

#if !TARGET_OS_WATCH

NS_ASSUME_NONNULL_BEGIN

@interface UIGestureRecognizer (Testing)

/// Simulates the receiver recognising its gesture.
- (void)dja_simulateGestureRecognition;

/// Simulates the receiver recognising its gesture, but passes the given gesture
/// recogniser to the receiver's targets instead of the receiver.
/// @param overridenGestureRecogniser The gesture recogniser to be sent to the
/// receiver's gesture recognition targets.
- (void)dja_simulateGestureRecognitionWithOverridenGestureRecogniser:(UIGestureRecognizer *)overridenGestureRecogniser;

@end

NS_ASSUME_NONNULL_END

#endif
