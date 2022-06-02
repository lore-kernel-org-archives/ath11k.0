Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6514BC43334
	for <ath11k@archiver.kernel.org>; Thu,  2 Jun 2022 12:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DvPyAx8oSdr7PcSzcB3/5O2v5ZPfOsgD1UkyJUYE4SQ=; b=hoRkqSUD1lUMLW
	joCcvqmBuzGbYADNN+/lfTO4iqZbkRPdBzyRqgGp0y0KMOgFHcs4RRDzEfB26jeApZvRalFV7I6Jx
	GadPWC1Ts+lvxVCl212NC+c/QCOLeNokvjA/xascIoi4CWRlyrL4v1uNd5cA+huH6xUlHj3l/66zZ
	58m3UDhoLINWc6DsyQ/WDMNNP/jz72rNpRjV98IAU0Rg9SpaXx/cRiP/VKmUf0dVqyRghQffNeCX2
	5IhUn81PsxZn/l23omuo4ZC1Hrd7wZZxB9ywZuzh9B/SKku5AcwmH012EFtfq+UoKhRROp9vBnxJV
	T0mH0YrgRkb5tCBqcsSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjxb-003DXS-Uv; Thu, 02 Jun 2022 12:29:55 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjxZ-003DWO-06
	for ath11k@lists.infradead.org; Thu, 02 Jun 2022 12:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654172993; x=1685708993;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9AjnxMvJuxH4TY/KbMZHtuCZaHlq8F3bM59fs+EKbyw=;
  b=tSGc4uTR0WoY9mM/YjlYFKWzHo6HNoLuWR98NG6v8/PohIcStHZZzAMG
   ufE4Z0ensdf4/hXcOVa4wLIIc38dR3PeMneG0heSTuBV/Br/shj+AvnHC
   w7JOkvfueoBPZIrQsG85H/eQj2GvbMGg7oVwacaz92y7DVT7RUB7a3SAT
   I=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 02 Jun 2022 05:29:49 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 05:29:49 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 05:29:48 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 05:29:47 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH] ath11k: Avoid REO CMD failed prints during firmware recovery
Date: Thu, 2 Jun 2022 17:59:29 +0530
Message-ID: <20220602122929.18896-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_052953_113743_79671715 
X-CRM114-Status: GOOD (  11.21  )
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

Currently when firmware recovery is in progress, we do not queue REO
commands to the firmware, instead -ESHUTDOWN will be returned to the
caller leading to a failure print on the console. The REO command in
the problem scenario is sent for all tids of a peer in which case we
will have 16 failure prints on the console for a single peer. For an
AP usecase, this count would be even higher in a worst case scenario.
Since these commands are bound to fail during firmware recovery, it
is better to avoid printing these failures and thereby avoid message
flooding on the console.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Fixes: 8ee8d38ca472 ("ath11k: Fix crash during firmware recovery on reo cmd ring access")
Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index e16beb96c37c..2148acf37071 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -835,8 +835,9 @@ void ath11k_peer_rx_tid_delete(struct ath11k *ar,
 					HAL_REO_CMD_UPDATE_RX_QUEUE, &cmd,
 					ath11k_dp_rx_tid_del_func);
 	if (ret) {
-		ath11k_err(ar->ab, "failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid %d (%d)\n",
-			   tid, ret);
+		if (ret != -ESHUTDOWN)
+			ath11k_err(ar->ab, "failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid %d (%d)\n",
+				   tid, ret);
 		dma_unmap_single(ar->ab->dev, rx_tid->paddr, rx_tid->size,
 				 DMA_BIDIRECTIONAL);
 		kfree(rx_tid->vaddr);
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
