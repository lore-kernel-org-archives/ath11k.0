Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfcq3-0003G5-E9
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 04:13:48 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH 3/5] ath11k: fix space related warnings
Date: Tue, 25 Jun 2019 09:43:17 +0530
Message-Id: <1561435999-28316-3-git-send-email-periyasa@codeaurora.org>
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

drivers/net/wireless/ath/ath11k/dp.h:1482: Please don't use multiple blank lines
drivers/net/wireless/ath/ath11k/dp_rx.c:1072: code indent should use tabs where possible
drivers/net/wireless/ath/ath11k/dp_rx.c:1075: code indent should use tabs where possible
drivers/net/wireless/ath/ath11k/wmi.c:2321: "(foo*)" should be "(foo *)"

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.h    | 1 -
 drivers/net/wireless/ath/ath11k/dp_rx.c | 4 ++--
 drivers/net/wireless/ath/ath11k/wmi.c   | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index d533d7e..bda5ac2 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1482,7 +1482,6 @@ struct ath11k_htt_extd_stats_msg {
 	u8 data[0];
 } __packed;
 
-
 struct htt_mac_addr {
 	u32 mac_addr_l32;
 	u32 mac_addr_h16;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 17be3cc..0158f90 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1069,10 +1069,10 @@ static u32 ath11k_bw_to_mac80211_bwflags(u8 bw)
 	mcs = HTT_USR_RATE_MCS(user_rate->rate_flags);
 	sgi = HTT_USR_RATE_GI(user_rate->rate_flags);
 
-        /* Note: If host configured fixed rates and in some other special
+	/* Note: If host configured fixed rates and in some other special
 	 * cases, the broadcast/management frames are sent in different rates.
 	 * Firmware rate's control to be skipped for this?
-         */
+	 */
 
 	if (flags == WMI_RATE_PREAMBLE_VHT && mcs > 9) {
 		ath11k_warn(ab, "Invalid VHT mcs %hhd peer stats",  mcs);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 085ee32..f56db77 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2318,7 +2318,7 @@ int ath11k_wmi_pdev_peer_pktlog_filter(struct ath11k *ar, u8 *addr, u8 enable)
 		      FIELD_PREP(WMI_TLV_LEN, 0);
 
 	ptr += TLV_HDR_SIZE;
-	info = (struct wmi_pdev_pktlog_filter_info*)ptr;
+	info = (struct wmi_pdev_pktlog_filter_info *)ptr;
 
 	ether_addr_copy(info->peer_macaddr.addr, addr);
 	info->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_PEER_PKTLOG_FILTER_INFO) |
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
