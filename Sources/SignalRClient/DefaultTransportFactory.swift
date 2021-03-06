//
//  DefaultTransportFactory.swift
//  SignalRClient
//
//  Created by Pawel Kadluczka on 8/22/18.
//  Copyright © 2018 Pawel Kadluczka. All rights reserved.
//

import Foundation

open class DefaultTransportFactory: TransportFactory {
    let logger: Logger

    init(logger: Logger) {
        self.logger = logger
    }

    open func createTransport(availableTransports: [TransportDescription]) throws -> Transport {
        for transport in availableTransports {
            if transport.transportType == .webSockets {
                return PingingWebsocketsTransport(logger: logger)
            }
        }

        throw SignalRError.noSupportedTransportAvailable
    }
}
