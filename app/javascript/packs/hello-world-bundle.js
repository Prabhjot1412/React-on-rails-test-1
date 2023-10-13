import ReactOnRails from 'react-on-rails';

import HelloWorld from '../bundles/HelloWorld/components/HelloWorld';
import MyJsComp from '../bundles/MyJsComp/components/MyJsComp';
import RegistrationForm from '../bundles/UserLogin/components/RegistrationForm';
import Navbar from '../bundles/Navbar/components/Navbar';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  HelloWorld,
  MyJsComp,
  RegistrationForm,
  Navbar
});
