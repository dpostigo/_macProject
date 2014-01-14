//
// Created by Dani Postigo on 1/9/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DPOutlineViewSection;

@interface DPOutlineViewItem : NSObject     {
    __unsafe_unretained DPOutlineViewSection *section;
}

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *identifier;
@property(nonatomic, strong) NSImage *image;
@property(nonatomic, assign) DPOutlineViewSection *section;

- (instancetype) initWithTitle: (NSString *) aTitle;
- (instancetype) initWithTitle: (NSString *) aTitle image: (NSImage *) anImage;
- (instancetype) initWithTitle: (NSString *) aTitle identifier: (NSString *) anIdentifier;
- (instancetype) initWithTitle: (NSString *) aTitle image: (NSImage *) anImage identifier: (NSString *) anIdentifier;

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

- (void) willDisplayCellView: (NSView *) view forSection: (DPOutlineViewSection *) section;
- (void) willDisplayCellView: (NSTableCellView *) cellView forItem: (DPOutlineViewItem *) item;
- (void) didSelectItem: (DPOutlineViewItem *) item;

- (void) outlineViewDidReload;

@end


@interface DPOutlineView : NSOutlineView <NSOutlineViewDelegate, NSOutlineViewDataSource> {
    id <DPOutlineViewDelegate> outlineDelegate;
    BOOL autoExpands;
}

@property(nonatomic) BOOL autoExpands;
@property(nonatomic, strong) id <DPOutlineViewDelegate> outlineDelegate;
- (void) prepareDatasource;
- (void) clearSections;
- (DPOutlineViewSection *) sectionAtIndex: (NSUInteger) index1;
- (void) addSection: (DPOutlineViewSection *) section;
- (NSUInteger) sectionCount;
@end