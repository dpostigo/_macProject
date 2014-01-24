#import <Cocoa/Cocoa.h>

@interface ImagePickerMenuItemView : NSView {
@private
    IBOutlet NSImageView *imageView1;
    IBOutlet NSImageView *imageView2;
    IBOutlet NSImageView *imageView3;
    IBOutlet NSImageView *imageView4;

    IBOutlet NSProgressIndicator *spinner1;
    IBOutlet NSProgressIndicator *spinner2;
    IBOutlet NSProgressIndicator *spinner3;
    IBOutlet NSProgressIndicator *spinner4;

    NSArray *_imageUrls;
    NSArray *_imageViews;
    NSArray *_spinners;

    NSInteger _selectedIndex;
    NSMutableArray *_trackingAreas;
    BOOL _thumbnailsNeedUpdate;
}

/* These two properties are used to detemine which images to use and the current selection, if any. They me be set and interrogated manually, but in this sample code, they are bound to an NSDictionary in CustomMenusAppDelegate.m -setupImagesMenu.
*/
@property(nonatomic, retain) NSArray *imageUrls;
@property(nonatomic, retain, readonly) NSURL *selectedImageUrl;

@end
