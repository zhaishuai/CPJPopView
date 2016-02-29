//
//  CPJDialogView.h
//  CPJPopView
//
//  Created by shuaizhai on 2/29/16.
//  Copyright © 2016 com.zhaishuai.www. All rights reserved.
//

#import "CPJAlertView.h"

@interface CPJDialogView : CPJAlertView

- (void)show:(UIView *) view withConfirm:(void (^)())confirm withCancel:(void (^)(UIView *view))cancel;

@end
