Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgk0o-0000GH-Fo
 for ath11k@lists.infradead.org; Thu, 04 Jun 2020 07:10:04 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 00/12] mac80211: add multiple bssid support
Date: Thu,  4 Jun 2020 09:09:40 +0200
Message-Id: <20200604070952.15481-1-john@phrozen.org>
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

Multiple bssid allows us to share a single beacon amongst several VAPs.
This essentially safes airtime. This feature is achieved by adding an
additional IE to the transmitting VAPs beacon. This new IE contains
the additional SSIDs and their non-inheritance information.

This series is still missing handling for TIM, which will be sent in a
follow-up series.

John Crispin (12):
  nl80211: add basic multiple bssid support
  nl80211: add attributes for multiple bssid related settings
  nl80211: add attributes to set beacon transmit mode
  mac80211: add multiple bssid support
  mac80211: add multiple bssid IE parsing
  mac80211: propagate multi bssid settings when starting an AP
  mac80211: propagate beacon tx mode to the driver
  ath11k: pass multiple bssid info to FW when a new vdev is created
  ath11k: add a struct to pass parameters into ath11k_wmi_vdev_up
  ath11k: add the multiple bssid IE offset to the beacon template
  ath11k: set beacon tx mode
  ath11k: set the multiple bssid hw cap

 drivers/net/wireless/ath/ath11k/mac.c | 72 ++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/wmi.c | 20 +++++---
 drivers/net/wireless/ath/ath11k/wmi.h | 22 +++++++-
 include/net/cfg80211.h                | 23 +++++++++
 include/net/mac80211.h                | 29 +++++++++++
 include/uapi/linux/nl80211.h          | 49 ++++++++++++++++++
 net/mac80211/cfg.c                    | 64 ++++++++++++++++++++++++
 net/mac80211/ieee80211_i.h            |  2 +
 net/mac80211/iface.c                  | 16 ++++++
 net/mac80211/tx.c                     | 10 ++++
 net/mac80211/util.c                   | 31 ++++++++++++
 net/wireless/nl80211.c                | 36 ++++++++++++++
 12 files changed, 358 insertions(+), 16 deletions(-)

-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
