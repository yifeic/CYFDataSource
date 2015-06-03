//
//  CYFDataSourceBlocks.h
//  CYFDataSource
//
//  Created by yifeic on 06/02/2015.
//  Copyright (c) 2014 yifeic. All rights reserved.
//

typedef UITableViewCell *(^CYFDataSourceCellForRowBlock)(UITableView *tableView, NSIndexPath *indexPath);
typedef void(^CYFDataSourceSelectRowBlock)(UITableView *tableView, NSIndexPath *indexPath);
typedef CGFloat(^CYFDataSourceHeightForRowBlock)(UITableView *tableView, NSIndexPath *indexPath);
