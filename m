Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hmgg0-0006bB-D0
 for ath11k@lists.infradead.org; Sun, 14 Jul 2019 15:44:37 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 0/6] mac80211: add HE TX rate reporting to radiotap
Date: Sun, 14 Jul 2019 17:44:13 +0200
Message-Id: <20190714154419.11854-1-john@phrozen.org>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Right now struct ieee80211_tx_rate cannot hold HE rates. Lets extend
struct ieee80211_tx_status instead and use ieee80211_tx_status_ext()
to propagate the information to the subsystem.

John Crispin (6):
  mac80211: add xmit rate to struct ieee80211_tx_status
  mac80211: propagate struct ieee80211_tx_status into
    ieee80211_tx_monitor()
  mac80211: add struct ieee80211_tx_status support to
    ieee80211_add_tx_radiotap_header
  ath11k: drop tx_info from ath11k_sta
  ath11k: add HE rate accounting to driver
  ath11k: switch to using ieee80211_tx_status_ext()

 drivers/net/wireless/ath/ath11k/core.h        |   3 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |   7 +
 drivers/net/wireless/ath/ath11k/dp.h          |   9 +
 drivers/net/wireless/ath/ath11k/dp_rx.c       |  82 ++++----
 drivers/net/wireless/ath/ath11k/dp_tx.c       |  20 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c      |  13 +-
 drivers/net/wireless/ath/ath11k/hal_rx.h      |  30 +++
 drivers/net/wireless/ath/ath11k/rx_desc.h     |   8 +
 include/net/mac80211.h                        |   2 +
 net/mac80211/ieee80211_i.h                    |   3 +-
 net/mac80211/status.c                         | 180 ++++++++++++++++--
 net/mac80211/tx.c                             |   3 +-
 12 files changed, 291 insertions(+), 69 deletions(-)

-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
