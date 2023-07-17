import 'package:flutter/material.dart';

import 'style.dart';

// True Anaglyph
const trueAnaglyphLeftChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0.299, 0.587, 0.114, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);
const trueAnaglyphRightChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0, 0, 0, 0, 0, //
      0, 0, 0, 0, 0, //
      0.299, 0.587, 0.114, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);

// Gray (mono)
const monoLeftChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0.299, 0.587, 0.113, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);
const monoRightChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0, 0, 0, 0, 0, //
      0.299, 0.587, 0.114, 0, 0, //
      0.299, 0.587, 0.114, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);

// True Color
const trueColorLeftChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      1, 0, 0, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);
const trueColorRightChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0, 0, 0, 0, 0, //
      0, 1, 0, 0, 0, //
      0, 0, 1, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);

const bestColorLeftChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0.4155, 0.4710, 0.1670, 0, 0, //
      -0.0458, -0.0484, -0.0258, 0, 0, //
      -0.0545, -0.0614, 0.0128, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);
const bestColorRightChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      -0.0109, -0.0365, -0.0060, 0, 0, //
      0.3756, 0.7333, 0.0111, 0, 0, //
      -0.0651, -0.1287, 1.2968, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);
