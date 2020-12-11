Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knmKt-0006ld-2Q
 for ath11k@lists.infradead.org; Fri, 11 Dec 2020 17:36:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 07/10] ath11k: set credit_update flag for flow controlled ep
 only
Date: Fri, 11 Dec 2020 19:35:47 +0200
Message-Id: <1607708150-21066-8-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1607708150-21066-1-git-send-email-kvalo@codeaurora.org>
References: <1607708150-21066-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

From: Carl Huang <cjhuang@codeaurora.org>

Firmware will check all the pipes before entering WoW mode during suspend. If
ATH11K_HTC_FLAG_NEED_CREDIT_UPDATE is set, firmware treats this pipe needed to
return credit even though it's actually not required. If any pipe needs to
return credit, the suspend_complete message doesn't send to host but is
dropped.  So host gets time out and WoW suspend failed.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/htc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index 059b48ded5cc..54b1d34724d7 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -60,9 +60,11 @@ static void ath11k_htc_prepare_tx_skb(struct ath11k_htc_ep *ep,
 	memset(hdr, 0, sizeof(*hdr));
 	hdr->htc_info = FIELD_PREP(HTC_HDR_ENDPOINTID, ep->eid) |
 			FIELD_PREP(HTC_HDR_PAYLOADLEN,
-				   (skb->len - sizeof(*hdr))) |
-			FIELD_PREP(HTC_HDR_FLAGS,
-				   ATH11K_HTC_FLAG_NEED_CREDIT_UPDATE);
+				   (skb->len - sizeof(*hdr)));
+
+	if (ep->tx_credit_flow_enabled)
+		hdr->htc_info |= FIELD_PREP(HTC_HDR_FLAGS,
+					    ATH11K_HTC_FLAG_NEED_CREDIT_UPDATE);
 
 	spin_lock_bh(&ep->htc->tx_lock);
 	hdr->ctrl_info = FIELD_PREP(HTC_HDR_CONTROLBYTES1, ep->seq_no++);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
