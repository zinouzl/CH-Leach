function NetRound = newRound(numRound, packetLength, ctrPacketLength)

    if ~exist('numRound','var')
        NetRound.numRound = 9999; 
    else
        NetRound.numRound = numRound;
    end
    if ~exist('packetLength','var')
        NetRound.packetLength = 4000; 
    else
        NetRound.packetLength = packetLength;
    end
    if ~exist('ctrPacketLength','var')
        NetRound.ctrPacketLength = 4000;
    else
        NetRound.ctrPacketLength = ctrPacketLength;
    end
end