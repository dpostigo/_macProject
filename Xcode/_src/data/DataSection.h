//
// Created by Daniela Postigo on 5/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "RowObject.h"

typedef enum {
    ItemTitleAscendingSortType = 0,
    ItemTitleDescendingSortType = 1,
    ItemDateAscendingSortType = 2,
    ItemDateDescendingSortType = 3,
} ItemSortMode;


@interface DataSection : RowObject {
    NSString *title;
    NSMutableArray *rows;

    ItemSortMode sortMode;

}

@property(nonatomic, strong) NSMutableArray *rows;
@property(nonatomic, retain) NSString *title;
@property(nonatomic) ItemSortMode sortMode;
- (id) initWithTitle: (NSString *) aTitle;
- (id) initWithTitle: (NSString *) aTitle content: (id) aContent;
- (void) addRow: (id) object;
@end