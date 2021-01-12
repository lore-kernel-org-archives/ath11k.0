Return-Path: <SRS0=Hkj5=GP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8107C433E6
	for <ath11k@archiver.kernel.org>; Tue, 12 Jan 2021 12:55:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BF7823117
	for <ath11k@archiver.kernel.org>; Tue, 12 Jan 2021 12:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BF7823117
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N3UdDqkm11l58h4S6AkOIZYsg3h2wDSjFU37f//jE0Y=; b=QDP62yZktLb2Vw7ut20h07eDp
	6ZlrnYlYhFIBsw8YsxAcrQ/b93xjxCExo1nEfnqBoQTqMohCm5/XlI1BlpJT96q5VX1DR6GSgi5iz
	PUhq7IOTNuoeOnulzjgtH9rzh4i0ZmWQXJWzEyR5HyEJ9EUg6TBKPlC7YIPsFtN9hP4mMXX29DhCc
	Am70OTCxuAGJcK7t/rMCwI5auzONElH9o3PSXlLMvPw/Cu5+TVWFu/dy/x9+LmjmdtwgcoPk6nk2d
	1m2YDJqtueKCiFQtf/Gka8AaZZzIUQoSq0qT60hhiCUmM6iR2OvuTvik6kElBeRdg4h02+7Pql5ss
	Hdfpz37eA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJDE-0008Ud-J6; Tue, 12 Jan 2021 12:55:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJD9-0008S0-UU
 for ath11k@lists.infradead.org; Tue, 12 Jan 2021 12:55:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1112623121;
 Tue, 12 Jan 2021 12:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456147;
 bh=kAeYGyxjJHr6PJUf3V2kvHwuqdbVpOB+4IXFVhgsRB0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MS3uXayHXZBhg7uZ8+WCDPmfRLQlNhudg0hoC2RFH1N8J+6jiaDYJR5vw5izJIGt3
 EA50MqwIet1Rzr8dXSQcAjyAMluZT3wf11jduIBgx7iSZj8NeahmiWpfzOVlcYWJco
 C60SpJXLeXA80YfX6EukKzzrRLP5iBN33v47fmUF4tLtAaZkcSlZOTmNwWiCKI1Bv0
 2X6/d+fUAxfDwk610Xsz/ETkc+3E1G/Gz9T59V79XqTrfhMTGfEktAEB+1v5jKyfgU
 GJHG9l6Zc6e2HYAPaqAsTZjiFN1bUYSzv1qUxmLF7QR3zEemc4+CHzaa8Nv25D458l
 bSw1tBnAkT+sQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 09/51] ath11k: qmi: try to allocate a big block
 of DMA memory first
Date: Tue, 12 Jan 2021 07:54:51 -0500
Message-Id: <20210112125534.70280-9-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125534.70280-1-sashal@kernel.org>
References: <20210112125534.70280-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_075548_274331_E92538BD 
X-CRM114-Status: GOOD (  17.77  )
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Carl Huang <cjhuang@codeaurora.org>

[ Upstream commit f6f92968e1e5a7a9d211faaebefc26ebe408dad7 ]

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
Link: https://lore.kernel.org/r/1608127593-15192-1-git-send-email-kvalo@codeaurora.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 24 ++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/qmi.h |  1 +
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 99a88ca83deaa..2ae7c6bf091e9 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1654,6 +1654,7 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 	struct qmi_wlanfw_respond_mem_resp_msg_v01 resp;
 	struct qmi_txn txn = {};
 	int ret = 0, i;
+	bool delayed;
 
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
 	if (!req)
@@ -1666,11 +1667,13 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
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
@@ -1702,6 +1705,12 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
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
@@ -1736,6 +1745,8 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 	int i;
 	struct target_mem_chunk *chunk;
 
+	ab->qmi.target_mem_delayed = false;
+
 	for (i = 0; i < ab->qmi.mem_seg_count; i++) {
 		chunk = &ab->qmi.target_mem[i];
 		chunk->vaddr = dma_alloc_coherent(ab->dev,
@@ -1743,6 +1754,15 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
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
@@ -2467,7 +2487,7 @@ static void ath11k_qmi_msg_mem_request_cb(struct qmi_handle *qmi_hdl,
 				    ret);
 			return;
 		}
-	} else if (msg->mem_seg_len > 2) {
+	} else {
 		ret = ath11k_qmi_alloc_target_mem_chunk(ab);
 		if (ret) {
 			ath11k_warn(ab, "qmi failed to alloc target memory: %d\n",
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index b0a818f0401b9..59f1452b3544c 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -121,6 +121,7 @@ struct ath11k_qmi {
 	struct target_mem_chunk target_mem[ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01];
 	u32 mem_seg_count;
 	u32 target_mem_mode;
+	bool target_mem_delayed;
 	u8 cal_done;
 	struct target_info target;
 	struct m3_mem_region m3_mem;
-- 
2.27.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
