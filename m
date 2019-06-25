Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfcq6-0003I5-ET
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 04:13:51 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH 5/5] ath11k: fix brace warning
Date: Tue, 25 Jun 2019 09:43:19 +0530
Message-Id: <1561435999-28316-5-git-send-email-periyasa@codeaurora.org>
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

drivers/net/wireless/ath/ath11k/dp_rx.c:1287: that open brace { should be on the previous line

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 0158f90..7d49b3f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1284,8 +1284,7 @@ static void ath11k_htt_pktlog(struct ath11k_base *ab, struct sk_buff *skb)
 
 	len = FIELD_GET(HTT_T2H_PPDU_STATS_INFO_PAYLOAD_SIZE, data->hdr);
 
-	if (len > ATH11K_HTT_PKTLOG_MAX_SIZE)
-	{
+	if (len > ATH11K_HTT_PKTLOG_MAX_SIZE) {
 		ath11k_warn(ab, "htt pktlog buffer size %d, expected < %d\n",
 			    len,
 			    ATH11K_HTT_PKTLOG_MAX_SIZE);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
