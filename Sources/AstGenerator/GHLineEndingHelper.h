#import <Foundation/Foundation.h>

@interface GHLineEndingHelper : NSObject

+ (NSString *)normalizeLineEndings:(NSString *)theText;
+ (NSString *)normalizeJSonLineEndings:(NSString *)theText;

@end
