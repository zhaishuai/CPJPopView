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

- (void)hideFromView:(UIView *)view;

@end

#endif /* CPJPopViewProtocol_h */
