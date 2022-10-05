function slBusOut = Float64(msgIn, slBusOut, varargin)
%#codegen
%   Copyright 2021 The MathWorks, Inc.
    slBusOut.data = double(msgIn.data);
end
