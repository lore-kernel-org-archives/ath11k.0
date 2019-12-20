Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiDgq-0005NJ-Li
 for ath11k@lists.infradead.org; Fri, 20 Dec 2019 08:31:18 +0000
Received: from cjhuang-station.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3984FC433CB
 for <ath11k@lists.infradead.org>; Fri, 20 Dec 2019 08:31:12 +0000 (UTC)
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH qca6390-bringup] ath11k: fix ZERO address in probe request
Date: Fri, 20 Dec 2019 16:31:06 +0800
Message-Id: <1576830666-30661-1-git-send-email-cjhuang@codeaurora.org>
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

Host needs to pass at least on bssid with all 0xff to firmware in
WMI_START_SCAN_CMDID, otherwise the bssid and receiver address
in probe requeste are all ZEROs.

This also fixed some hidden AP connection issue because some AP
doesn't respond to probe request which receiver address are all
ZEROs.

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 4375e59..1a78002 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1842,6 +1842,9 @@ void ath11k_wmi_start_scan_init(struct ath11k *ar,
 				  WMI_SCAN_EVENT_DEQUEUED;
 	arg->scan_flags |= WMI_SCAN_CHAN_STAT_EVENT;
 	arg->num_bssid = 1;
+	/* fill bssid_list[0] with 0xff */
+	ether_addr_copy(arg->bssid_list[0].addr, "\xFF\xFF\xFF\xFF\xFF\xFF");
+
 }
 
 static inline void
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
