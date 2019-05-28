Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVk1o-0003vf-T6
 for ath11k@lists.infradead.org; Tue, 28 May 2019 21:53:06 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH 0/4] ath11k: enable 11s secured mesh support
Date: Tue, 28 May 2019 14:52:52 -0700
Message-Id: <1559080376-26817-1-git-send-email-pradeepc@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

In case of PMF, multicast/broadcast action frames and unicast action
frames differ in processing. This patch series fixes the same in tx and
rx path which is required for 11s secured mesh path establishment and
data traffic on ath11k.

Pradeep Kumar Chitrapu (4):
  ath11k: reset qos control bit after stripping qos field in
    iee80211_hdr
  ath11k: pad mic len for protected action frames
  ath11k: fix multicast txrx for secure 11s mesh support
  ath11k: fix action frame rx processing

 drivers/net/wireless/ath/ath11k/dp_tx.c |  1 +
 drivers/net/wireless/ath/ath11k/mac.c   | 16 ++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.c   | 15 +++++++++------
 3 files changed, 26 insertions(+), 6 deletions(-)

-- 
2.1.2


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
