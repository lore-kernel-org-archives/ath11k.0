Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64B8C433EF
	for <ath11k@archiver.kernel.org>; Wed, 16 Feb 2022 08:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NMHvyNZWYQNQwZArfOEx82WU+AJ4OD/x7eVeXDCmt4Y=; b=fooSvZC1I5+Aoj
	PM+1YgD/xrp4Tli08QZsQ4AtVB9NZoPv0l88SIPnOUMI9Evf4dDaHkGQBR8/E2urQfSNuI6BziVq2
	su1p67QbM+C1xyHVelfB3/et/5L4t/c7giMizL2lQJhhT6DwDN0IGtVgujEs6ajxj447JqJOIXQ/x
	mrHeE9hxEJGlmV9b5YX9NWY1Bvd2Rj8E4D9jzpgR6xuFB4HvOy+nShHRV9opCdOFKyIH6C/fHj4m5
	PTbhK7prRIe4HVrODjy/X7eVqA+rd2n16sAxPYVvhi2oeszoTpdf+TiXr6S/maCLYgbqz3oljB49q
	35BmhuCIhL8y/CjfV9Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKFk2-0068hu-TO; Wed, 16 Feb 2022 08:32:50 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKFjz-0068gU-RE
 for ath11k@lists.infradead.org; Wed, 16 Feb 2022 08:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645000367; x=1676536367;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=qRzxwrAzA775KEAgATuoX2mgiC3P40OgCfS9DVA/Gu4=;
 b=vVC3UYhwhyFNQmlh62jV3Cepq0rt/zCYhgpvnex7VuRzm2S+T3Xo/8Yp
 icbSEc1zM4/M2dUlms6v9tz85LE3LsB+YuoWaouKO3emnJuaAvzQEIMMC
 oPy9V54dbBfXrxT9N53jMa3UN1+8/WuyRREmU6TF/ZF6UhoQVY5te5hRc A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Feb 2022 00:32:47 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:32:47 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 00:32:47 -0800
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 16 Feb 2022 00:32:45 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rameshkumar Sundaram
 <quic_ramess@quicinc.com>
Subject: [PATCHv2] ath11k: Invalidate cached reo ring entry before accessing it
Date: Wed, 16 Feb 2022 14:02:34 +0530
Message-ID: <1645000354-32558-1-git-send-email-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_003247_932988_89577C0E 
X-CRM114-Status: GOOD (  10.73  )
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

REO2SW ring descriptor is currently allocated in cacheable memory.
While reaping reo ring entries on second trial after updating head
pointer, first entry is not invalidated before accessing it.

This results in host reaping and using cached descriptor which is
already overwritten in memory by DMA device (HW).
Since the contents of descriptor(buffer id, peer info and other information
bits) are outdated host throws errors like below while parsing corresponding
MSDU's and drops them.

[347712.048904] ath11k_pci 0004:01:00.0: msdu_done bit in attention is not set
[349173.355503] ath11k_pci 0004:01:00.0: frame rx with invalid buf_id 962

Move the try_again: label above  ath11k_hal_srng_access_begin()
so that first entry will be invalidated and prefetched.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

Fixes: 6452f0a3d565 ("ath11k: allocate dst ring descriptors from cacheable memory")
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>

---
v2:
  - Updated commit log to describe the symptoms and the bug being fixed.
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 89b77b94..99c7e8a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2652,9 +2652,9 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 	spin_lock_bh(&srng->lock);
 
+try_again:
 	ath11k_hal_srng_access_begin(ab, srng);
 
-try_again:
 	while (likely(desc =
 	      (struct hal_reo_dest_ring *)ath11k_hal_srng_dst_get_next_entry(ab,
 									     srng))) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
