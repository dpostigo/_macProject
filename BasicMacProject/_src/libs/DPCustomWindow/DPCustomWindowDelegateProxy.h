//
// Created by Daniela Postigo on 5/17/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface DPCustomWindowDelegateProxy : NSProxy <NSWindowDelegate> {
}

@property(nonatomic, assign) id <NSWindowDelegate> secondaryDelegate;
@end

