Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXsDd-0002sb-Je
 for ath11k@lists.infradead.org; Mon, 03 Jun 2019 19:02:07 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V7 0/8] ath11k: add HE support
Date: Mon,  3 Jun 2019 21:01:49 +0200
Message-Id: <20190603190157.25165-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

This series adds initial support for HE mode to the ath11k driver.

Changes in V2:
* generate sband_iftype data from FW provided capabilities
* properly handle rx_status for HE frames
* fix regression in basic VHT phymode
* various minor cleanups

Changes in V3
* make the he_cap generating code future-proof
* move phymode lookup to an array

Changes in V4
* remove dependency in local patch

Changes in V5
* populate he_oper field when preparing peer assoc
* populate ppet field when preparing peer assoc
* fix 80p80 phymode when preparing peer assoc
* address review comments

Changes in V6
* use bss_conf for storing the he_oper field
* add rate reporting

Changes in V7
* fix Beamforming and Sounding Dimension fields in PHY CAP
* use fixed size for phymode array
* add ppet cap generation code

John Crispin (8):
  mac80211: propagate HE operation info into bss_conf
  ath11k: fix some whitespace errors
  ath11k: move phymode selection from function to array lookup
  ath11k: add HE handling to the debug code
  ath11k: extend reading of FW capabilities
  ath11k: add defines for max MCS rates per phymode
  ath11k: handle rx status for HE frames
  ath11k: add HE support

 drivers/net/wireless/ath/ath11k/core.h        |  11 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |  24 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c       |  18 +-
 drivers/net/wireless/ath/ath11k/mac.c         | 370 ++++++++++++++----
 drivers/net/wireless/ath/ath11k/mac.h         |   2 +
 drivers/net/wireless/ath/ath11k/reg.c         |   1 +
 drivers/net/wireless/ath/ath11k/wmi.c         |  13 +-
 drivers/net/wireless/ath/ath11k/wmi.h         |  44 ++-
 include/net/mac80211.h                        |   2 +
 net/mac80211/he.c                             |  14 +
 net/mac80211/ieee80211_i.h                    |   4 +
 net/mac80211/mlme.c                           |   1 +
 12 files changed, 402 insertions(+), 102 deletions(-)

-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
