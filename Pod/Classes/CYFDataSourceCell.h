//
//  CYFDataSourceCell.h
//  CYFDataSource
//
//  Created by yifeic on 06/02/2015.
//  Copyright (c) 2014 yifeic. All rights reserved.
//

@import UIKit;
#import "CYFDataSourceBlocks.h"

@interface CYFDataSourceCell : NSObject

@property (nonatomic, strong) CYFDataSourceCellForRowBlock cellForRowBlock;
@property (nonatomic, strong) CYFDataSourceSelectRowBlock selectRowBlock;
@property (nonatomic, strong) CYFDataSourceHeightForRowBlock heightForRowBlock;
@property (nonatomic) CGFloat rowHeight;

@end
