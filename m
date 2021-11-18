Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE79C433EF
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 15:33:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A85E6126A
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 15:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A85E6126A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H0FqWTGvSvHVUYS8vW6EzpSW6oLsndPBFUsrkbwJKRc=; b=RGblFrhexwseuR
	MxhLgdfu29VkbA0raDYtrCCTc3AOHZrNizw8g+auMfLPNn9JZT1Wo87Io2hJSx3/E44gTP7+ds7+p
	7X+3niPkac/uPw1cCr4503q9I+MeRcAjja47aR51QthJMHt9pFkWNPg7mxPMJcF1qRe7RzSdDXkiC
	L0nTFTqxJ/ijcCMW7Q4GtUpJfQB9iIAIqQnSiEdtIUsxJO5vmJGHMM/QNqO1Z7h6F+I0kyrmn17td
	x6fgZahdJS2F6SSJ1NcEv9xMm2AMfMFkYX+p1YLEQ5TjYibxNLPG+Vl2mAoxH5IAjJX73tPNofQa2
	q0BdjHeKm44+UlSEA8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnjPG-008HeT-5g; Thu, 18 Nov 2021 15:32:58 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnjPC-008HFm-H1
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 15:32:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637249576; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=NgvtXY9KWVGF6KT9hm449US8KRw0C+HqpFgweiRfv2s=;
 b=o5VJuEaOnzDbaTsBio73GuQChJqHLzZzBfaVrMoQFvHOgnQUREiv44ok+kkFbZjeNYuX7+ye
 bHpC21CdBPx8LM9fPysf4UY+LbbN5TSMRUInRaoPZP5wC9Tcyn1xeolDOKRndBpjseqHwkmk
 IM92VaeFrZBaDn1sHHpFCcRJg1g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 61967222638a2f4d61428aaf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 15:32:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6F99AC43616; Thu, 18 Nov 2021 15:32:49 +0000 (UTC)
Received: from akolli-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BA322C4338F;
 Thu, 18 Nov 2021 15:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BA322C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: Use host CE parameters for CE interrupts configuration
Date: Thu, 18 Nov 2021 21:02:38 +0530
Message-Id: <1637249558-12793-1-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_073256_284741_E2F88534 
X-CRM114-Status: GOOD (  10.82  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

CE interrupt configuration uses host ce parameters to assign/free
interrupts. Use host ce parameters to enable/disable interrupts.
This patch fixes below BUG,

BUG: KASAN: global-out-of-bounds in 0xffffffbffdfb035c at addr
ffffffbffde6eeac
 Read of size 4 by task kworker/u8:2/132
 Address belongs to variable ath11k_core_qmi_firmware_ready+0x1b0/0x5bc [ath11k]

OOB is due to ath11k_ahb_ce_irqs_enable() iterates ce_count(which is 12)
times and accessing 12th element in target_ce_config
(which has only 11 elements) from ath11k_ahb_ce_irq_enable().

With this change host ce configs are used to enable/disable interrupts.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00471-QCAHKSWPL_SILICONZ-1

Fixes: 967c1d1131fa ("ath11k: move target ce configs to hw_params")

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 8c9c781afc3e..096c502cce38 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -206,13 +206,13 @@ static void ath11k_ahb_clearbit32(struct ath11k_base *ab, u8 bit, u32 offset)
 
 static void ath11k_ahb_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
 {
-	const struct ce_pipe_config *ce_config;
+	const struct ce_attr *ce_attr;
 
-	ce_config = &ab->hw_params.target_ce_config[ce_id];
-	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_OUT)
+	ce_attr = &ab->hw_params.host_ce_config[ce_id];
+	if (ce_attr->src_nentries)
 		ath11k_ahb_setbit32(ab, ce_id, CE_HOST_IE_ADDRESS);
 
-	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_IN) {
+	if (ce_attr->dest_nentries) {
 		ath11k_ahb_setbit32(ab, ce_id, CE_HOST_IE_2_ADDRESS);
 		ath11k_ahb_setbit32(ab, ce_id + CE_HOST_IE_3_SHIFT,
 				    CE_HOST_IE_3_ADDRESS);
@@ -221,13 +221,13 @@ static void ath11k_ahb_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
 
 static void ath11k_ahb_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
 {
-	const struct ce_pipe_config *ce_config;
+	const struct ce_attr *ce_attr;
 
-	ce_config = &ab->hw_params.target_ce_config[ce_id];
-	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_OUT)
+	ce_attr = &ab->hw_params.host_ce_config[ce_id];
+	if (ce_attr->src_nentries)
 		ath11k_ahb_clearbit32(ab, ce_id, CE_HOST_IE_ADDRESS);
 
-	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_IN) {
+	if (ce_attr->dest_nentries) {
 		ath11k_ahb_clearbit32(ab, ce_id, CE_HOST_IE_2_ADDRESS);
 		ath11k_ahb_clearbit32(ab, ce_id + CE_HOST_IE_3_SHIFT,
 				      CE_HOST_IE_3_ADDRESS);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
