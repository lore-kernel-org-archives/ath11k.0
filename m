Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPPuY-0000Uq-5r
 for ath11k@lists.infradead.org; Tue, 29 Oct 2019 11:43:43 +0000
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: [PATCH 0/2] add Wide Band Scan support
Date: Tue, 29 Oct 2019 17:13:23 +0530
Message-Id: <1572349405-4653-1-git-send-email-murugana@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Sathishkumar Muruganandam <murugana@codeaurora.org>

Wide Band Scan allows to perform off-channel scan on requested channel/
frequency along with corresponding phy mode/bandwidth (40Mhz, 80Mhz).

Sathishkumar Muruganandam (2):
  nl80211: add Wide Band Scan support

 include/net/cfg80211.h       |  2 ++
 include/uapi/linux/nl80211.h |  7 +++++
 net/mac80211/scan.c          |  2 ++
 net/wireless/nl80211.c       | 68 ++++++++++++++++++++++++++++----------------
 4 files changed, 55 insertions(+), 24 deletions(-)

  ath11k: add Wide Band Scan support

 drivers/net/wireless/ath/ath11k/mac.c |  41 ++++++++++--
 drivers/net/wireless/ath/ath11k/wmi.c | 115 +++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/wmi.h |  34 +++++++++-
 3 files changed, 175 insertions(+), 15 deletions(-)

-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
