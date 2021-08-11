//
//  ViewController.swift
//  DemoApp
//
//  Created by Sunil Kumar on 23/07/21.
//

import UIKit
import OTDebugger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = OTDManager.shared
        manager.configure(infoTypes: [.appInfo, .translation, .uIDebug, .consoleLog, .cmsConfig, .translationDiff, .playerLog, .clearConsoleLog], dataSource: self)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func btnAction(_ sender: UIButton) {
        for i in 0...10 {
            DispatchQueue.global(qos: .default).async {
                OTDManager.shared.appendInConsoleLogFile("Sunil \(i)", logType: .console)
            }
            if i%2 == 0 {
                DispatchQueue.global(qos: .default).async {
                    OTDManager.shared.appendInConsoleLogFile("Sunil \(i)", logType: .console)
                }
            } else {
                DispatchQueue.main.async {
                    OTDManager.shared.appendInConsoleLogFile("Sunil \(i)", logType: .console)

                }
            }
            DispatchQueue.global(qos: .default).async {
                OTDManager.shared.appendInConsoleLogFile("Sunil \(i)", logType: .console)
            }
        }
        OTDManager.shared.openDebugScreen()
    }
}

extension ViewController: OTDManagerProtocol {
    func playerLog() -> OTDDetailViewControllerModel {
        return OTDDetailViewControllerModel(info: [OTDDetailModel(title: "playerLog", value: "")], url: URL(string: "abc"))
    }

    func cmsConfigLog() -> OTDDetailViewControllerModel {
        return OTDDetailViewControllerModel(info: [OTDDetailModel(title: "cmsConfigLog", value: "")], url: URL(string: "abc"))
    }

    func translationDiff() -> OTDDetailViewControllerModel {
        return OTDDetailViewControllerModel(info: [OTDDetailModel(title: "translationDiff", value: "")], url: URL(string: "abc"),zipUrl: URL(string: "zip"))
    }

    func handleTranslationKey(isEnabled: Bool) {
        
    }

    func openFlex() {

    }

    func dismiss() {
        
    }

    func basicInfo() -> OTDDetailViewControllerModel {
        var info = [OTDDetailModel]()
        info.append(OTDDetailModel(title: "App Name", value: "One TV"))
        info.append(OTDDetailModel(title: "App Version", value: "3.8.0"))
        info.append(OTDDetailModel(title: "Build Number", value: "50"))
        return OTDDetailViewControllerModel(info: info, url: nil)
    }
}

extension ViewController {
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        OTDManager.shared.openDebugScreen()
    }
}

