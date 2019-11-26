Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZYeP-0003a6-FT
 for ath11k@lists.infradead.org; Tue, 26 Nov 2019 11:04:59 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 06/10] ath11k: avoid WMM param truncation
Date: Tue, 26 Nov 2019 11:04:53 +0000
Message-ID: <0101016ea762afe6-cae7bcb7-d8ef-4e4d-a0c4-ebda88974c0a-000000@us-west-2.amazonses.com>
In-Reply-To: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
References: <1574766279-13105-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: Karthikeyan Periyasamy <periyasa@codeaurora.org>

In conf_tx() mac operation callback, we are truncating the tx
params cw_min and cw_max due to lower data type cast. so modified
the data type of cwmin and cwmax to avoid the trucation issue.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 6a0468094694..4a518d406bc5 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4501,8 +4501,8 @@ struct wmi_wmm_params {
 struct wmi_wmm_params_arg {
 	u8 acm;
 	u8 aifs;
-	u8 cwmin;
-	u8 cwmax;
+	u16 cwmin;
+	u16 cwmax;
 	u16 txop;
 	u8 no_ack;
 };
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
