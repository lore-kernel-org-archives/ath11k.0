Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfcq4-0003HD-S8
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 04:13:50 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH 4/5] ath11k: avoid min() warning
Date: Tue, 25 Jun 2019 09:43:18 +0530
Message-Id: <1561435999-28316-4-git-send-email-periyasa@codeaurora.org>
In-Reply-To: <1561435999-28316-1-git-send-email-periyasa@codeaurora.org>
References: <1561435999-28316-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

drivers/net/wireless/ath/ath11k/mac.c:4921: min() should probably be min_t(u32, ar->num_tx_chains, max(ath11k_mac_max_ht_nss(ht_mcs_mask),

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7a6c927..1c437b2 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4920,9 +4920,9 @@ static void ath11k_mac_disable_peer_fixed_rate(void *data,
 		nss = single_nss;
 	} else {
 		rate = WMI_FIXED_RATE_NONE;
-		nss = min((u32)ar->num_tx_chains,
-			  max(ath11k_mac_max_ht_nss(ht_mcs_mask),
-			      ath11k_mac_max_vht_nss(vht_mcs_mask)));
+		nss = min_t(u32, ar->num_tx_chains,
+			    max(ath11k_mac_max_ht_nss(ht_mcs_mask),
+				ath11k_mac_max_vht_nss(vht_mcs_mask)));
 
 		/* If multiple rates across different preambles are given
 		 * we can reconfigure this info with all peers using PEER_ASSOC
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
