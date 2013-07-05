//
// Created by dpostigo on 2/18/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface BasicOutlineView : NSOutlineView {

    BOOL   showsDisclosureTriangles;
    NSRect disclosureRect;

}


@property(nonatomic) BOOL   showsDisclosureTriangles;
@property(nonatomic) NSRect disclosureRect;
@end