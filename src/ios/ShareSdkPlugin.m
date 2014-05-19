//
//  ShareSdkPlugin.m
//  ShareSdkPlugin
//
//  Created by CHC on 14-1-7.
//
//

#import "ShareSdkPlugin.h"
#import <ShareSDK/ShareSDK.h>

@implementation ShareSdkPlugin
- (void) send:(CDVInvokedUrlCommand*)command;
{
    NSMutableDictionary *args = [command.arguments objectAtIndex:0];
    NSString *title = [args objectForKey:@"title"];
    NSString *description = [args objectForKey:@"description"];
    NSString *url = [args objectForKey:@"url"];
    NSString *imageUrl = [args objectForKey:@"imageUrl"];
    NSString *imageNamed = [args objectForKey:@"imageNamed"];

     
	//�����������
	id<ISSContent> publishContent = [ShareSDK content:title
                                          defaultContent:@"�����˵���"
                                          image:imageUrl
                                          title:title
                                          url:@"http://www.sharesdk.cn"
                                          description:description
                                          mediaType:SSPublishContentMediaTypeNews];

[ShareSDK showShareActionSheet:nil
                     shareList:nil
                     content:publishContent
                     statusBarTips:YES
                     authOptions:nil
                     shareOptions: nil
                     result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                               if (state == SSResponseStateSuccess)
                                               {
                                                       NSLog(@"����ɹ�");
                                               }
                                               else if (state == SSResponseStateFail)
                                               {
                                                       NSLog(@"����ʧ��,������:%d,��������:%@", [error errorCode], [error errorDescription]);
                                               }
                            }];
}


@end
