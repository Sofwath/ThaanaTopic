import CreateML
import Foundation

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/sofwath/Desktop/thaanatopics.csv"))

let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)
let ThaanaTopicClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "label")


let trainingAccuracy = (1.0 - ThaanaTopicClassifier.trainingMetrics.classificationError) * 100
let validationAccuracy = (1.0 - ThaanaTopicClassifier.validationMetrics.classificationError) * 100

let evaluationMetrics = ThaanaTopicClassifier.evaluation(on: testingData)
let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

do {
    print ("creating model file......")
    let metadata = MLModelMetadata(author: "Sofwath",shortDescription: "testing",version: "1.0")
    try ThaanaTopicClassifier.write(to: URL(fileURLWithPath: "/Users/sofwath/Desktop/thaana.mlmodel"),metadata: metadata)
} catch {
    print(error)
    print ("Error!!!!")
}

let evaluation = ThaanaTopicClassifier.evaluation(on: testingData)
