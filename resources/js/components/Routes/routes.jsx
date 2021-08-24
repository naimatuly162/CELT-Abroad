import Welcome from "../Views/welcome/WelcomeComponent";
import Profile from "../Views/profile/ProfileComponent";

const routes = [
    {
        path: "/",
        exact: true,
        auth: false,
        verify: false,
        component: Welcome,
        bannerTitle: "Welcome"
    },
    {
        path: "/profile",
        exact: true,
        auth: true,
        verify: true,
        component: Profile,
        bannerTitle: "Profile"
    }
];

export default routes;
