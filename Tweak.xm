static BOOL PSPDFIsVisibleView(UIView *view) {
  BOOL isViewHidden = view.isHidden || view.alpha == 0 || CGRectIsEmpty(view.frame);
  return !view || (PSPDFIsVisibleView(view.superview) && !isViewHidden);
}

%hook UIView
- (NSMutableString *)description {
  NSMutableString *description = %orig;
  SEL viewDelegateSEL = @selector(_viewDelegate);//NSSelectorFromString([NSString stringWithFormat:@"%@ewDelegate", @"_vi"]); // pr. API
  if ([self respondsToSelector:viewDelegateSEL]) {
    UIViewController *viewController = [self performSelector:viewDelegateSEL];
    NSString *viewControllerClassName = NSStringFromClass([viewController class]);

    if ([viewControllerClassName length]) {
      NSString *children = @""; // iterate over childViewControllers

      if ([viewController respondsToSelector:@selector(childViewControllers)] && [viewController.childViewControllers count]) {
        NSString *origDescription = description;
        description = [NSMutableString stringWithFormat:@"%d child[", [viewController.childViewControllers count]];
        for (UIViewController *childViewController in viewController.childViewControllers) {
          [description appendFormat:@"%@:%p ", NSStringFromClass([childViewController class]), childViewController];
        }
        [description appendFormat:@"] %@", origDescription];
      }

      // check if the frame of a childViewController is bigger than the one of a parentViewController. (usually this is a bug)
      NSString *warnString = @"";
      if (viewController && viewController.parentViewController && [viewController isViewLoaded] && [viewController.parentViewController isViewLoaded]) {
        CGRect parentRect = viewController.parentViewController.view.bounds;
        CGRect childRect = viewController.view.frame;

        if (parentRect.size.width < childRect.origin.x + childRect.size.width ||
            parentRect.size.height < childRect.origin.y + childRect.size.height) {
          warnString = @"* OVERLAP! ";
        }else if(CGRectIsEmpty(childRect)) {
          warnString = @"* ZERORECT! " ;
        }
      }
      description = [NSMutableString stringWithFormat:@"%@'%@:%p'%@ %@", warnString, viewControllerClassName, viewController, children, description];
    }
  }

  // add marker if view is hidden.
  if (!PSPDFIsVisibleView(self)) {
    description = [NSMutableString stringWithFormat:@"XX (%@)", description];
  }

  return description;
}
%end
