Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5sFS-0007tf-HP
 for ath11k@lists.infradead.org; Wed, 12 Aug 2020 15:01:04 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V3 0/9] mac80211: add multiple bssid / EMA
Date: Wed, 12 Aug 2020 17:00:41 +0200
Message-Id: <20200812150050.2683396-1-john@phrozen.org>
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

This series addss multiple bssid and EMA beacons.

The V3 series has a lot of changes to V2. The biggest being the added
support for EMA. As we might have HW that can offload this we need to
pass the multiple bssid elements to the kernel. This gives us a lot of
flexibility for supporting different hardware.

John Crispin (9):
  nl80211: add basic multiple bssid support
  mac80211: add multiple bssid support to interface handling
  mac80211: add multiple bssid support to beacon handling
  mac80211: add multiple bssid/ema support to bcn templating
  ath11k: add a struct to pass parameters into ath11k_wmi_vdev_up
  ath11k: add the multiple bssid WMI commands
  ath11k: add multiple bssid support to device creation
  ath11k: add EMA beacon support
  ath11k: set the multiple bssid hw flags and capabilities

 drivers/net/wireless/ath/ath11k/mac.c |  83 ++++++++++++++++---
 drivers/net/wireless/ath/ath11k/wmi.c |  20 +++--
 drivers/net/wireless/ath/ath11k/wmi.h |  22 ++++-
 include/net/cfg80211.h                |  35 ++++++++
 include/net/mac80211.h                |  42 +++++++++-
 include/uapi/linux/nl80211.h          |  22 +++++
 net/mac80211/cfg.c                    | 113 +++++++++++++++++++++++++-
 net/mac80211/debugfs.c                |   1 +
 net/mac80211/ieee80211_i.h            |   2 +
 net/mac80211/iface.c                  |   7 ++
 net/mac80211/tx.c                     |  49 ++++++++++-
 net/wireless/nl80211.c                |  40 +++++++++
 12 files changed, 408 insertions(+), 28 deletions(-)

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
