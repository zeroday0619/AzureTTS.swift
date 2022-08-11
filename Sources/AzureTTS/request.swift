import Foundation
import FoundationNetworking


let issueTokenUrl = "https://koreacentral.api.cognitive.microsoft.com/sts/v1.0/issueToken"

var cognitiveServicesUrl :String = "https://koreacentral.tts.speech.microsoft.com/cognitiveservices"

let voiceListUrl = URL(string: cognitiveServicesUrl + "/voices/list")!


func getAccessToken(subscriptionKey: String) {
    let url = URL(string: issueTokenUrl)!
    var request = URLRequest(url: url)

    request.httpMethod = "GET"
    request.setValue("Ocp-Apim-Subscription-Key", forHTTPHeaderField:"")

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
        var result = String(data: data, encoding: .utf8)
        return result
     }.resume()
}
