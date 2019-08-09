Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1B0-0000oG-5U
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:27:11 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3595160E40
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:27:07 +0000 (UTC)
Subject: [PATCH 08/15] ath11k: remove box comments
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:27:06 +0300
Message-ID: <156534282589.30736.16735947611604984953.stgit@x230>
In-Reply-To: <156534276745.30736.11736417077894270794.stgit@x230>
References: <156534276745.30736.11736417077894270794.stgit@x230>
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
To: ath11k@lists.infradead.org

They easily get outdated so better to remove them altogether.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/htc.c |   12 ------------
 drivers/net/wireless/ath/ath11k/mac.c |    4 ----
 2 files changed, 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index 8becedd006f8..fd8444f845a5 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -25,10 +25,6 @@ struct sk_buff *ath11k_htc_alloc_skb(struct ath11k_base *ab, int size)
 	return skb;
 }
 
-/********/
-/* Send */
-/********/
-
 static void ath11k_htc_control_tx_complete(struct ath11k_base *ab,
 					   struct sk_buff *skb)
 {
@@ -153,10 +149,6 @@ int ath11k_htc_send(struct ath11k_htc *htc,
 	return ret;
 }
 
-/***********/
-/* Receive */
-/***********/
-
 static void
 ath11k_htc_process_credit_report(struct ath11k_htc *htc,
 				 const struct ath11k_htc_credit_report *report,
@@ -375,10 +367,6 @@ static void ath11k_htc_control_rx_complete(struct ath11k_base *ab,
 	kfree_skb(skb);
 }
 
-/***************/
-/* Init/Deinit */
-/***************/
-
 static const char *htc_service_name(enum ath11k_htc_svc_id id)
 {
 	switch (id) {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index dc9f5f98f880..25c9104afc96 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1774,10 +1774,6 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 	mutex_unlock(&ar->conf_mutex);
 }
 
-/************/
-/* Scanning */
-/************/
-
 void __ath11k_mac_scan_finish(struct ath11k *ar)
 {
 	lockdep_assert_held(&ar->data_lock);


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
