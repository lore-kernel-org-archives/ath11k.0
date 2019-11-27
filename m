Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZy05-0002Ij-VZ
 for ath11k@lists.infradead.org; Wed, 27 Nov 2019 14:09:03 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 09/10] ath11k: unlock mutex during failure in qmi fw ready
Date: Wed, 27 Nov 2019 14:08:59 +0000
Message-ID: <0101016ead319970-31b3e949-b44d-4bb5-93f4-a0e7cce35c47-000000@us-west-2.amazonses.com>
In-Reply-To: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
References: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
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

From: Govindaraj Saminathan <gsamin@codeaurora.org>

qmi firmware ready event start to initialize the core modules and
the sequence executed with mutex lock. In case of any failure
mutex should be unlocked otherwise it will hang during the recovery.

Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index b0c71b5879b1..37d4ecb458db 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -539,6 +539,7 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 	ath11k_core_stop(ab);
 err_dp_free:
 	ath11k_dp_free(ab);
+	mutex_unlock(&ab->core_lock);
 	return ret;
 }
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
