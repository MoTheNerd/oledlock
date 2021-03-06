//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIViewController.h"

#import "SPUISearchViewControllerDelegate.h"
#import "WGWidgetGroupViewControllerDelegate.h"

@class FBDisplayLayoutElement, NSString, SBSpotlightBarNavigationController, SPUISearchViewController, WGWidgetGroupViewController, _UILegibilitySettings;

@interface SBHomeScreenTodayViewController : UIViewController <WGWidgetGroupViewControllerDelegate, SPUISearchViewControllerDelegate>
{
    WGWidgetGroupViewController *_widgetViewController;
    SBSpotlightBarNavigationController *_spotlightNavController;
    SPUISearchViewController *_sharedSearch;
    FBDisplayLayoutElement *_displayLayoutElement;
    _UILegibilitySettings *_legibilitySettings;
    UIViewController *_spotlightViewController;
    id <SBHomeScreenTodayViewControllerDelegate> _delegate;
}

+ (double)_verticalSpacingBetweenWidgets;
@property(nonatomic) __weak id <SBHomeScreenTodayViewControllerDelegate> delegate; // @synthesize delegate=_delegate;
@property(readonly, nonatomic) UIViewController *spotlightViewController; // @synthesize spotlightViewController=_spotlightViewController;
@property(retain, nonatomic) _UILegibilitySettings *legibilitySettings; // @synthesize legibilitySettings=_legibilitySettings;
- (void).cxx_destruct;
- (void)_updateLegibilitySettings;
- (void)setBlurProgress:(double)arg1 animated:(_Bool)arg2;
- (double)_totalDistanceForBlurTransition;
- (id)_majorScrollView;
- (id)_widgetGroupViewController;
- (double)_maxClippingOffset;
- (void)_updateContentInsetsForScrollView:(id)arg1;
- (void)_initializeWidgetViewControllerIfNecessary;
- (struct CGRect)_sugggestedTodayViewFrame;
- (void)_updateAppearanceForScrollViewsAnimated:(_Bool)arg1;
- (void)_updateAppearanceForScrollViews;
- (id)_eligibleScrollViews;
- (double)_topContentInsetForNavigationBar:(id)arg1;
- (void)dismissSearchViewWithReason:(unsigned long long)arg1;
- (void)searchFieldDidFocus;
- (void)_widgetEditViewDidDisappearImplementation;
- (void)_widgetEditViewDidDisappear:(id)arg1;
- (void)_widgetEditViewWillAppear:(id)arg1;
- (void)scrollViewDidScroll:(id)arg1;
- (void)_coverSheetDidPresent:(id)arg1;
- (void)_setRequestDisableRootFolderParallax:(_Bool)arg1 reason:(id)arg2;
- (void)_setRequestDisableRootFolderScrolling:(_Bool)arg1 reason:(id)arg2;
- (_Bool)isWidgetExtensionWithIdentifierVisible:(id)arg1;
- (void)viewWillLayoutSubviews;
- (void)setDisplayLayoutElementActive:(_Bool)arg1;
- (void)viewWillDisappear:(_Bool)arg1;
- (void)viewDidDisappear:(_Bool)arg1;
- (void)viewDidAppear:(_Bool)arg1;
- (void)viewWillAppear:(_Bool)arg1;
- (void)viewDidLoad;
- (id)initWithDelegate:(id)arg1;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

