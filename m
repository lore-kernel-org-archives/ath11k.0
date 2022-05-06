Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1FAC433F5
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 14:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZOxDAVfJe3+qQZUZ87Oj8YRSU6CEXfiToFQNt+7tg+A=; b=FQM7ry3FaMP6jz
	QiRSd7WghVKDwh+rktslqG8gv9r5jw0DKrk0g33Ku9JWTzGJVXhKzWnKoYwQgFf6RjMqhQcJa6wED
	bLX2iuFJTqZ+DrsGbD3LjC/M52mCX2J2LOVsh3OvhM8UAAMEwGOLr4FDCwez6QjESEcv7V5Z1sO/+
	yBI9t765lupL73dm8jJxcuRLkUchksD8vHqB/LZgzf1p3iQgq9ahDaXlYsf0SusFMlo/lwAq5tQMC
	aLYtCf2fxPsbIAXXFxEGcmsaHvsIeaQtvufRT7/pbCe9DKkEnaVbYwQ5x+CsiVJKb/0yvNQh69DNJ
	TcSiv5gdE1CEfRiAfUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmyjw-003jHZ-Rf; Fri, 06 May 2022 14:15:28 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmyjo-003j7o-QR
 for ath11k@lists.infradead.org; Fri, 06 May 2022 14:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651846520; x=1683382520;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=+0DeCUXgHYOliKNNx5awok/fbx4nt/t/OE7cBsxR4zk=;
 b=nMdjhHTrLjUOaEbwUK760eQU7KQU4ZKEjJUiLMTrPrq0uku5A9WsMszL
 VuaYwbuw/YnG5D3cG1Z+VGtt/iu9hRCh7uI0VHMrDIj2gOKk/23DeUGsv
 APJKrPp15OLw5AsRmdTQcp93QUQ3LbWegY6PfRKriUx53yKkCfN1/0LTw I=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 06 May 2022 07:15:07 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 07:15:07 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 6 May 2022 07:15:06 -0700
Received: from hu-akolli-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 6 May 2022 07:15:04 -0700
From: Anilkumar Kolli <quic_akolli@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Anilkumar Kolli <quic_akolli@quicinc.com>
Subject: [PATCH] ath11k: Reuse the available memory after firmware reload
Date: Fri, 6 May 2022 19:44:48 +0530
Message-ID: <20220506141448.10340-1-quic_akolli@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_071520_954175_58D083F0 
X-CRM114-Status: GOOD (  15.57  )
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

Ath11k allocates memory when firmware requests memory in QMI.
Coldboot calibration and firmware recovery uses firmware reload.
On firmware reload, firmware sends memory request again. If Ath11k
allocates memory on first firmware boot, reuse the available
memory. Also check if the segment type and size is same
on the next firmware boot. Reuse if segment type/size is
same as previous firmware boot else free the segment and
allocate the segment with size/type.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.6.0.1-00752-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <quic_akolli@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c |  1 -
 drivers/net/wireless/ath/ath11k/qmi.c  | 24 +++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/qmi.h  |  2 ++
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 01e1d494b527..7115a3507bc6 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1768,7 +1768,6 @@ static void ath11k_core_reset(struct work_struct *work)
 						ATH11K_RECOVER_START_TIMEOUT_HZ);
 
 	ath11k_hif_power_down(ab);
-	ath11k_qmi_free_resource(ab);
 	ath11k_hif_power_up(ab);
 
 	ath11k_dbg(ab, ATH11K_DBG_BOOT, "reset started\n");
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index d1e945074bc1..61ead37a944a 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1970,6 +1970,21 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 
 	for (i = 0; i < ab->qmi.mem_seg_count; i++) {
 		chunk = &ab->qmi.target_mem[i];
+
+		/* Firmware reloads in coldboot/firmware recovery.
+		 * in such case, no need to allocate memory for FW again.
+		 */
+		if (chunk->vaddr) {
+			if (chunk->prev_type == chunk->type ||
+			    chunk->prev_size == chunk->size)
+				continue;
+
+			/* cannot reuse the existing chunk */
+			dma_free_coherent(ab->dev, chunk->size,
+					  chunk->vaddr, chunk->paddr);
+			chunk->vaddr = NULL;
+		}
+
 		chunk->vaddr = dma_alloc_coherent(ab->dev,
 						  chunk->size,
 						  &chunk->paddr,
@@ -1990,6 +2005,8 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 				   chunk->type);
 			return -EINVAL;
 		}
+		chunk->prev_type = chunk->type;
+		chunk->prev_size = chunk->size;
 	}
 
 	return 0;
@@ -2466,9 +2483,6 @@ static int ath11k_qmi_m3_load(struct ath11k_base *ab)
 	char path[100];
 	int ret;
 
-	if (m3_mem->vaddr || m3_mem->size)
-		return 0;
-
 	fw = ath11k_core_firmware_request(ab, ATH11K_M3_FILE);
 	if (IS_ERR(fw)) {
 		ret = PTR_ERR(fw);
@@ -2478,6 +2492,9 @@ static int ath11k_qmi_m3_load(struct ath11k_base *ab)
 		return ret;
 	}
 
+	if (m3_mem->vaddr || m3_mem->size)
+		goto skip_m3_alloc;
+
 	m3_mem->vaddr = dma_alloc_coherent(ab->dev,
 					   fw->size, &m3_mem->paddr,
 					   GFP_KERNEL);
@@ -2488,6 +2505,7 @@ static int ath11k_qmi_m3_load(struct ath11k_base *ab)
 		return -ENOMEM;
 	}
 
+skip_m3_alloc:
 	memcpy(m3_mem->vaddr, fw->data, fw->size);
 	m3_mem->size = fw->size;
 	release_firmware(fw);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index c24e6995cca3..c83cf822be81 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -97,6 +97,8 @@ struct ath11k_qmi_event_msg {
 struct target_mem_chunk {
 	u32 size;
 	u32 type;
+	u32 prev_size;
+	u32 prev_type;
 	dma_addr_t paddr;
 	u32 *vaddr;
 	void __iomem *iaddr;
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
