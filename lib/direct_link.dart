library direct_link;

import 'actions/exp.dart';
import 'models/site_model.dart';
import 'sites/dailymotion.dart';
import 'sites/dropbox.dart';
import 'sites/facebook.dart';
import 'sites/gdrive.dart';
import 'sites/mediafire.dart';
import 'sites/megaup.dart';
import 'sites/mp4upload.dart';
import 'sites/pcloud.dart';
import 'sites/pornhub.dart';
import 'sites/solidfiles.dart';
import 'sites/twitter.dart';
import 'sites/vimeo.dart';
import 'sites/xhamster.dart';
import 'sites/xnxx.dart';
import 'sites/youtube.dart';

class DirectLink {
  /// check your link is contained in my supported sites
  static Future<List<SiteModel>> check(String url) {
    /// url RegExp format
    Exp exp = Exp();

    /// check facebook link
    if (exp.fb.hasMatch(url))
      return facebook(url);

    /// check youtube link
    else if (exp.yt.hasMatch(url))
      return youtube(url);

    /// check mediafire link
    else if (exp.mf.hasMatch(url))
      return mediafire(url);

    /// check megaup link
    else if (exp.mup.hasMatch(url))
      return megaup(url);

    /// check dropbox link
    else if (exp.db.hasMatch(url))
      return dropbox(url);

    /// check solidfiles link
    else if (exp.sf.hasMatch(url))
      return solidfiles(url);

    /// check pcloud link
    else if (exp.pc.hasMatch(url))
      return pcloud(url);

    /// check dailymotion link
    else if (exp.dm.hasMatch(url))
      return dailymotion(url);

    /// check twitter link
    else if (exp.tt.hasMatch(url))
      return twitter(url);

    /// check pornhub link
    else if (exp.ph.hasMatch(url))
      return pornhub(url);

    /// check google drive link
    else if (exp.gd.hasMatch(url))
      return gdrive(url);

    /// check xnxx link
    else if (exp.xn.hasMatch(url))
      return xnxx(url);

    /// check xnxx link
    else if (exp.xh.hasMatch(url))
      return xhamster(url);

    /// check vimeo link
    else if (exp.vi.hasMatch(url))
      return vimeo(url);

    /// check mp4upload link
    else if (exp.mu.hasMatch(url))
      return mp4upload(url);

    /// if url is not contain in my support sites return null;
    else
      return null;
  }
}
