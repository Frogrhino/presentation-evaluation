import React, { useState } from "react";
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

    const getData = () => {
        data.dataset.map(element => function(element: FormProps){
            const {assessmentId, assessmentLabels, pointRanges, boxHeaders, weightings} = element;
            setState([...state, {assessmentId, assessmentLabels, pointRanges, boxHeaders, weightings}])
        })
    }
    const transformData = () => {
        
    }

    const renderAssessmentBoxes = () => {
        getData();
        const checkHeader: string[] = [];
        let ids: number[] = [];
        let labels: string[] = [];
        let ranges: number[] = [];
        const returnData = [];
        let temp: AssessmentBoxProps=  {
            assessmentId: [],
            boxHeader: "",
            weighting: 0,
            assessmentLabels: [],
            pointRange: []
        };
        for (let i=0;i<state.length;i++){
            if (!checkHeader.includes(state[i].boxHeaders)){
                let checkedHeader = state[i].boxHeaders
                for (let n=0;n<state.length;n++){
                    if (checkedHeader == state[n].boxHeaders){
                        ids.push(state[n].assessmentId)
                        labels.push(state[n].assessmentLabels)
                        ranges.push(state[n].pointRanges)
                    }
                }
                returnData.push(AssessmentBox(temp = {assessmentId: ids, boxHeader: checkedHeader, weighting: state[i].weightings, assessmentLabels: labels, pointRange: ranges}))
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
            {renderAssessmentBoxes()}
        </div>
    )
}

export default Form;