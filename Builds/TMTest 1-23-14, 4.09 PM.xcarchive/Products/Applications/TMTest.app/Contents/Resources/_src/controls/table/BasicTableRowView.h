//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "PathOptions.h"

@interface BasicTableRowView : NSTableRowView {
    NSColor *selectedBackgroundColor;
    PathOptions *pathOptions;
}

@property(nonatomic, strong) NSColor *selectedBackgroundColor;
@property(nonatomic, strong) PathOptions *pathOptions;
@end