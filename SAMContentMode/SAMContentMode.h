//
//  SAMContentMode.h
//  SAMContentMode
//
//  Created by Sam Soffes on 3/17/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

@import Foundation;
@import CoreGraphics;

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
@import UIKit;
#else
typedef NS_ENUM(NSInteger, UIViewContentMode) {
    UIViewContentModeScaleToFill,
    UIViewContentModeScaleAspectFit,
    UIViewContentModeScaleAspectFill,
    UIViewContentModeRedraw,
    UIViewContentModeCenter,
    UIViewContentModeTop,
    UIViewContentModeBottom,
    UIViewContentModeLeft,
    UIViewContentModeRight,
    UIViewContentModeTopLeft,
    UIViewContentModeTopRight,
    UIViewContentModeBottomLeft,
    UIViewContentModeBottomRight,
};
#endif

#ifndef SAMCONTENTMODE
#define SAMCONTENTMODE 1

/**
 Resize `rect` to fit in `bounds` using a given `contentMode`.

 @param bounds The bounds containing the rect.
 @param contentMode The content mode to use.
 @param rect The rect to resize.
 @return A resized rect for the given content mode.

 Note: UIViewContentModeRedraw returns the same value as UIViewContentModeScaleToFill.
 */
extern CGRect SAMRectForContentMode(CGRect bounds, UIViewContentMode contentMode, CGRect rect);

/**
 Resize a size to fit a given aspect ratio.

 @param aspectRatio The aspect ratio to use.
 @param boundingSize The size to resize.
 @return A resized size to fit the aspect ratio.
 */
extern CGSize SAMSizeAspectFit(CGSize aspectRatio, CGSize boundingSize);

/**
 Resize a size to fill a given aspect ratio.

 @param aspectRatio The aspect ratio to use.
 @param boundingSize The size to resize.
 @return A resized size to fill the aspect ratio.
 */
extern CGSize SAMSizeAspectFill(CGSize aspectRatio, CGSize minimumSize);

/**
 Resize a rect to fit a given aspect ratio.

 @param aspectRatio The aspect ratio to use.
 @param boundingRect The rect to resize.
 @return A resized rect to fit the aspect ratio.
 */
extern CGRect SAMRectAspectFit(CGSize aspectRatio, CGRect boundingRect);

/**
 Resize a rect to fill a given aspect ratio.

 @param aspectRatio The aspect ratio to use.
 @param boundingRect The rect to resize.
 @return A resized rect to fill the aspect ratio.
 */
extern CGRect SAMRectAspectFill(CGSize aspectRatio, CGRect minimumRect);

#endif
