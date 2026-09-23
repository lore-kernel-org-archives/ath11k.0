Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03685C9830D
	for <ath11k@archiver.kernel.org>; Wed, 23 Sep 2026 12:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rk6nINkYlkm7Zw4Cbc1NTFg1VBHdhmJgw2S6j+VQNGc=; b=KTvSe9iGPedNfqcjLGmIR5ZFEw
	takPchuhUmbt5ZrcodE3xBKj3vmJh53pDZcLaabcuGj/jTDfqfDbwbvjxhXFr8D6hOyZmXxrajFl8
	8eGTMbu32q277DwhI1ZUUYQxnAuTyXQZctcXGvim+jGLNUWCwBk5Utt4tK5k938Tv4gbLi2fPyTcR
	ThWEAN+HatS/umYhER2kNlmh8MPyjdaE737ZpM4Ot/271mqqmPLQpx3v4g32RN157GcvIT1y440Mk
	I/UdPe9fnEHW+nRxOzRQttJYFOCXm6IeSJjQE9u8lqHCi5xJfzNSSnVmolVc2hnfjYvDzr6+87JXo
	AFzUF9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lj1-00000008BAR-1RsJ;
	Wed, 23 Sep 2026 12:05:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Liz-00000008B8D-2Ck5
	for ath11k@lists.infradead.org;
	Wed, 23 Sep 2026 12:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3357F447BC;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1626AC4AF14;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790165121;
	bh=U65tT/XuausYcSGRR+nBv1qFV7Ddpj0lJkZ4vH1copM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pS9WqHmsxjiQz6raHXOxBZg/V2RhegwdP0S/q/wzVJDNaiOB/0dlgRWy5CCIxddvt
	 w6YdYiDspFb3gX/o2VQGxelLJf1cC0twNci7qRnzLxMyBFG1fUQwMAojoCwiMFPa9z
	 BRwQJUPatSlb9Kg4LkTTfYTs0HcoweWty05fuumO3pcYESQPlpnSV5LTr6Qqeq1Ht6
	 9CWzbePnZg0SkQR7j1Y11jyWu27FTWZUJ5C4Xed+SQhSvIvdK6n9ghgR0Ej1PHQj59
	 wrY0ZDS+GVjo/i1pgyRxsMNobMG/y0s2arbeDkyUnl6GA/VzcKz7gtn35Mxrh/t6g2
	 w56pBik4EbSJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027A3C98307;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 23 Sep 2026 16:05:12 +0400
Subject: [PATCH ath-next 06/16] firmware: qcom: scm: Add support for
 setting internal WiFi power mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-ipq5018-qcn6122-mpd-v1-6-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790165117; l=3732;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=S3tayyPPojcv8MgCJKPIjYb3bobuwrtC6mchI6StDhA=;
 b=yEeCFoFH8MkwAgM7jDcHmtMYntNrocu/jD5KcO5zp83+wJabLj9r+0QEamATBQeJh3sWOsb7U
 Gd89W0Ww3VbAn0Yd3d30H9ILQQwoC4ZLMpo77DHPMN3Ne66bDVp30YL
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
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
Reply-To: george.moussalem@outlook.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: George Moussalem <george.moussalem@outlook.com>

Add SCM call to power up / down the SoC's internal WiFi radio.
The SoC's internal WiFi radio needs to be powered up/down through a SCM
call when MPD firmware is loaded by the rproc driver. Multi-PD firmware
only loads the root PD and provides services and resources to one or
multiple user PDs which are firmware segments required for each WiFi
radio (for ex. in the case of the MPD firmware for IPQ5018 which
contains the firmware binaries for the SoC's internal WiFi radio and one
or two IPQ5018-specific QCN6122 WiFi companion chips).

For non-MPD firmware, this call is not required.

Not all Trusted Execution Environment (QSEE) images support this call,
so first check if the call is available.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 43 ++++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |  2 ++
 include/linux/firmware/qcom/qcom_scm.h |  1 +
 3 files changed, 46 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..8e5f5c235cb7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1084,6 +1084,49 @@ static bool qcom_scm_is_pas_available(void)
 	return true;
 }
 
+/**
+ * qcom_scm_pas_set_wifi_power_mode() - Power on/off internal wifi
+ * @peripheral:	peripheral id
+ * @enable:	true to power up, false to power down
+ *
+ * Return 0 on success.
+ */
+int qcom_scm_pas_set_wifi_power_mode(u32 peripheral, bool enable)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = enable ? QCOM_SCM_PIL_PAS_WIFI_PWR_EN :
+		       QCOM_SCM_PIL_PAS_WIFI_PWR_DIS,
+		.arginfo = QCOM_SCM_ARGS(1),
+		.args[0] = peripheral,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					  enable ? QCOM_SCM_PIL_PAS_WIFI_PWR_EN :
+					  QCOM_SCM_PIL_PAS_WIFI_PWR_DIS))
+		return -EOPNOTSUPP;
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_bw_enable();
+	if (ret)
+		goto disable_clk;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
+
+	return ret ? : res.result[0];
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_set_wifi_power_mode);
+
 static int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index cf90a565fdfb..e1554997ca08 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,8 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_WIFI_PWR_EN	0x17
+#define QCOM_SCM_PIL_PAS_WIFI_PWR_DIS	0x18
 #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 5747bd191bf1..9258839ae746 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -93,6 +93,7 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 						  size_t *output_rt_size);
 
 int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
+int qcom_scm_pas_set_wifi_power_mode(u32 peripheral, bool enable);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.53.0



