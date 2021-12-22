Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FCDC433EF
	for <ath11k@archiver.kernel.org>; Wed, 22 Dec 2021 01:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qHm/AEmlH/JzGYGqCf9ZAa0cjdBgk47blbEiFopkjOQ=; b=RYnatyIpo91fdq
	GW9FpkO9LggM3ipjdYq+dr7CRH7/lsVAimM1357oe34/dq1FVMkxfTOO1bWDa+ig3tXmFByRVkP11
	Wed8xEdzeZ89Fmpr7y1AFXKTzB75Je4mFPVxgn24dxjYhjkvs5ewIRkmcQnM5OW+CEFrmc7BRQ2bM
	z6tiHL2z+9En+4V+B/f8yUHkL+yfAz/NGzdMcECQxo/wqmS3/8LeKHtNVV32cKm9UpAfin9ycSFq2
	xiHBVGqLG7fLuJgKrWL/S3RwMdBOdkVvLNpVMprwcOV1B+5ejOS32BNiDGfxTzAimDhFXeo4MTPcJ
	89r93+VRGYDYjO0m/C3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzqhm-008sjf-TR; Wed, 22 Dec 2021 01:46:10 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzqhi-008siC-Ea
 for ath11k@lists.infradead.org; Wed, 22 Dec 2021 01:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640137566; x=1671673566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VuWM9ykE02hxTRoiyiu1KAiRry+PZiBiSgTc27wTvqM=;
 b=tmwxx9OO5Bv37i+fg5/Uf8sUH5udOCzz8seLZFUk83ZHa6iztJod27J+
 nqn9p/U1iQVIr7+cSuAnuE2BSvGjm8vhoRqsJbZa92Vn2mmzhj4BmimUP
 ReTjMYCs8mR0QJClDkBiUgmOpb7/i1A/yW/OqUZ3NvtDP8edbYnx/ywDD U=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 21 Dec 2021 17:46:01 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 17:46:01 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 21 Dec 2021 17:46:00 -0800
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 21 Dec 2021 17:45:59 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] ath11k: Fix unexpected return buffer manager error for QCA6390
Date: Wed, 22 Dec 2021 09:35:35 +0800
Message-ID: <20211222013536.582527-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_174606_555545_4B6EC306 
X-CRM114-Status: GOOD (  10.44  )
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

We are seeing below error on QCA6390:
...
[70211.671189] ath11k_pci 0000:72:00.0: failed to parse rx error in wbm_rel ring desc -22
[70212.696154] ath11k_pci 0000:72:00.0: failed to parse rx error in wbm_rel ring desc -22
[70213.092941] ath11k_pci 0000:72:00.0: failed to parse rx error in wbm_rel ring desc -22
...

The reason is that, with commit 734223d78428 ("ath11k: change return
buffer manager for QCA6390"), ath11k expects the return buffer manager
(RBM) field of descriptor configured as HAL_RX_BUF_RBM_SW1_BM when
parsing error frames from WBM2SW3_RELEASE ring. This is a wrong change
cause the RBM field is set as HAL_RX_BUF_RBM_SW3_BM.

The same issue also applies to REO2TCL ring though we have not got any
error reported.

Fix it by changing RBM from HAL_RX_BUF_RBM_SW1_BM to HAL_RX_BUF_RBM_SW3_BM
for these two rings.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Fixes: 734223d78428 ("ath11k: change return buffer manager for QCA6390")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c  | 2 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 38eeb6e7c6b6..2127ed89956b 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3847,7 +3847,7 @@ int ath11k_dp_process_rx_err(struct ath11k_base *ab, struct napi_struct *napi,
 		ath11k_hal_rx_msdu_link_info_get(link_desc_va, &num_msdus, msdu_cookies,
 						 &rbm);
 		if (rbm != HAL_RX_BUF_RBM_WBM_IDLE_DESC_LIST &&
-		    rbm != ab->hw_params.hal_params->rx_buf_rbm) {
+		    rbm != HAL_RX_BUF_RBM_SW3_BM) {
 			ab->soc_stats.invalid_rbm++;
 			ath11k_warn(ab, "invalid return buffer manager %d\n", rbm);
 			ath11k_dp_rx_link_desc_return(ab, desc,
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 1e279e99baa8..d5a497369b5f 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -371,7 +371,7 @@ int ath11k_hal_wbm_desc_parse_err(struct ath11k_base *ab, void *desc,
 
 	ret_buf_mgr = FIELD_GET(BUFFER_ADDR_INFO1_RET_BUF_MGR,
 				wbm_desc->buf_addr_info.info1);
-	if (ret_buf_mgr != ab->hw_params.hal_params->rx_buf_rbm) {
+	if (ret_buf_mgr != HAL_RX_BUF_RBM_SW3_BM) {
 		ab->soc_stats.invalid_rbm++;
 		return -EINVAL;
 	}
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
