Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVacK-0003rs-L3
 for ath11k@lists.infradead.org; Tue, 28 May 2019 11:50:11 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V2 0/6] mac80211: HE: add TWT and SPR/OBSSPD support
Date: Tue, 28 May 2019 13:49:46 +0200
Message-Id: <20190528114952.838-1-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

This series adds support for propagating the TWT and OBSS PD information
from userland/assocs to a wireless driver. The patches for making use of
these features inside ath11k are also included.

I already have the hostapd patches ready and will send them once these
changes are inside nl80211.h.

Changes in V2
* always use bss_conf as per request from Johannes

John Crispin (6):
  mac80211: dynamically enable the TWT requester support on STA
    interfaces
  mac80211: allow turning TWT responder support on and off via netlink
  ath11k: add TWT support
  mac80211: HE: add Spatial Reuse IE parsing support
  mac80211: allow setting spatial reuse parameters from bss_conf
  ath11k: add spatial reuse support

 drivers/net/wireless/ath/ath11k/mac.c |  22 +++++
 drivers/net/wireless/ath/ath11k/wmi.c | 126 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h |  87 ++++++++++++++++++
 include/linux/ieee80211.h             |  49 ++++++++++
 include/net/cfg80211.h                |  17 ++++
 include/net/mac80211.h                |   9 ++
 include/uapi/linux/nl80211.h          |  31 +++++++
 net/mac80211/cfg.c                    |   7 +-
 net/mac80211/he.c                     |  24 +++++
 net/mac80211/ieee80211_i.h            |   4 +
 net/mac80211/mlme.c                   |  19 +++-
 net/mac80211/util.c                   |   4 +
 net/wireless/nl80211.c                |  47 ++++++++++
 13 files changed, 443 insertions(+), 3 deletions(-)

-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
