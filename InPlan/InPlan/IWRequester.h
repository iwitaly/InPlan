//
//  IWRequester.h
//  InPlan
//
//  Created by Виталий Давыдов on 03.12.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IWRequester : NSObject
/*!
 *  sending request to PATH using http method METHOD with params in http body PARAMS
 *
 *  @param path   path on api servere to whom send request
 *  @param method which method use
 *  @param params params for HTTP requst
 *
 *  @return parsed JSON with data from server or array of JSONs
 */
- (id)sendRequestToPath:(NSString *)path viaHttpMethod:(NSString *)method withBodyParams:(NSDictionary *)params; //return id
/*!
 *  init new IWRequester with default HEADERS and custom PARAMS. also init client with baseUrl
 *
 *  @param headers headers from http request. [0] - Content-Type, [1] - Authorization
 *  @param params  custom params for request
 *
 *  @return new IWRequester object
 */
- (instancetype)initWithHttpHeaders:(NSArray *)headers andCustomParams:(NSArray *)params;

@end
