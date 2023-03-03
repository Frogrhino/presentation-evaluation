import React, { useState } from "react";
import { arrayBuffer } from "stream/consumers";

export interface AssessmentElementProps {
    assessmentID: number,
    labelText: string,
    numberButtons: number,
}

const AssessmentElement = ({assessmentID, labelText, numberButtons}: AssessmentElementProps) => {
    //id will later be handed down from AssessmentBox
    const [assessment, setAssessment] = useState({id: assessmentID, score: ''});

    //save input for each AssessmentElement in the state
    const handleChange = (input: string) => {
        setAssessment({...assessment, score: input});
    }

    //dynamicly rendering a specified amount of radioButtons
    const renderRadioButtons = () => {
        const array = [];
        //loop to render individual radioButtons(belonging to a radioButtonGroup named after the AssessmentElement-Text) and adding a Label with a corresponding Number
        for (let i = 0; i<numberButtons;i++){
            array.push(<input className={"AssessmentElementInput"} type={'radio'} value={i+1} name={'AssessmentRadioButtons_'+labelText} onChange={e => handleChange(e.target.value)}></input>)
            array.push(<label className={"AssessmentElementRadioLabel"}>{i+1}</label>)
        }

        return (array)
    }

    return(
    <div className={"AssessmentElement"}>
        <div>
        <label
        className='AssessmentElementLabel'>
            {labelText}
        </label>
        </div>
        <div  className={"AssessmentElementRadioGroup"}>
        {renderRadioButtons()}
        </div>
    </div>
    )
}

export default AssessmentElement;
