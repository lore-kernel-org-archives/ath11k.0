Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihGUY-0005Pv-Ek
 for ath11k@lists.infradead.org; Tue, 17 Dec 2019 17:18:39 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: mask out vht beamforming if a fixed rate is set
Date: Tue, 17 Dec 2019 18:18:27 +0100
Message-Id: <20191217171827.6780-1-john@phrozen.org>
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
Cc: Ritesh Singh <ritesi@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

From: Ritesh Singh <ritesi@codeaurora.org>

After setting a fixed vht-rate we see a FW assert if a STA tries to
(re)assoc with the mu_bfee cap set. This patch masks out the capability
bits if a fixed rate is set.

Reviewed-by: John Crispin <john@phrozen.org>
Signed-off-by: Ritesh Singh <ritesi@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b8be78dc295d..7f17d0e4cb96 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1126,6 +1126,9 @@ static void ath11k_peer_assoc_h_vht(struct ath11k *ar,
 	arg->tx_mcs_set &= ~IEEE80211_VHT_MCS_SUPPORT_0_11_MASK;
 	arg->tx_mcs_set |= IEEE80211_DISABLE_VHT_MCS_SUPPORT_0_11;
 
+	if ((arg->tx_mcs_set & 0x3) == 0x3)
+		arg->peer_vht_caps &= ~IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
+
 	/* TODO:  Check */
 	arg->tx_max_mcs_nss = 0xFF;
 
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
