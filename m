Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C44C4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 14:06:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8661F20657
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 14:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8661F20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fM43EqLHn0ymIb7mVkDk8NA2ODc8ftvpBhmnsOurJE4=; b=pRQHKWBVLYi9e3fAibsfPf5yN8
	cZJi0mvSOjThz9oyqBgoWYGRlQDBhdXhbSuA0niHDahCfDx0GizP2yhwQ0nQ5hlPwhNsz2t6APY38
	/FOWrHCIdsa4/sBjDqYr2awS1cHIlHiLmRMb3V1iAQRxZU+6pdVMsyYpT/ew+ES8ESXRQS2yPN4g4
	3bgAFaHsctU4yijIg0W2N1R8QEDwM1L+Q9sop6TqDTRWLxSUm0kETgB50Hah4Iyy4CU1JEyuWL5ee
	E3Nfv0+DOk25fqNrtrnmVJpMuZHoxUgIw7jj3zpwRhQmfTwQk+iipzeaeo8U3ahjiQY5Jqodo+2ev
	cYe1KzCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpXS5-0005an-0O; Wed, 16 Dec 2020 14:06:49 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpXS1-0005aM-VA
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 14:06:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608127606; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4UddAqCUG2pExa95WGYuZ8odvOjj9l+IeGMynL3BmO4=;
 b=CZCM0syCpRITEMLmquf1EzExtmW25XtcOIKKGXnBrTKMTT5y93akU3lx/DNgRa31dTxcxiPH
 Bn6446vYClFsZ7XxAk1xCuV5nqlZEWgJH8rq69p2uSNK+zJ908/W+1ls8/QOzcG4wWfgknCS
 3I4yKnZO64wpEJPGG7gNw5Cmd74=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fda146df5e9af65f849b351 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 14:06:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 961C0C433ED; Wed, 16 Dec 2020 14:06:37 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 330EEC433CA;
 Wed, 16 Dec 2020 14:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 330EEC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH] ath11k: qmi: try to allocate a big block of DMA memory first
Date: Wed, 16 Dec 2020 16:06:33 +0200
Message-Id: <1608127593-15192-1-git-send-email-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_090646_394454_347016FC 
X-CRM114-Status: GOOD (  20.14  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Carl Huang <cjhuang@codeaurora.org>

Not all firmware versions support allocating DMA memory in smaller blocks so
first try to allocate big block of DMA memory for QMI. If the allocation fails,
let firmware request multiple blocks of DMA memory with smaller size.

This also fixes an unnecessary error message seen during ath11k probe on
QCA6390:

ath11k_pci 0000:06:00.0: Respond mem req failed, result: 1, err: 0
ath11k_pci 0000:06:00.0: qmi failed to respond fw mem req:-22

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 24 ++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/qmi.h |  1 +
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index f0b5c50974f3..0db623ff4bb9 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1660,6 +1660,7 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 	struct qmi_wlanfw_respond_mem_resp_msg_v01 resp;
 	struct qmi_txn txn = {};
 	int ret = 0, i;
+	bool delayed;
 
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
 	if (!req)
@@ -1672,11 +1673,13 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 	 * failure to FW and FW will then request mulitple blocks of small
 	 * chunk size memory.
 	 */
-	if (!ab->bus_params.fixed_mem_region && ab->qmi.mem_seg_count <= 2) {
+	if (!ab->bus_params.fixed_mem_region && ab->qmi.target_mem_delayed) {
+		delayed = true;
 		ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi delays mem_request %d\n",
 			   ab->qmi.mem_seg_count);
 		memset(req, 0, sizeof(*req));
 	} else {
+		delayed = false;
 		req->mem_seg_len = ab->qmi.mem_seg_count;
 
 		for (i = 0; i < req->mem_seg_len ; i++) {
@@ -1708,6 +1711,12 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 	}
 
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		/* the error response is expected when
+		 * target_mem_delayed is true.
+		 */
+		if (delayed && resp.resp.error == 0)
+			goto out;
+
 		ath11k_warn(ab, "Respond mem req failed, result: %d, err: %d\n",
 			    resp.resp.result, resp.resp.error);
 		ret = -EINVAL;
@@ -1742,6 +1751,8 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 	int i;
 	struct target_mem_chunk *chunk;
 
+	ab->qmi.target_mem_delayed = false;
+
 	for (i = 0; i < ab->qmi.mem_seg_count; i++) {
 		chunk = &ab->qmi.target_mem[i];
 		chunk->vaddr = dma_alloc_coherent(ab->dev,
@@ -1749,6 +1760,15 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 						  &chunk->paddr,
 						  GFP_KERNEL);
 		if (!chunk->vaddr) {
+			if (ab->qmi.mem_seg_count <= 2) {
+				ath11k_dbg(ab, ATH11K_DBG_QMI,
+					   "qmi dma allocation failed (%d B type %u), will try later with small size\n",
+					    chunk->size,
+					    chunk->type);
+				ath11k_qmi_free_target_mem_chunk(ab);
+				ab->qmi.target_mem_delayed = true;
+				return 0;
+			}
 			ath11k_err(ab, "failed to alloc memory, size: 0x%x, type: %u\n",
 				   chunk->size,
 				   chunk->type);
@@ -2517,7 +2537,7 @@ static void ath11k_qmi_msg_mem_request_cb(struct qmi_handle *qmi_hdl,
 				    ret);
 			return;
 		}
-	} else if (msg->mem_seg_len > 2) {
+	} else {
 		ret = ath11k_qmi_alloc_target_mem_chunk(ab);
 		if (ret) {
 			ath11k_warn(ab, "qmi failed to alloc target memory: %d\n",
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 92925c9eac67..7bad374cc23a 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -125,6 +125,7 @@ struct ath11k_qmi {
 	struct target_mem_chunk target_mem[ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01];
 	u32 mem_seg_count;
 	u32 target_mem_mode;
+	bool target_mem_delayed;
 	u8 cal_done;
 	struct target_info target;
 	struct m3_mem_region m3_mem;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
