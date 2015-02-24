//
//  ICLineChartView.h
//  TestLineChart
//
//  Created by Bhuvan Sharma on 16/04/14.
//  Copyright (c) 2014 arya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICCircle.h"
#import "ICLine.h"
#import "ICLineAnimation.h"

@protocol LineChartGraphDelegate;

@interface ICLineChartView : UIView<ICAnimationDelegate,UIGestureRecognizerDelegate>

@property (assign) IBOutlet id <LineChartGraphDelegate> delegate;



//------------------------------------------------------------------------------------//
//----- METHODS ----------------------------------------------------------------------//
//------------------------------------------------------------------------------------//


/// Reload the graph, all delegate methods are called again and the graph is reloaded. Similar to calling reloadData on a UITableView.
- (void)reloadGraph;
- (NSNumber *)calculatePointValueSum;
/** All the displayed values of the X-Axis.
 @return An array of NSStrings, one for each displayed X-Axis label. The array is sorted from the left side of the graph to the right side. */
- (NSArray *)graphValuesForXAxis;


/** All the data points on the graph.
 @return An array of NSNumbers, one for each data point. The array is sorted from the left side of the graph to the right side. */
- (NSArray *)graphValuesForDataPoints;

@property (strong, nonatomic) UIFont *labelFont;


/// Speed of the animation when the graph appears. From 0 to 10, 0 meaning no animation, 1 very slow and 10 very fast. Default value is 5.
@property (nonatomic) NSInteger animationGraphEntranceSpeed;


/// If set to yes, the graph will respond to touch events. The 2 methods above should therefore be implemented. Default value is NO.
@property (nonatomic) BOOL enableTouchReport;
/// Color of the line of the graph.
@property (strong, nonatomic) UIColor *colorLine;


/// Alpha of the line of the graph.
@property (nonatomic) CGFloat alphaLine;


/// Width of the line of the graph. Default value is 1.0.
@property (nonatomic) CGFloat widthLine;


/// Color of the label's text displayed on the X-Axis.
@property (strong, nonatomic) UIColor *colorXaxisLabel;
@end

@protocol LineChartGraphDelegate <NSObject>
@required


//----- DATA SOURCE -----//


/** The number of points along the X-axis of the graph.
 @param graph The graph object requesting the total number of points.
 @return The total number of points in the line graph. */
- (NSInteger)numberOfPointsInLineGraph:(ICLineChartView *)graph;


/** The vertical position for a point at the given index. It corresponds to the Y-axis value of the Graph.
 @param graph The graph object requesting the point value.
 @param index The index from left to right of a given point (X-axis). The first value for the index is 0.
 @return The Y-axis value at a given index. */
- (CGFloat)lineGraph:(ICLineChartView *)graph valueForPointAtIndex:(NSInteger)index;


@optional


//----- GRAPH EVENTS -----//


/** Sent to the delegate each time the line graph is loaded or reloaded.
 @param graph The graph object that is about to be loaded or reloaded. */
- (void)lineGraphDidBeginLoading:(ICLineChartView *)graph;


/** Sent to the delegate each time the line graph is finishes loading or reloading.
 @param graph The graph object that finished loading or reloading. */
- (void)lineGraphDidFinishLoading:(ICLineChartView *)graph;


//----- CUSTOMIZATION -----//


/** The color of the line at the given index. This is called for each line in the graph, every time an update is made.
 @param graph The graph object requesting the line color.
 @param index The index from left to right of a given point (X-axis). The first value for the index is 0.
 @return The color of the line. Specifying nil will cause the line to use the color specifed for the graph. */
- (UIColor *)lineGraph:(ICLineChartView *)graph lineColorForIndex:(NSInteger)index;


/** The alpha of the line at the given index. This is called for each line in the graph, every time an update is made.
 @param graph The graph object requesting the line alpha.
 @param index The index from left to right of a given point (X-axis). The first value for the index is 0.
 @return The alpha value of the line, between 0.0 and 1.0. Specifying nil will cause the line to use the alpha specifed for the graph. */
- (CGFloat)lineGraph:(ICLineChartView *)graph lineAlphaForIndex:(NSInteger)index;


//----- TOUCH EVENTS -----//


/** Sent to the delegate when the user starts touching the graph. The property 'enableTouchReport' must be set to YES.
 @param graph The graph object which was touched by the user.
 @param index The closest index (X-axis) from the location the user is currently touching. */
- (void)lineGraph:(ICLineChartView *)graph didTouchGraphWithClosestIndex:(NSInteger)index;


/** Sent to the delegate when the user stops touching the graph.
 @param graph The graph object which was touched by the user.
 @param index The closest index (X-axis) from the location the user last touched. */
- (void)lineGraph:(ICLineChartView *)graph didReleaseTouchFromGraphWithClosestIndex:(CGFloat)index;


//----- X AXIS -----//


/** The number of free space between labels on the X-axis to avoid overlapping.
 @discussion For example returning '1' would mean that half of the labels on the X-axis are not displayed: the first is not displayed, the second is, the third is not etc. Returning '0' would mean that all of the labels will be displayed. Finally, returning a value equal to the number of labels will only display the first and last label.
 @param graph The graph object which is requesting the number of gaps between the labels.
 @return The number of labels to "jump" between each displayed label on the X-axis. */
- (NSInteger)numberOfGapsBetweenLabelsOnLineGraph:(ICLineChartView *)graph;


/** The string to display on the label on the X-axis at a given index. Please note that the number of strings to be returned should be equal to the number of points in the Graph.
 @param graph The graph object which is requesting the label on the specified X-Axis position.
 @param index The index from left to right of a given label on the X-axis. Is the same index as the one for the points. The first value for the index is 0. */
- (NSString *)lineGraph:(ICLineChartView *)graph labelOnXAxisForIndex:(NSInteger)index;
@end
