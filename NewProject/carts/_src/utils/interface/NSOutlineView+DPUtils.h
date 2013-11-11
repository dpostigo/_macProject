//
//  NSOutlineView+DPUtils.h
//  Carts
//
//  Created by Daniela Postigo on 10/22/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOutlineView (DPUtils)

- (void) selectFirstItem;
- (void) selectItemAtRow: (NSInteger) rowIndex section: (NSInteger) sectionIndex;
- (void) selectItem: (id) item;
@end