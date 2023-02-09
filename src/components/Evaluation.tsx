import { FunctionComponent } from "react";
import { Route, Routes } from "react-router";
import { LinkContainer } from "react-router-bootstrap";
import Form from "./Form";

 
const Evaluation = () => {
  return (
    <>
    <div>
    <h1>Access Evaluation</h1>
    <label htmlFor="">Enter Code: </label>
    <input className="code" type="text" />
    <LinkContainer to="/Form">
      <button className='btn btn-primary'>Start</button>
    </LinkContainer>
  </div>
  <Routes>
    {/* Define route of the different pages */}
    <Route path="/Form" element={<Form />} />
  </Routes>
    </>
  
);
}
 
export default Evaluation;