import { Console } from "console";
import './../css/Form.css'
import React, { useEffect, useState } from "react";
import data from '../Testfiles/Data.json'
import AssessmentBox, { AssessmentBoxProps } from "./AssessmentBox";


interface FormProps{
    assessmentId: number,
    assessmentLabels: string,
    pointRanges: number,
    boxHeaders: string,
    weightings: number
}

const Form = () => {
    const [state, setState] = useState<FormProps[]>([]);

    //on call of Form the state of it will be loaded with data from the temporary data-source (Data.json)
    useEffect(() => {
        const newState = data.dataset.map(element => {
            return {assessmentId: element.assessmentId,
                    assessmentLabels: element.assessmentLabels,
                    pointRanges: element.pointRanges,
                    boxHeaders: element.boxHeaders,
                    weightings: element.weightings}
        })
        setState(newState)
    }, [])

    //rendering AssessmentBoxes, one for each unique boxHeader
    const renderAssessmentBoxes = () => {
        const checkHeader: string[] = [];
        let ids: number[] = [];
        let labels: string[] = [];
        let ranges: number[] = [];
        const returnData = [];
        //loop to render individual AssessmentBoxes
        for (let i=0;i<state.length;i++){
            if (!checkHeader.includes(state[i].boxHeaders)){
                let checkedHeader = state[i].boxHeaders
                //prepare data for each AssessmentBox
                for (let n=0;n<state.length;n++){
                    if (checkedHeader == state[n].boxHeaders){
                        ids.push(state[n].assessmentId)
                        labels.push(state[n].assessmentLabels)
                        ranges.push(state[n].pointRanges)
                    }
                }
                returnData.push(<AssessmentBox assessmentId={ids} boxHeader={state[i].boxHeaders} weighting={state[i].weightings} assessmentLabels={labels} pointRange={ranges}/>)
                ids = [];
                labels = [];
                ranges = [];
            }
            checkHeader.push(state[i].boxHeaders)
        }
        return (returnData)
    }

    return(
        <div>
            <div  className={"AssessmentBoxGroup"}>
                {renderAssessmentBoxes()}
            </div>
            <div className={"FormButtons"}>
                <button className={"FormButtonSave"}>Save</button>
                <button className={"FormButtonSubmit"}>Submit</button>
                <button className={"FormButtonExit"}>Exit</button>
            </div>
        </div>
    )
}

export default Form;
