Return-Path: <SRS0=KMo3=OD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D08C433EF
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:09:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 175F960EE9
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 175F960EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uIk1SlVFO3flb03OSEnhhWiFtQiVBLPCUN97RqBDJY=; b=D4neqagWtxzJn8
	3EWXljYLUqBER4rdHv/L6+FUe4o54Rrq9oAJ3p2TBdOSn8zkUrEeFzWH82NEl9biezyZC4PYNk8hV
	vU9+tSeUZiyXuW6ONW7seu+2KL54j7YgfuppAuM1/NAngS0sc0NTpcf7lJfPap9NL10BC9xlBFG8x
	8b8QJnIpb8AbZsdQ1sTIu3HUmilkRJ9kn8W/APTikLCNnVHIMXiAcnqYGS1uZMNfFYb9viH0woU+5
	z0gqzPcNqC6E4usQblU9SGfb87w9VdwgpezTPeKQpWw+Ty5yojR8TvivNUlJGm9T5SD/TkQ71CuaJ
	aLtKpjRmlhiCeT0EqD4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPqOh-002tcL-72; Mon, 13 Sep 2021 18:09:39 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPqOb-002taL-Jz
 for ath11k@lists.infradead.org; Mon, 13 Sep 2021 18:09:37 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631556576; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=BLE6MJvE6Ge/ZSJDBxa44b+Ojdm9my70K8ySPLhKbhE=;
 b=JxsOZzg4af863kWAQ1ikpFxw0YWTgnMbK5Id/mdHINbQVRdpRw/41D33mH/affc0zqzcawEq
 EiAT8aQ5ju0fuIUHEt64HGa0f4a1myaAakz+9Tl5WE6EbdD2cYPNdJDdlW4c7vhe6+i0qbd3
 C4K4ZzjHbntf8Jdm2jYJJfbn6vw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 613f93d0d914b05182722e4d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 18:09:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F3EC3C4360C; Mon, 13 Sep 2021 18:09:19 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 29189C43616;
 Mon, 13 Sep 2021 18:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 29189C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 2/3] ath11k: Move pdev debugfs creation ahead
Date: Mon, 13 Sep 2021 21:09:01 +0300
Message-Id: <20210913180902.193874-3-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913180902.193874-1-jouni@codeaurora.org>
References: <20210913180902.193874-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_110936_358102_74A758B5 
X-CRM114-Status: GOOD (  18.20  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Baochen Qiang <bqiang@codeaurora.org>

The sram dump debugfs interface has to be put under pdev directory
located under /sys/kernel/debug/ath11k/<pdev name>. Currently pdev directory
is created after firmware is ready, this is too late for sram dump.
Suppose that if errors happen and ath11k fails to reach firmware
ready, we have no way to dump sram content to debug cause the
interface has not been created yet. So move it ahead.

Also move pdev debugfs destroy to ath11k_core_soc_destroy as a mirror.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c    | 23 +++++++++++++----------
 drivers/net/wireless/ath/ath11k/debugfs.c | 21 +++++++++++++++------
 drivers/net/wireless/ath/ath11k/debugfs.h |  9 +++++++++
 3 files changed, 37 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 9f2c9795767e..59fa0ff06dff 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -701,14 +701,22 @@ static int ath11k_core_soc_create(struct ath11k_base *ab)
 		goto err_qmi_deinit;
 	}
 
+	ret = ath11k_debugfs_pdev_create(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to create core pdev debugfs: %d\n", ret);
+		goto err_debugfs_reg;
+	}
+
 	ret = ath11k_hif_power_up(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to power up :%d\n", ret);
-		goto err_debugfs_reg;
+		goto err_pdev_debug;
 	}
 
 	return 0;
 
+err_pdev_debug:
+	ath11k_debugfs_pdev_destroy(ab);
 err_debugfs_reg:
 	ath11k_debugfs_soc_destroy(ab);
 err_qmi_deinit:
@@ -718,6 +726,7 @@ static int ath11k_core_soc_create(struct ath11k_base *ab)
 
 static void ath11k_core_soc_destroy(struct ath11k_base *ab)
 {
+	ath11k_debugfs_pdev_destroy(ab);
 	ath11k_debugfs_soc_destroy(ab);
 	ath11k_dp_free(ab);
 	ath11k_reg_free(ab);
@@ -728,16 +737,13 @@ static int ath11k_core_pdev_create(struct ath11k_base *ab)
 {
 	int ret;
 
-	ret = ath11k_debugfs_pdev_create(ab);
-	if (ret) {
-		ath11k_err(ab, "failed to create core pdev debugfs: %d\n", ret);
-		return ret;
-	}
+	ath11k_debugfs_crash_trigger_create(ab);
+	ath11k_debugfs_dp_stats_create(ab);
 
 	ret = ath11k_mac_register(ab);
 	if (ret) {
 		ath11k_err(ab, "failed register the radio with mac80211: %d\n", ret);
-		goto err_pdev_debug;
+		return ret;
 	}
 
 	ret = ath11k_dp_pdev_alloc(ab);
@@ -767,8 +773,6 @@ static int ath11k_core_pdev_create(struct ath11k_base *ab)
 	ath11k_dp_pdev_free(ab);
 err_mac_unregister:
 	ath11k_mac_unregister(ab);
-err_pdev_debug:
-	ath11k_debugfs_pdev_destroy(ab);
 
 	return ret;
 }
@@ -780,7 +784,6 @@ static void ath11k_core_pdev_destroy(struct ath11k_base *ab)
 	ath11k_mac_unregister(ab);
 	ath11k_hif_irq_disable(ab);
 	ath11k_dp_pdev_free(ab);
-	ath11k_debugfs_pdev_destroy(ab);
 }
 
 static int ath11k_core_start(struct ath11k_base *ab,
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 17f0bbbac7ae..cdc492421807 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -831,20 +831,29 @@ static const struct file_operations fops_soc_dp_stats = {
 	.llseek = default_llseek,
 };
 
-int ath11k_debugfs_pdev_create(struct ath11k_base *ab)
+void ath11k_debugfs_crash_trigger_create(struct ath11k_base *ab)
 {
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
-		return 0;
-
-	ab->debugfs_soc = debugfs_create_dir(ab->hw_params.name, ab->debugfs_ath11k);
-	if (IS_ERR(ab->debugfs_soc))
-		return PTR_ERR(ab->debugfs_soc);
+		return;
 
 	debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
 			    &fops_simulate_fw_crash);
+}
+
+void ath11k_debugfs_dp_stats_create(struct ath11k_base *ab)
+{
+	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		return;
 
 	debugfs_create_file("soc_dp_stats", 0600, ab->debugfs_soc, ab,
 			    &fops_soc_dp_stats);
+}
+
+int ath11k_debugfs_pdev_create(struct ath11k_base *ab)
+{
+	ab->debugfs_soc = debugfs_create_dir(ab->hw_params.name, ab->debugfs_ath11k);
+	if (IS_ERR(ab->debugfs_soc))
+		return PTR_ERR(ab->debugfs_soc);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.h b/drivers/net/wireless/ath/ath11k/debugfs.h
index e5346af71f24..47b96848cf0a 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs.h
@@ -145,6 +145,8 @@ static inline int ath11k_debugfs_rx_filter(struct ath11k *ar)
 	return ar->debug.rx_filter;
 }
 
+void ath11k_debugfs_crash_trigger_create(struct ath11k_base *ab);
+void ath11k_debugfs_dp_stats_create(struct ath11k_base *ab);
 #else
 static inline int ath11k_debugfs_soc_create(struct ath11k_base *ab)
 {
@@ -212,6 +214,13 @@ static inline int ath11k_debugfs_rx_filter(struct ath11k *ar)
 	return 0;
 }
 
+static inline void ath11k_debugfs_crash_trigger_create(struct ath11k_base *ab)
+{
+}
+
+static inline void ath11k_debugfs_dp_stats_create(struct ath11k_base *ab)
+{
+}
 #endif /* CONFIG_MAC80211_DEBUGFS*/
 
 #endif /* _ATH11K_DEBUGFS_H_ */
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
