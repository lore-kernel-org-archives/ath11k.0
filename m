Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027ABC43217
	for <ath11k@archiver.kernel.org>; Sun,  9 Oct 2022 22:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnZVm6uylTOvvc/Cgic95tw/TsBj+EpCrPWB0+l77nA=; b=HW9em/ozLN5GmH
	fL1cx/qhflNjyK4MJjDo27gEbm7ZulsjrJFWx1ZWaMoViFEg2ncOCIN+iecQNzk+NzJqw8Guq8Opv
	rV/OXoPY1qGhHHk7tOOkk7eQJ1Kbbz/12/LUmeROF2WjREjZIXcDc7jjTdFnvLuUvYnBF0T5CM3nl
	lCy9QyTVaOa6q/hmSwyj5/86vOJ4ttixqPDr8293r9nicL/ymYk0X6yHp79NphE8+J3Xy7bWixdua
	TuN2YzyOvQ8Ehi8izLsR9EbgVNN31XBMKVajaM2DwZBI+7QjiVxjkLf5n3frccd84NsAXg2ZBWIel
	8VQMiHbvQbRRk8+gyM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oheUD-00GGEB-Oe; Sun, 09 Oct 2022 22:09:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oheU6-00GGCR-KP
	for ath11k@lists.infradead.org; Sun, 09 Oct 2022 22:09:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F68960B85;
	Sun,  9 Oct 2022 22:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96760C433D7;
	Sun,  9 Oct 2022 22:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665353362;
	bh=giegFir8SL6JfqRM8O19b4x4heEB9JoQAO77iyXbpSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uGr0/XBtLMiYj7xE9BF7+7/x1KNbrTKuaQukWT4UKb/1lZUnhmFUU1L1RmnjwJ6RJ
	 9qFdqsGFBiQcR3hTvnT/EwVkmz4bK5E4G24Le4pCnJEaUl3bBhq15URpLgz68uVh8S
	 6jlWZ6BLDvcz0/DR68qwxCO5/e50ogjlkt5rMZtckwXt6ui55REtHMZBcSnc5g6bNN
	 0tjZwoJ9BxTaDdOj1vEeaQ3oumbxNooethGpB0bl315lFYBb17SaywJ7s4nWrvj7f6
	 7j1mE5LLEmjXVrl7RMEYsRa9NSAOslgb60djT2hPLD1RI/tsiaBnGoeLEHQXJYCDpB
	 67BXaHw485j7Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 26/77] wifi: ath11k: Register shutdown handler for WCN6750
Date: Sun,  9 Oct 2022 18:07:03 -0400
Message-Id: <20221009220754.1214186-26-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009220754.1214186-1-sashal@kernel.org>
References: <20221009220754.1214186-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_150922_773885_E9027D71 
X-CRM114-Status: GOOD (  16.65  )
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

From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

[ Upstream commit ac41c2b642b136a1e633379fcb87a9db0ee07f5b ]

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
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20220720134710.15523-1-quic_mpubbise@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 58 ++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/core.c |  2 +
 2 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index c47414710138..911eee9646a4 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1088,20 +1088,10 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
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
@@ -1111,19 +1101,60 @@ static int ath11k_ahb_remove(struct platform_device *pdev)
 
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
@@ -1131,6 +1162,7 @@ static struct platform_driver ath11k_ahb_driver = {
 	},
 	.probe  = ath11k_ahb_probe,
 	.remove = ath11k_ahb_remove,
+	.shutdown = ath11k_ahb_shutdown,
 };
 
 static int ath11k_ahb_init(void)
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c3e9e4f7bc24..9df6aaae8a44 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1563,6 +1563,8 @@ static void ath11k_core_pre_reconfigure_recovery(struct ath11k_base *ab)
 
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
