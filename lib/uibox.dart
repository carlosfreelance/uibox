library uibox;

import 'src/utils/device.dart';
import 'src/utils/screen.dart';

export 'src/utils/device.dart';
export 'src/utils/extensions.dart';
export 'src/utils/screen.dart';

export 'src/widgets/widgets.dart';

class UIBOX with Screen {
  static Screen get screen => Screen();
  static Device get device => Device();
}
