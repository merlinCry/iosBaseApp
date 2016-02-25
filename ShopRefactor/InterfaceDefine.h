//
//  InterfaceDefine.h
//  ShopRefactor
//
//  Created by song on 16/2/22.
//  Copyright © 2016年 song. All rights reserved.
//

#ifndef InterfaceDefine_h
#define InterfaceDefine_h

#define                          IP_PORT    @"192.168.100.18:8082"


#define URLADDRESS               [NSString stringWithFormat:@"http://%@/",IP_PORT]

#define Login_URL                [NSString stringWithFormat:@"%@%@",URLADDRESS,@"signIn"]




#endif /* InterfaceDefine_h */
