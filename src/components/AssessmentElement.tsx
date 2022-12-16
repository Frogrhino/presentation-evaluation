import React, { useState } from "react";
import { arrayBuffer } from "stream/consumers";

export interface AssessmentElementProps {
    labelText: string,
    numberButtons: number,
}

const AssessmentElement = ({labelText, numberButtons}: AssessmentElementProps) => {
    //id will later be handed down from AssessmentBox
    const [assessment, setAssessment] = useState({id: '', score: ''});

    //save input for each AssessmentElement in the state
    const handleChange = (input: string) => {
        setAssessment({...assessment, score: input});
    }

    //dynamicly rendering a specified amount of radioButtons
    const renderRadioButtons = () => {
        const array = [];
        //loop to render individual radioButtons(belonging to a radioButtonGroup named after the AssessmentElement-Text) and adding a Label with a corresponding Number
        for (let i = 0; i<numberButtons;i++){
            array.push(<input type={'radio'} value={i+1} name={'AssessmentRadioButtons_'+labelText} onChange={e => handleChange(e.target.value)}></input>)
            array.push(<label>{i+1}</label>)
        }

        return (array)
    }

    return(
    <div>
        <div>
        <label
        className='assessmentLabel'>
            {labelText}
        </label>
        </div>
        <div>
        {renderRadioButtons()}
        </div>
    </div>
    )
}

export default AssessmentElement;