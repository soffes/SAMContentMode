# SAMContentMode

Content mode calculations for CGRect. Works on iOS and Mac. On Mac, `UIViewContentMode` is defined in the header so you can use it.


## Usage

``` objective-c
/**
 Resize `rect` to fit in `bounds` using a given `contentMode`.

 @param bounds The bounds containing the rect.
 @param contentMode The content mode to use.
 @param rect The rect to resize.
 @return A resized rect for the given content mode.

 Note: UIViewContentModeRedraw returns the same value as UIViewContentModeScaleToFill.
 */
extern CGRect SAMRectForContentMode(CGRect bounds, UIViewContentMode contentMode, CGRect rect);
```

## Thanks

Special thanks to [Caleb Davenport](https://twitter.com/calebd) for the aspect math. That junk is hard.
