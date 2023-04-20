#import <Foundation/Foundation.h>

@interface GHAstGenerator : NSObject

+ (NSString *)generateAstFromFile:(NSString *)theFeatureFilePath;

@end
