Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F714C43334
	for <ath11k@archiver.kernel.org>; Wed, 20 Jul 2022 13:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gLdEOraIPEzvss1SG5kNlFwUO7tLrWsTcq9wHtW28fc=; b=2Fdpaw+sMUnTxF
	ZxiHmmfyTpcWiORh4H8REpyG0irBGfxLao6Wesk9DyRWAF6jjMXApa5qdBwNFFulikn3KpNgQC5oi
	BGvlYHIsUcSKI8EIaaMPupJXeCWtayacSZD2816UgEY+QXjMEJLZhzLWmPEypWPJPwuBARJBADAkI
	dzsSNA24yuPspuvFmsCrW5JFNTp2tYWOct7+T0YkDJXOqGIub/MtKMEq2hsg3CpSh7ql8X8dzNFhi
	BS37L1OyooUK1fsG1LAZjl2RAClAd11wBhz9jnhrUd5qlQoZ/OKEH9XDrsoaCQCWmsnpqlJ1D+CtK
	X0jBp5go7Ngb14c8ZaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA38-006FKo-Fd; Wed, 20 Jul 2022 13:47:38 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA35-006FGQ-1L
	for ath11k@lists.infradead.org; Wed, 20 Jul 2022 13:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1658324854; x=1689860854;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NOm+R8lSMfpnG1bn5IwGT4npcLVr2/djviSVhUd47Cw=;
  b=r0hqKFbqzJrovRwC6pv95UM/XwVF64OY4IenonbBjlli6lzQsfmd7R+J
   J0uC470BSVigq6ApAChhZBcRTRkTKdUekNeh9ZYaZr5isbPrGzseYykdL
   N7zVFELS4iNMfIS3Ru+QhbrKIQ1nr6nwnMKS1YKB2LlG9sBrAACdyymK6
   s=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 20 Jul 2022 06:47:32 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 06:47:32 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:47:31 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:47:30 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH] ath11k: Register shutdown handler for WCN6750
Date: Wed, 20 Jul 2022 19:17:10 +0530
Message-ID: <20220720134710.15523-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_064735_124578_49C6FF6F 
X-CRM114-Status: GOOD (  14.53  )
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

When the system shuts down, SMMU driver will be stopped and
will not assist in IOVA translations. SMMU driver expects all
of its consumers to shutdown before shutting down itself.
WCN6750 being one of the consumer device should not perform any
DMA operations after the SMMU has shutdown which will otherwise
result in SMMU faults.

SMMU driver will call the shutdown() callback of all its
consumer devices and the consumers shall stop further DMA
activity after the invocation of their respective shutdown()
callbacks.

Register the shutdown() callback to the platform core for WCN6750.
Change will not impact other AHB ath11k devices.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 58 ++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/core.c |  2 +
 2 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index d7d33d5cdfc5..404509eb833a 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1038,20 +1038,10 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ath11k_ahb_remove(struct platform_device *pdev)
+static void ath11k_ahb_remove_prepare(struct ath11k_base *ab)
 {
-	struct ath11k_base *ab = platform_get_drvdata(pdev);
 	unsigned long left;
 
-	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
-		ath11k_ahb_power_down(ab);
-		ath11k_debugfs_soc_destroy(ab);
-		ath11k_qmi_deinit_service(ab);
-		goto qmi_fail;
-	}
-
-	reinit_completion(&ab->driver_recovery);
-
 	if (test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags)) {
 		left = wait_for_completion_timeout(&ab->driver_recovery,
 						   ATH11K_AHB_RECOVERY_TIMEOUT);
@@ -1061,19 +1051,60 @@ static int ath11k_ahb_remove(struct platform_device *pdev)
 
 	set_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags);
 	cancel_work_sync(&ab->restart_work);
+	cancel_work_sync(&ab->qmi.event_work);
+}
+
+static void ath11k_ahb_free_resources(struct ath11k_base *ab)
+{
+	struct platform_device *pdev = ab->pdev;
 
-	ath11k_core_deinit(ab);
-qmi_fail:
 	ath11k_ahb_free_irq(ab);
 	ath11k_hal_srng_deinit(ab);
 	ath11k_ahb_fw_resource_deinit(ab);
 	ath11k_ce_free_pipes(ab);
 	ath11k_core_free(ab);
 	platform_set_drvdata(pdev, NULL);
+}
+
+static int ath11k_ahb_remove(struct platform_device *pdev)
+{
+	struct ath11k_base *ab = platform_get_drvdata(pdev);
+
+	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
+		ath11k_ahb_power_down(ab);
+		ath11k_debugfs_soc_destroy(ab);
+		ath11k_qmi_deinit_service(ab);
+		goto qmi_fail;
+	}
+
+	ath11k_ahb_remove_prepare(ab);
+	ath11k_core_deinit(ab);
+
+qmi_fail:
+	ath11k_ahb_free_resources(ab);
 
 	return 0;
 }
 
+static void ath11k_ahb_shutdown(struct platform_device *pdev)
+{
+	struct ath11k_base *ab = platform_get_drvdata(pdev);
+
+	/* platform shutdown() & remove() are mutually exclusive.
+	 * remove() is invoked during rmmod & shutdown() during
+	 * system reboot/shutdown.
+	 */
+	ath11k_ahb_remove_prepare(ab);
+
+	if (!(test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)))
+		goto free_resources;
+
+	ath11k_core_deinit(ab);
+
+free_resources:
+	ath11k_ahb_free_resources(ab);
+}
+
 static struct platform_driver ath11k_ahb_driver = {
 	.driver         = {
 		.name   = "ath11k",
@@ -1081,6 +1112,7 @@ static struct platform_driver ath11k_ahb_driver = {
 	},
 	.probe  = ath11k_ahb_probe,
 	.remove = ath11k_ahb_remove,
+	.shutdown = ath11k_ahb_shutdown,
 };
 
 static int ath11k_ahb_init(void)
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c8e0bc935838..591c59949935 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1649,6 +1649,8 @@ static void ath11k_core_pre_reconfigure_recovery(struct ath11k_base *ab)
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);
 	wake_up(&ab->peer_mapping_wq);
+
+	reinit_completion(&ab->driver_recovery);
 }
 
 static void ath11k_core_post_reconfigure_recovery(struct ath11k_base *ab)
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
