library uibox;

export 'src/constants/enums.dart';

import 'src/utils/device.dart';
import 'src/utils/screen.dart';

export 'src/utils/device.dart';
export 'src/utils/extensions.dart';
export 'src/utils/screen.dart';
export 'src/class/animator.dart';

export 'src/widgets/widgets.dart';

export 'src/animations/uibox_bounce_animation.dart';
export 'src/animations/uibox_fade_in_animation.dart';
export 'src/animations/uibox_fade_out_animation.dart';
export 'src/animations/uibox_flip_animation.dart';
export 'src/animations/uibox_slide_animation.dart';
export 'src/animations/uibox_zoom_animation.dart';
export 'src/animations/uibox_color_tween_widget.dart';

export 'src/extensions/extensions.dart';

class UIBOX with Screen {
  static Screen get screen => Screen();
  static Device get device => Device();
}
