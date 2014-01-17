//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DPOutlineViewSection;

@interface DPOutlineViewItem : NSObject {
    __unsafe_unretained DPOutlineViewSection *section;
}

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *identifier;
@property(nonatomic, strong) NSImage *image;
@property(nonatomic, assign) DPOutlineViewSection *section;

@property(nonatomic, copy) NSString *subtitle;
- (instancetype) initWithTitle: (NSString *) aTitle;
- (instancetype) initWithTitle: (NSString *) aTitle image: (NSImage *) anImage;
- (instancetype) initWithTitle: (NSString *) aTitle identifier: (NSString *) anIdentifier;
- (instancetype) initWithTitle: (NSString *) aTitle image: (NSImage *) anImage identifier: (NSString *) anIdentifier;
- (instancetype) initWithTitle: (NSString *) aTitle subtitle: (NSString *) aSubtitle image: (NSImage *) anImage identifier: (NSString *) anIdentifier;
- (instancetype) initWithTitle: (NSString *) aTitle subtitle: (NSString *) aSubtitle image: (NSImage *) anImage;


@end


@interface DPOutlineViewSection : NSObject

@property(nonatomic, copy) NSString *title;

- (instancetype) initWithTitle: (NSString *) aTitle items: (NSMutableArray *) anItems;
- (instancetype) initWithTitle: (NSString *) aTitle;
- (NSUInteger) itemCount;
- (DPOutlineViewItem *) itemAtIndex: (NSUInteger) index1;

- (void) addItem: (DPOutlineViewItem *) item;

@end


@protocol DPOutlineViewDelegate <NSObject>

@required
- (void) prepareDatasource;

@optional
- (NSTableRowView *) rowViewForItem: (id) item;
- (void) didAddRowView: (NSTableRowView *) rowView;
- (void) didAddRowView: (NSTableRowView *) rowView forSection: (DPOutlineViewSection *) section;
- (void) didAddRowView: (NSTableRowView *) rowView forItem: (DPOutlineViewItem *) item;

- (void) willDisplayCellView: (NSTableCellView *) cellView forSection: (DPOutlineViewSection *) section;
- (void) willDisplayCellView: (NSTableCellView *) cellView forItem: (DPOutlineViewItem *) item;
- (void) didSelectItem: (DPOutlineViewItem *) item;

- (void) outlineViewDidReload;

- (void) outlineViewItemWillCollapse: (NSNotification *) notification;
- (void) outlineViewItemDidCollapse: (NSNotification *) notification;
- (void) outlineViewItemWillExpand: (NSNotification *) notification;
- (void) outlineViewItemDidExpand: (NSNotification *) notification;

@end


@interface DPOutlineView : NSOutlineView <NSOutlineViewDelegate, NSOutlineViewDataSource> {
    id <DPOutlineViewDelegate> outlineDelegate;
    BOOL autoExpands;

    BOOL fitsScrollViewToHeight;
    BOOL isExpanding;
    BOOL isAnimatingBackground;

    BOOL allowsSelection;


    CGFloat expandedHeight;
    CGFloat unexpandedHeight;
}

@property(nonatomic) BOOL autoExpands;
@property(nonatomic, strong) id <DPOutlineViewDelegate> outlineDelegate;
@property(nonatomic) BOOL fitsScrollViewToHeight;
@property(nonatomic) BOOL isExpanding;
@property(nonatomic) BOOL isAnimatingBackground;
@property(nonatomic) BOOL allowsSelection;
@property(nonatomic) CGFloat expandedHeight;
@property(nonatomic) CGFloat unexpandedHeight;

- (void) prepareDatasource;
- (void) clearSections;
- (DPOutlineViewSection *) sectionAtIndex: (NSUInteger) index1;
- (void) addSection: (DPOutlineViewSection *) section;
- (NSUInteger) sectionCount;
- (CGFloat) outlineHeight;
@end