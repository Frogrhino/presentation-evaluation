import React, { useState } from "react";
import { arrayBuffer } from "stream/consumers";

export interface AssessmentElementProps {
    labelText: string,
    numberButtons: number,
}

const AssessmentElement = ({labelText, numberButtons}: AssessmentElementProps) => {
    const [assessment, setAssessment] = useState({id: '', score: ''});

    const handleChange = (input: string) => {
        console.log(input)
        setAssessment({...assessment, score: input});
    }

    const renderRadioButtons = () => {
        const array = [];
        for (let i = 0; i<numberButtons;i++){
            array.push(<input type={'radio'} value={i+1} name='AssessmentRadioButtons' onChange={e => handleChange(e.target.value)}></input>)
            array.push(<label>{i+1}</label>)
        }

        return (array)
    }

    return(
    <div>
        <label
        className='assessmentLabel'>
            {labelText}
        </label>
        {renderRadioButtons()}
    </div>
    )
}

export default AssessmentElement;