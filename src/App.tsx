
import React from 'react';
import './App.css';
import { BrowserRouter } from 'react-router-dom'
import Homepage from './components/Homepage';
import Form from './components/Form';
import 'bootstrap/dist/css/bootstrap.min.css'; {/* add design with bootstrap */}

{/* Create Router and call Homepage */}
function App() {
  return (
    <>
            <BrowserRouter>
                <Homepage/>
            </BrowserRouter>
        </>
  );
}

export default App;
