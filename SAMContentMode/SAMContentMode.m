//
//  SAMContentMode.m
//  SAMContentMode
//
//  Created by Sam Soffes on 3/17/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

#import "SAMContentMode.h"

CGRect SAMRectForContentMode(CGRect bounds, UIViewContentMode contentMode, CGRect rect) {
	switch (contentMode) {
		case UIViewContentModeScaleToFill: {
			return bounds;
		}

		case UIViewContentModeScaleAspectFit: {
			return SAMRectAspectFit(rect.size, bounds);
		}

		case UIViewContentModeScaleAspectFill: {
			return SAMRectAspectFill(rect.size, bounds);
		}

		case UIViewContentModeRedraw: {
			// Invalid. Return UIViewContentModeScaleToFill
			return rect;
		}

		case UIViewContentModeCenter: {
			rect.origin.x = (bounds.size.width - rect.size.width) / 2.0f;
			rect.origin.y = (bounds.size.height - rect.size.height) / 2.0f;
			return rect;
		}

		case UIViewContentModeTop: {
			rect.origin.y = 0.0f;
			rect.origin.x = (bounds.size.width - rect.size.width) / 2.0f;
			return rect;
		}

		case UIViewContentModeBottom: {
			rect.origin.x = (bounds.size.width - rect.size.width) / 2.0f;
			rect.origin.y = bounds.size.height - rect.size.height;
			return rect;
		}

		case UIViewContentModeLeft: {
			rect.origin.x = 0.0f;
			rect.origin.y = (bounds.size.height - rect.size.height) / 2.0f;
			return rect;
		}

		case UIViewContentModeRight: {
			rect.origin.x = bounds.size.width - rect.size.width;
			rect.origin.y = (bounds.size.height - rect.size.height) / 2.0f;
			return rect;
		}

		case UIViewContentModeTopLeft: {
			rect.origin.x = 0.0f;
			rect.origin.y = 0.0f;
			return rect;
		}

		case UIViewContentModeTopRight: {
			rect.origin.x = bounds.size.width - rect.size.width;
			rect.origin.y = 0.0f;
			return rect;
		}

		case UIViewContentModeBottomLeft: {
			rect.origin.x = 0.0f;
			rect.origin.y = bounds.size.height - rect.size.height;
			return rect;
		}

		case UIViewContentModeBottomRight: {
			rect.origin.x = bounds.size.width - rect.size.width;
			rect.origin.y = bounds.size.height - rect.size.height;
			return rect;
		}
	}
}


CGSize SAMSizeAspectFit(CGSize aspectRatio, CGSize boundingSize) {
    CGFloat widthRatio = (boundingSize.width / aspectRatio.width);
    CGFloat heightRatio = (boundingSize.height / aspectRatio.height);
    if (widthRatio < heightRatio) {
        boundingSize.height = boundingSize.width / aspectRatio.width * aspectRatio.height;
    }
    else if (heightRatio < widthRatio) {
        boundingSize.width = boundingSize.height / aspectRatio.height * aspectRatio.width;
    }
    return CGSizeMake(ceil(boundingSize.width), ceil(boundingSize.height));
}


CGSize SAMSizeAspectFill(CGSize aspectRatio, CGSize minimumSize) {
    CGFloat widthRatio = (minimumSize.width / aspectRatio.width);
    CGFloat heightRatio = (minimumSize.height / aspectRatio.height);
    if (widthRatio > heightRatio) {
        minimumSize.height = minimumSize.width / aspectRatio.width * aspectRatio.height;
    }
    else if (heightRatio > widthRatio) {
        minimumSize.width = minimumSize.height / aspectRatio.height * aspectRatio.width;
    }
    return CGSizeMake(ceil(minimumSize.width), ceil(minimumSize.height));
}


CGRect SAMRectAspectFit(CGSize aspectRatio, CGRect boundingRect) {
    CGSize size = SAMSizeAspectFit(aspectRatio, boundingRect.size);
    CGPoint origin = CGPointZero;
    origin.x = (boundingRect.size.width - size.width) / 2.0;
    origin.y = (boundingRect.size.height - size.height) / 2.0;
    return (CGRect){ origin, size };
}


CGRect SAMRectAspectFill(CGSize aspectRatio, CGRect minimumRect) {
    CGSize size = SAMSizeAspectFill(aspectRatio, minimumRect.size);
    CGPoint origin = CGPointZero;
    origin.x = (minimumRect.size.width - size.width) / 2.0;
    origin.y = (minimumRect.size.height - size.height) / 2.0;
    return (CGRect){ origin, size };
}
