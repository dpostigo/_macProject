#import <Cocoa/Cocoa.h>

@interface NSImage (ImageThumbnailExtensions)

/* Create an NSImage from with the contents of the url of the specified width. The height of the resulting NSImage maintains the proportions in source.

    NSImage loads image data from files lazily. This method forces the file to be read to create a small sized version. This can be a useful thing to do as a background operation. 
*/
+ (id) iteThumbnailImageWithContentsOfURL: (NSURL *) url width: (CGFloat) width;

@end

/* A shared operation que that is used to generate thumbnails in the background.
*/
NSOperationQueue *ITESharedOperationQueue();