Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiDff-0003UO-GW
 for ath11k@lists.infradead.org; Fri, 20 Dec 2019 08:30:04 +0000
Received: from cjhuang-station.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4503FC43383
 for <ath11k@lists.infradead.org>; Fri, 20 Dec 2019 08:30:01 +0000 (UTC)
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH qca6390-bringup] ath11k: fix KASAN warning of
 ath11k_qmi_wlanfw_wlan_cfg_send
Date: Fri, 20 Dec 2019 16:29:55 +0800
Message-Id: <1576830595-30610-1-git-send-email-cjhuang@codeaurora.org>
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

It's caused by reading memory out of boundary from target_ce_config_wlan.
There is no need to read the last array element even for AHB interface, so
fix it by not reading the last array element.

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 44060b2..d0d283b 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2217,7 +2217,7 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 	req->tgt_cfg_valid = 1;
 	/* This is number of CE configs */
 	req->tgt_cfg_len = ab->qmi.ce_cfg.tgt_ce_len;
-	for (pipe_num = 0; pipe_num <= req->tgt_cfg_len ; pipe_num++) {
+	for (pipe_num = 0; pipe_num < req->tgt_cfg_len ; pipe_num++) {
 		req->tgt_cfg[pipe_num].pipe_num = ce_cfg[pipe_num].pipenum;
 		req->tgt_cfg[pipe_num].pipe_dir = ce_cfg[pipe_num].pipedir;
 		req->tgt_cfg[pipe_num].nentries = ce_cfg[pipe_num].nentries;
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
