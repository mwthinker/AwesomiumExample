#include "application.h"
#include "view.h"

#include <Awesomium/WebCore.h>
#include <Awesomium/STLHelpers.h>

#ifdef _WIN32
#include <Windows.h>
#endif

using namespace Awesomium;

class TutorialApp : public Application::Listener {
public:
	TutorialApp() : app_(Application::Create()),
		view_(0) {
		app_->set_listener(this);
	}

	virtual ~TutorialApp() override {
		if (view_)
			app_->DestroyView(view_);
		if (app_)
			delete app_;
	}

	void Run() {
		app_->Run();
	}

	// Inherited from Application::Listener
	virtual void OnLoaded() override {
		view_ = View::Create(500, 300);
		// < Set up your View here. >

		WebURL url(WSLit("file:///app.html"));
		view_->web_view()->LoadURL(url);
	}

	// Inherited from Application::Listener
	virtual void OnUpdate() override {
	}

	// Inherited from Application::Listener
	virtual void OnShutdown() override {
	}

private:
	Application* app_;
	View* view_;
};

#ifdef _WIN32
int APIENTRY wWinMain(HINSTANCE hInstance, HINSTANCE, wchar_t*,
	int nCmdShow) {
	#else
int main() {
	#endif

	TutorialApp app;
	app.Run();

	return 0;
}
