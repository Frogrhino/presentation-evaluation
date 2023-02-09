
import React from 'react';
import { Route, Routes } from 'react-router-dom';
import { LinkContainer } from 'react-router-bootstrap';
import CreateEvaluation from './CreateEvaluation';
import Evaluation from './Evaluation';
import Form from './Form';

function Homepage() {
  return (
    <>
            
                <div style={{
                    background: 'lightblue',
                    fontSize: '20px'
                }}>
                    <div>
                        <div>
                          <h1>Presentation Evaluation</h1>
                          {/* Create Button in a LinkContainer to navigate to different pages by click*/}
                          <LinkContainer to="/CreateEvaluation"> 
                            <button className='btn btn-primary'>Create Evaluation</button>
                          </LinkContainer>
                          {/* Create Button in a LinkContainer to navigate to different pages by click*/}
                          <LinkContainer to="/Evaluation">
                            <button className='btn btn-primary'>Evaluate</button>
                          </LinkContainer>
                        </div>
                    </div>
                </div>
                <Routes>
                    {/* Define route of the different pages */}
                    <Route path="/CreateEvaluation" element={<CreateEvaluation />} />
                    <Route path="/Evaluation" element={<Evaluation />} />
                    <Route path="/Form" element={<Form />} />
                </Routes>

        </>
  );
}

export default Homepage;
