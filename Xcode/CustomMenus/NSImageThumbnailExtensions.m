#import "NSImageThumbnailExtensions.h"

@implementation NSImage (NSImageThumbnailExtensions)

/* Create an NSImage from with the contents of the url of the specified width. The height of the resulting NSImage maintains the proportions in source.
*/
+ (id) iteThumbnailImageWithContentsOfURL: (NSURL *) url width: (CGFloat) width {
    NSImage *thumbnailImage = nil;
    NSImage *image = [[NSImage alloc] initWithContentsOfURL: url];
    if (image != nil) {
        NSSize imageSize = [image size];
        CGFloat imageAspectRatio = imageSize.width / imageSize.height;
        // Create a thumbnail image from this image (this part of the slow operation)
        NSSize thumbnailSize = NSMakeSize(width, width * imageAspectRatio);
        thumbnailImage = [[NSImage alloc] initWithSize: thumbnailSize];

        [thumbnailImage lockFocus];
        [image drawInRect: NSMakeRect(0.0f, 0.0f, thumbnailSize.width, thumbnailSize.height) fromRect: NSZeroRect operation: NSCompositeSourceOver fraction: 1.0f];
        [thumbnailImage unlockFocus];

        /* In general, the accessibility description is a localized description of the image.  In this app, and in the Desktop & Screen Saver preference pane, the name of the desktop picture file is what is used as the localized description in the user interface, and so it is appropriate to use the file name in this case.
	
            When an accessibility description is set on an image, the description is automatically reported to accessibility when that image is displayed in image views/cells, buttons/button cells, segmented controls, etc.  In this case the description is set programatically.  For images retrieved by name, using +imageNamed:, you can use a strings file named AccessibilityImageDescriptions.strings, which uses the names of the images as keys and the description as the string value, to automatically provide accessibility descriptions for named images in your application.
        */
        NSString *imageName = [[url lastPathComponent] stringByDeletingPathExtension];
        [thumbnailImage setAccessibilityDescription: imageName];

    }

    /* This is a sample code feature that delays the creation of the thumbnail for demonstration purposes only.
        Hold down the control key to extend thumnail creation by 2 seconds.
    */
    if ([NSEvent modifierFlags] & NSControlKeyMask) {
        usleep(2000000);
    }

    return thumbnailImage;
}

@end

/* A shared operation que that is used to generate thumbnails in the background.
*/
NSOperationQueue *ITESharedOperationQueue() {
    static NSOperationQueue *_ITEImageSharedOperationQueue = nil;
    if (_ITEImageSharedOperationQueue == nil) {
        _ITEImageSharedOperationQueue = [[NSOperationQueue alloc] init];
        [_ITEImageSharedOperationQueue setMaxConcurrentOperationCount: NSOperationQueueDefaultMaxConcurrentOperationCount];
    }
    return _ITEImageSharedOperationQueue;
}
