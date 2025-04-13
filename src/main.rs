use console_error_panic_hook::set_once;
use leptos::prelude::*;
use thaw::*;

#[component]
pub fn App() -> impl IntoView {
    view! {
        <ConfigProvider>
            <Button appearance=ButtonAppearance::Primary>
                "Primary"
            </Button>
        </ConfigProvider>
    }
}

fn main() {
    set_once();
    // mount_to_body(|| view! { <p>"Hello, Folks"</p> })
    mount_to_body(App);
}
