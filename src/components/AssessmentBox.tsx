import React from "react";
import AssessmentElement, { AssessmentElementProps } from "./AssessmentElement";

export interface AssessmentBoxProps{
    assessmentId: number[],
    boxHeader: string,
    weighting: number,
    assessmentLabels: string[],
    pointRange: number[]
}

//assessmentIds will later be handed down to AssessmentElements to identify scores for each AssessmentElement
const AssessmentBox = ({assessmentId, boxHeader, weighting ,assessmentLabels, pointRange}: AssessmentBoxProps) => {

    //rendereing AssessmentElements, one for each assessmentLabel
    const renderAssessmentElements = () => {
        const array = [];
            //loop to render individual AssessmentElements
            for (let i = 0; i<assessmentLabels.length;i++){
                array.push(<AssessmentElement assessmentID={assessmentId[i]} labelText={assessmentLabels[i]} numberButtons={pointRange[i]}/>)
            }
    
            return (array)
    }
    return(
        <div className={"AssessmentBox"}>
        <h1 className={"AssessmentBoxHeader"}>
            {boxHeader}
        </h1>
        <div>
            {renderAssessmentElements()}
        </div>
        <div>
            <p className={"AssessmentBoxWeighting"}>
                {weighting}%
            </p>
        </div>
        </div>
    )
}

export default AssessmentBox;
