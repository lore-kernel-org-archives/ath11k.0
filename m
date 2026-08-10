Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD4EC5AD7B
	for <ath11k@archiver.kernel.org>; Mon, 10 Aug 2026 19:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvdl9kcK3h/HGJkyOzJDtw5a44dH9kR79k1JcbpYz1k=; b=IdMgcSQQY0tsSWqsJ4wcAs3GsO
	wF9X9oAkQZDUFsDgl+PHIFh/BmBpsDd96bkcjobyJ20QNNNNEJlv5eJDr3t2eO8Utb7Kp9r4zkTdr
	xpjKZykDILU3E7njhQ/vFYFXyfN5mcQ71UFa+wlCXn3bTuiceyNAOdvZgPuDLYnjeriAjynE7lMjo
	yCU4KHDk1ST3MYjjDquG/g9HefBn8G9Q3aQF2VzE6M4tEXjhTgPHqzUaEtk/zkE0RKERpIOy1Ur62
	vl9pxFqC2DsGk/c903/dhSgbSP3RboYnRrv8YjVcESDETtQlf9BLs4kZr26/2L61Ggns63zpz2L1O
	GOoWksoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVgh-0000000CkbX-2fbr;
	Mon, 10 Aug 2026 19:29:31 +0000
Received: from mx-relay48-hz3-if1.hornetsecurity.com ([94.100.134.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVgd-0000000CkaM-0NC7
	for ath11k@lists.infradead.org;
	Mon, 10 Aug 2026 19:29:30 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=217.14.160.69, headerfrom=marcant.net)
 smtp.mailfrom=marcant.net smtp.helo=rossini.marcant.net; dkim=pass
 header.d=marcant.net header.s=gandalf header.a=rsa-sha256; dmarc=pass
 header.from=marcant.net orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=rvdl9kcK3h/HGJkyOzJDtw5a44dH9kR79k1JcbpYz1k=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1786390143;
 b=VOHBtskmhfyE1CeIe/8n0Fp1Rh4FiLGsoyFDhTqD2cVjGOOmoBLrLW9PTuxPtAuEjQ8IXXqx
 Hjp0weQkJWs2F3FElLblQardZEaVNnMSHTfy1GdriBTS/MOI8DP4yJ8s5AEW9dWu43lFdPrl3v6
 9nCdVFnrX7/M4ZhgPwYuj5tSA4lXdxa4B2uTdZOV5xGl1XSoplQRsufgN5sW23Sgwxb1GEGecu1
 w8Ga/tvai46v0/MC+wMZA1F0fMLi+Kl4wtSx/9iaeOXajgX012eNxE8fqdvV50PTooqmdSjUCvu
 bV4uq9xOZ1xbuYDC4QDIW7hxXA0fci068VA55eXeW7D8g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1786390143;
 b=aqovxToYoe8sv6crNGeikdqYOTykaiafaeWtJ27YgusIBwFcCZsnDlLboA/r7CKVCoeHUqYT
 rqFEGzNWyUE4TF2KR9ZBG8ipBEuu8roCaOb9QRmMg7hilFWrk7CfePoPbbHwQ3ffxNJsDGFJE+k
 DXkJmZPZAGthah9jxBAmadvtGnPTlKHzCtY68dqKQsqDQYnx7D/jXf+KkA456W/LWBvSQhfFtC0
 9sufPP4MmOdoOo651mRpwgt2gHGXby0VYizHdlQgjEJyUBEUyf6WSrRVyjjOfCm4m7zn+7/U1hy
 XWGsSRirCoTm4vAQvkfOY8kege6zVl/rZXkGJzSqZaW2w==
Received: from rossini.marcant.net ([217.14.160.69]) by mx-gate48-hz3;
 Mon, 10 Aug 2026 21:29:03 +0200
Received: from futile.kalnet.hooya.de (unknown [192.168.203.16])
	by rossini.marcant.net (Postfix) with ESMTP id E3F4F960010;
	Mon, 10 Aug 2026 21:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 rossini.marcant.net E3F4F960010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marcant.net;
	s=gandalf; t=1786390140;
	bh=rvdl9kcK3h/HGJkyOzJDtw5a44dH9kR79k1JcbpYz1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uU9d5b0KrTrh8RpzxO9bEvV7y4JAf5cEkEXM34laS61gnXcp+vHY9nrG+PLISI+kA
	 nMxw8aL4DLhLlgz4Hhk5aTNgrJi4t/MN8wKX0uVf6DhSHM8m20uKRFTqW6hQtE0rKw
	 Ks5cXKjmf1/2u53x7YQWAiveAviO5HhqiI0X3bm4=
From: =?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>,
	avalentin@marcant.net,
	stable@vger.kernel.org,
	Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
Subject: [PATCH v3] wifi: ath11k: run ahb shutdown() teardown only on WCN6750
Date: Mon, 10 Aug 2026 21:28:59 +0200
Message-ID: <20260810192859.949348-1-avalentin@marcant.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260808213551.4169863-1-avalentin@marcant.net>
References: <20260808213551.4169863-1-avalentin@marcant.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: avalentin@marcant.net
X-cloud-security-recipient: ath11k@lists.infradead.org
X-cloud-security-Mailarchiv: E-Mail archived for: avalentin@marcant.net
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate48-hz3 with 4hJlDX1vqSz1kNcF7
X-cloud-security-connect: rossini.marcant.net[217.14.160.69], TLS=1, IP=217.14.160.69
X-cloud-security-Digest: e56c1128890484b534035f16abfc5fd8
X-cloud-security: scantime:1.758
DKIM-Signature: a=rsa-sha256;
 bh=rvdl9kcK3h/HGJkyOzJDtw5a44dH9kR79k1JcbpYz1k=; c=relaxed/relaxed;
 d=marcant.net; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1786390143; v=1;
 b=c6ZSH7a5VN8pCk2oU/OIU74BLQy90++Fc7QlKWJr3mLyUl7ijrqCtTDnCk2xiazbBC3K3xsS
 8XYQAdTq33DIYohMmf52joR1R1Fm4RL9/zyFKuRLOQpPcIWk7b9sU8+8+WWG4+TcdUdCYWkVfeQ
 1WqXguMhUJQLLjiqvi0pZSaoycCFc7FnZm7AQs8Q+b+/agvEV4FeMHmAZ8krSS3rnC1RjT8UW5U
 MhyyI0lQF1p7kD4rXk3Fh2NBpx+LXsPDrv9rPOwT6/6fd7rSs11UvYlW3ZpkRpsDaBmv5Sj7KHR
 oGqVXFyJP3M/imYetZgGzX14UQV2mVj6mhpPXWkT9S5Ng==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_122927_770514_02BDF854 
X-CRM114-Status: GOOD (  22.08  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The AHB shutdown() callback was added solely for WCN6750, which must stop
DMA before the SMMU is torn down at system reboot/shutdown. It was
registered unconditionally in the shared ath11k_ahb_driver, so it also
runs on the IPQ AHB targets (IPQ8074/IPQ6018/IPQ5018), which never had a
shutdown() handler before and have no such SMMU requirement.

The commit message claimed the change "will not impact other AHB ath11k
devices", but it does: on IPQ6018 the teardown stops the WCSS Q6 remote
processor firmware, which leaves shared WCSS state such that the boot ROM
hangs during DDR training on the following warm reset -- only a cold
(power-on) reset recovers, so a plain reboot never comes back and needs a
physical power cycle. This was pinned by bisecting the teardown: skipping
ath11k_qmi_firmware_stop() (i.e. not stopping the Q6) is what lets the
warm reset train DDR and boot normally, whereas none of the q6v5 power,
reset or clock steps reproduce it on their own.

Restrict the shutdown() teardown to WCN6750 via hw_params, restoring the
pre-regression behaviour for the IPQ AHB targets: they simply have no
shutdown() teardown again, exactly as they did for years before that
change, and on reboot/shutdown the SoC reset re-initializes the WCSS from
scratch. WCN6750 keeps the teardown. Module removal (rmmod / remove()) is
unchanged for all targets.

Verified on a MikroTik Chateau 5G R17 ax (IPQ6018): before, a plain
reboot froze in the boot ROM during DDR training; after, it trains DDR
and boots the kernel across repeated reboots.

Fixes: ac41c2b642b1 ("wifi: ath11k: Register shutdown handler for WCN6750")
Cc: stable@vger.kernel.org
Cc: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
Signed-off-by: André Valentin <avalentin@marcant.net>
---
Changes in v3 (per Jeff Johnson's v2 review):
- ahb.c/hw.h: fix block comment style (/* on its own line) and drop the
  chip references from the generic code -- describe the behaviour, not the
  chipset; only the hw_params initializer ties it to WCN6750.
- core.c: explicitly initialize shutdown_teardown in every hw_params record
  (= false on all but WCN6750).

v2: https://lore.kernel.org/linux-wireless/20260808213551.4169863-1-avalentin@marcant.net/
v1: https://lore.kernel.org/linux-wireless/20260807094858.1548216-1-avalentin@marcant.net/

 drivers/net/wireless/ath/ath11k/ahb.c  | 10 ++++++++++
 drivers/net/wireless/ath/ath11k/core.c | 10 ++++++++++
 drivers/net/wireless/ath/ath11k/hw.h   |  7 +++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 1e1dea4..18f7bff 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1288,6 +1288,16 @@ static void ath11k_ahb_shutdown(struct platform_device *pdev)
 	 * remove() is invoked during rmmod & shutdown() during
 	 * system reboot/shutdown.
 	 */
+
+	/*
+	 * Only run the teardown where hw_params requests it. Where it is not
+	 * required, stopping the firmware here would leave shared state that
+	 * hangs the following warm reset, so skip it and let the SoC reset
+	 * re-initialize the hardware from scratch instead.
+	 */
+	if (!ab->hw_params.shutdown_teardown)
+		return;
+
 	ath11k_ahb_remove_prepare(ab);
 
 	if (!(test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)))
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8dacc87..2a10173 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -41,6 +41,7 @@ MODULE_PARM_DESC(ftm_mode, "Boots up in factory test mode");
 static const struct ath11k_hw_params ath11k_hw_params[] = {
 	{
 		.hw_rev = ATH11K_HW_IPQ8074,
+		.shutdown_teardown = false,
 		.name = "ipq8074 hw2.0",
 		.fw = {
 			.dir = "IPQ8074/hw2.0",
@@ -130,6 +131,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
+		.shutdown_teardown = false,
 		.name = "ipq6018 hw1.0",
 		.fw = {
 			.dir = "IPQ6018/hw1.0",
@@ -218,6 +220,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 	{
 		.name = "qca6390 hw2.0",
 		.hw_rev = ATH11K_HW_QCA6390_HW20,
+		.shutdown_teardown = false,
 		.fw = {
 			.dir = "QCA6390/hw2.0",
 			.board_size = 256 * 1024,
@@ -310,6 +313,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 	{
 		.name = "qcn9074 hw1.0",
 		.hw_rev = ATH11K_HW_QCN9074_HW10,
+		.shutdown_teardown = false,
 		.fw = {
 			.dir = "QCN9074/hw1.0",
 			.board_size = 256 * 1024,
@@ -396,6 +400,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 	{
 		.name = "wcn6855 hw2.0",
 		.hw_rev = ATH11K_HW_WCN6855_HW20,
+		.shutdown_teardown = false,
 		.fw = {
 			.dir = "WCN6855/hw2.0",
 			.board_size = 256 * 1024,
@@ -488,6 +493,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 	{
 		.name = "wcn6855 hw2.1",
 		.hw_rev = ATH11K_HW_WCN6855_HW21,
+		.shutdown_teardown = false,
 		.fw = {
 			.dir = "WCN6855/hw2.1",
 			.board_size = 256 * 1024,
@@ -578,6 +584,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 	{
 		.name = "wcn6750 hw1.0",
 		.hw_rev = ATH11K_HW_WCN6750_HW10,
+		.shutdown_teardown = true,
 		.fw = {
 			.dir = "WCN6750/hw1.0",
 			.board_size = 256 * 1024,
@@ -662,6 +669,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ5018_HW10,
+		.shutdown_teardown = false,
 		.name = "ipq5018 hw1.0",
 		.fw = {
 			.dir = "IPQ5018/hw1.0",
@@ -748,6 +756,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 	{
 		.name = "qca2066 hw2.1",
 		.hw_rev = ATH11K_HW_QCA2066_HW21,
+		.shutdown_teardown = false,
 		.fw = {
 			.dir = "QCA2066/hw2.1",
 			.board_size = 256 * 1024,
@@ -839,6 +848,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 	{
 		.name = "qca6698aq hw2.1",
 		.hw_rev = ATH11K_HW_QCA6698AQ_HW21,
+		.shutdown_teardown = false,
 		.fw = {
 			.dir = "QCA6698AQ/hw2.1",
 			.board_size = 256 * 1024,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536..f35bb96 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -231,6 +231,13 @@ struct ath11k_hw_params {
 	bool cfr_support;
 	u32 cfr_num_stream_bufs;
 	u32 cfr_stream_buf_size;
+	/*
+	 * Run the ahb shutdown() teardown (stop DMA before the SMMU is torn
+	 * down at reboot/shutdown). Only set where the teardown is required;
+	 * where it is not, running it would stop the firmware and leave shared
+	 * state that hangs the following warm reset.
+	 */
+	bool shutdown_teardown;
 };
 
 struct ath11k_hw_ops {

base-commit: f9a2394a23482bfd330911e9c8295b71724feacd
-- 
2.47.3


