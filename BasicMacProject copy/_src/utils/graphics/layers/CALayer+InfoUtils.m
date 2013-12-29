//
// Created by Dani Postigo on 12/28/13.
// Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CALayer+InfoUtils.h"

@implementation CALayer (InfoUtils)

- (void) logInfo {

}

- (NSString *) infoString {
    NSMutableString *ret = [[NSMutableString alloc] init];

    self.cornerRadius;
    self.needsDisplayOnBoundsChange;
    self.backgroundColor;

    NSString *baseFormat = @"\t%@\n";
    [ret appendString: @"{\n"];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"animationKeys = %@", self.animationKeys]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"actions = %@", self.actions]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"autoresizingMask = %u", self.autoresizingMask]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"backgroundColor = %p", self.backgroundColor]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"backgroundFilters = %lu", self.backgroundFilters.count]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"beginTime = %f", self.beginTime]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"borderColor = %@", [NSColor colorWithCGColor: self.borderColor]]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"borderWidth = %f", self.borderWidth]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"bounds = %@", NSStringFromRect(self.bounds)]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"cornerRadius = %f", self.cornerRadius]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"contents = %@", self.contents]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"compositingFilter = %@", self.compositingFilter]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"contentsAreFlipped = %d", self.contentsAreFlipped]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"contentsCenter = %@", NSStringFromRect(self.contentsCenter)]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"contentsGravity = %@", self.contentsGravity]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"contentsRect = %@", NSStringFromRect(self.contentsRect)]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"constraints = %@", self.constraints]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"delegate = %@", self.delegate]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"doubleSided = %d", self.doubleSided]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"drawsAsynchronously = %d", self.drawsAsynchronously]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"duration = %f", self.duration]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"frame = %@", NSStringFromRect(self.frame)]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"filters = %lu", self.filters.count]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"fillMode = %@", self.fillMode]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"geometryFlipped = %d", self.geometryFlipped]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"hidden = %d", self.hidden]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"layoutManager = %@", self.layoutManager]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"mask = %@", self.mask]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"masksToBounds = %d", self.masksToBounds]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"name = %@", self.name]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"needsDisplayOnBoundsChange = %d", self.needsDisplayOnBoundsChange]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"opacity = %f", self.opacity]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"opaque = %d", self.opaque]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"position = %@", NSStringFromPoint(self.position)]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"preferredFrameSize = %@", NSStringFromSize(self.preferredFrameSize)]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"presentationLayer = %@", self.presentationLayer]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"rasterizationScale = %f", self.rasterizationScale]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"repeatCount = %f", self.repeatCount]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"sublayers = %lu", self.sublayers.count]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"superlayer = %@", self.superlayer]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"shadowColor = %p", self.shadowColor]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"shadowOffset = %@", NSStringFromSize(self.shadowOffset)]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"shadowOpacity = %f", self.shadowOpacity]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"shadowPath = %p", self.shadowPath]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"shadowRadius = %f", self.shadowRadius]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"shouldRasterize = %d", self.shouldRasterize]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"speed = %f", self.speed]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"style = %@", self.style]]];
    //    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"sublayerTransform = %@", self.sublayerTransform]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"transform = %d", self.transform]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"timeOffset = %f", self.timeOffset]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"visibleRect = %@", NSStringFromRect(self.visibleRect)]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"zPosition = %f", self.zPosition]]];
    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"hidden = %d", self.hidden]]];
    //    [ret appendString: [NSString stringWithFormat: baseFormat, [NSString stringWithFormat: @"hidden = %d", self.hidden]]];



    [ret appendString: @"}\n"];
    return [ret copy];

}
@end