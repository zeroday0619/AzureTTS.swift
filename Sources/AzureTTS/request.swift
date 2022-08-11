import Foundation
import FoundationNetworking


let issueTokenUrl: String = "https://koreacentral.api.cognitive.microsoft.com/sts/v1.0/issueToken"
var cognitiveServicesUrl :String = "https://koreacentral.tts.speech.microsoft.com/cognitiveservices"

// let voiceListUrl = URL(string: cognitiveServicesUrl + "/voices/list")!
// environment variables


public func getAccessToken() -> String? {
    var result_dev = String()
    let url = URL(string: issueTokenUrl)!
    var request = URLRequest(url: url)


    guard let subscriptionKey = getEnvironmentVariables(name: "ms_key") else {
        return nil
    }

    request.httpMethod = "GET"
    request.setValue("Ocp-Apim-Subscription-Key", forHTTPHeaderField:subscriptionKey)

    URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard error == nil else {
            print(error!)
            return
        }
        guard let data = data else {
            return
        }
        guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
            return
        }
        guard let result = String(data: data, encoding: .utf8) else {
            return
        }
        result_dev = result
     }.resume()
    return result_dev
}
