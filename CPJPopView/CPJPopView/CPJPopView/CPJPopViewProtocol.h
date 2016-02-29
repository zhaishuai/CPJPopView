//
//  CPJPopViewProtocol.h
//  CPJPopView
//
//  Created by shuaizhai on 2/29/16.
//  Copyright © 2016 com.zhaishuai.www. All rights reserved.
//

#ifndef CPJPopViewProtocol_h
#define CPJPopViewProtocol_h

@protocol CPJPopViewProtocol <NSObject>

/**
 *
 */
- (void)show:(UIView *)view;

- (void)show:(UIView *)view withComplete:(void (^)())complete;

- (void)hideFromView:(UIView *)view;

- (void)show:(UIView *)view withConfirm:(void (^)())confirm;

- (void)show:(UIView *)view withConfirm:(void (^)())confirm withCancel:(void (^)(UIView *view))cancel;

@end

#endif /* CPJPopViewProtocol_h */
