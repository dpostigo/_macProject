//
// Created by Daniela Postigo on 5/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "RowObject.h"

@interface DataItemObject : RowObject {
    NSString *textLabel;
    NSString *detailTextLabel;
    NSImage *image;
    NSImage *selectedImage;
}

@property(nonatomic, retain) NSString *textLabel;
@property(nonatomic, retain) NSString *detailTextLabel;
@property(nonatomic, strong) NSImage *image;
@property(nonatomic, strong) NSImage *selectedImage;


- (id) initWithTextLabel: (NSString *) aTextLabel;

- (id) initWithTextLabel: (NSString *) aTextLabel detailTextLabel: (NSString *) aDetailTextLabel;

@end