//
//  BasicWindowHeaderViewController.h
//  Carts
//
//  Created by Daniela Postigo on 7/7/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicViewController.h"
#import "ButtonContainer.h"
#import "BasicWindowViewController.h"

@interface BasicWindowHeaderViewController : BasicWindowViewController {

    ButtonContainer *leftButtons;
    ButtonContainer *rightButtons;
}

@property(nonatomic, strong) ButtonContainer *leftButtons;
@property(nonatomic, strong) ButtonContainer *rightButtons;
@end