## VCRecursive
re-built of [PSPDFKitImproveRecursiveDescription](https://gist.github.com/3028524/57b4d0ef0eacfcaa629c6152ca212a63facd5386) for MobileSubstrate.

## Output Sample of -[UIView recursiveDescription]
<pre>
&lt;MobileSafariWindow: 0x2b0000; baseClass = UIWindow; frame = (0 0; 320 480); layer = &lt;UIWindowLayer: 0x2b0110&gt;&gt;
     | 'BrowserRootViewController:0xdeab0e0' &lt;UITransitionView: 0xdeaaba0; frame = (0 20; 320 460); clipsToBounds = YES; autoresize = W+H; layer = &lt;CALayer: 0xdeaac20&gt;&gt;
     |    | &lt;UIView: 0x2b40b0; frame = (0 0; 320 460); layer = &lt;CALayer: 0x2b4130&gt;&gt;
     |    |    | &lt;UIWebScrollView: 0x2b4230; frame = (0 0; 320 416); clipsToBounds = YES; layer = &lt;CALayer: 0x2b3300&gt;; contentOffset: {0, 0}&gt;
     |    |    |    | XX (&lt;UIImageView: 0x2b5100; frame = (0 0; 54 54); transform = [-1, 0, -0, -1, 0, 0]; alpha = 0; opaque = NO; userInteractionEnabled = NO; layer = &lt;CALayer: 0x2b5140&gt;&gt;)
</pre>

## License
MIT-License
