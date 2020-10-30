create:
	rm -rf build && mkdir build && \
	mkdir build/arm64 && \
	cp -rf GoogleSignIn-5.0.2/Frameworks/GoogleSignIn.framework build/arm64/GoogleSignIn.framework && \
	xcrun lipo -thin arm64 build/arm64/GoogleSignIn.framework/GoogleSignIn -output build/arm64/GoogleSignIn.framework/GoogleSignIn && \
	mkdir build/x86_64 && \
	cp -rf GoogleSignIn-5.0.2/Frameworks/GoogleSignIn.framework build/x86_64/GoogleSignIn.framework && \
	xcrun lipo -thin x86_64 build/x86_64/GoogleSignIn.framework/GoogleSignIn -output build/x86_64/GoogleSignIn.framework/GoogleSignIn && \
	xcodebuild -create-xcframework \
	-framework build/arm64/GoogleSignIn.framework \
	-framework build/x86_64/GoogleSignIn.framework \
	-output build/GoogleSignIn.xcframework && \
	cp -r build/GoogleSignIn.xcframework ../artifacts/GoogleSignIn.xcframework && \
	rm -rf build
