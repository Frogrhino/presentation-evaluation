import React from "react";
import AssessmentElement, { AssessmentElementProps } from "./AssessmentElement";

export interface AssessmentBoxProps{
    assessmentId: number[],
    boxHeader: string,
    weighting: number,
    assessmentLabels: string[],
    pointRange: number[]
}

const AssessmentBox = ({assessmentId, boxHeader, weighting ,assessmentLabels, pointRange}: AssessmentBoxProps) => {

    const renderAssessmentElements = () => {
        let temp: AssessmentElementProps=  {
            labelText: "",
            numberButtons: 0
        };
        const array = [];
            for (let i = 0; i<assessmentLabels.length;i++){
                array.push(AssessmentElement(temp = {labelText: assessmentLabels[i], numberButtons: pointRange[i]}))
            }
    
            return (array)
    }
    return(
        <>
        <h1>
            {boxHeader}
        </h1>
        <div>
            {renderAssessmentElements()}
        </div>
        <div>
            <p>
                {weighting}%
            </p>
        </div>
        </>
    )
}

export default AssessmentBox;
