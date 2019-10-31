Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ9Wf-0005Qp-Rf
 for ath11k@lists.infradead.org; Thu, 31 Oct 2019 12:26:07 +0000
From: Govindaraj Saminathan <gsamin@codeaurora.org>
Subject: [PATCH] ath11k: unlock mutex during failure in qmi fw ready
Date: Thu, 31 Oct 2019 17:55:47 +0530
Message-Id: <1572524747-25843-1-git-send-email-gsamin@codeaurora.org>
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
Cc: Govindaraj Saminathan <gsamin@codeaurora.org>

qmi firmware ready event start to initialize the core modules and
the sequence executed with mutex lock. In case of any failure
mutex should be unlocked otherwise it will hang during the recovery.

Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 9324dcb..d2dd0ba 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -531,6 +531,7 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 	ath11k_core_stop(ab);
 err_dp_free:
 	ath11k_dp_free(ab);
+	mutex_unlock(&ab->core_lock);
 	return ret;
 }
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
