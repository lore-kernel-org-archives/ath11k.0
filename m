Return-Path: <SRS0=OGZV=PV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9B9C433EF
	for <ath11k@archiver.kernel.org>; Tue,  2 Nov 2021 05:41:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9593360E52
	for <ath11k@archiver.kernel.org>; Tue,  2 Nov 2021 05:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9593360E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mp8OkxTI3s2YG6Lt8aTaWjB/rlWvH+44jfBaOBbk15I=; b=zYch34Pwj+R4gZ
	aVziawTcBVil81U+xMItB3wdFk5XONSX7zYt7MEQm2x52h/VMUbgGgmb4sJ3Wn7X7De2b053VLZO3
	oQmWvoMTjcCCwjKR7WqbAjUnzoc9j0n4oeLRGvSNz0PjaM/gsLa7+CYOQi5/+jpWOc9/OqavFJlzi
	6qCP5mwq94XF9I0k+50wPi4HKCBdbIjOjl4RfWMhcXDw+1G418NEtVih5OLbNwBdf58xL0PNNhABp
	n5/xtXHDXVgY5/2jhOkyduptDzZfJH7XKDbaO+J3H+mOAHRJoOPEDlWb+P1SD369f5IT9NRcb89tx
	bG/9tEYrCDjQ+uyy0+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhmYP-000aZw-6u; Tue, 02 Nov 2021 05:41:49 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhmYN-000aZO-Ed
 for ath11k@lists.infradead.org; Tue, 02 Nov 2021 05:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635831707; x=1667367707;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=h/R3ybRNJOwRMKQUJ9PXBt3E9jGLPafBWDnsilxKGKI=;
 b=cTvNemvp2/H4mKjFFnpEkx8j/zmCkZWr3VPzgRqcZ1/MsuW3lqkndF4d
 scew1q25WSoZb0gp1ulx0i7SznC0qkjgiFY3IyNiu4+m45iFYOa8CrEnD
 K5zEInNu+LNFzZqKXlZkxdaCUiMozl/cArS4Ex/Nk2sHNN3TVSb/IGDmi g=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Nov 2021 22:41:44 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 22:41:44 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 1 Nov 2021 22:41:44 -0700
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 1 Nov 2021 22:41:42 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rameshkumar Sundaram
 <quic_ramess@quicinc.com>
Subject: [PATCH] ath11k: use cache line aligned buffers for dbring
Date: Tue, 2 Nov 2021 11:11:33 +0530
Message-ID: <1635831693-15962-1-git-send-email-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_224147_550127_D9CF23AA 
X-CRM114-Status: GOOD (  13.80  )
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

The DMA buffers of dbring which is used for spectral/cfr
starts at certain offset from original kmalloc() returned buffer.
This is not cache line aligned.
And also driver tries to access the data that is immediately before
this offset address (i.e. buff->paddr) after doing dma map.
This will cause cache line sharing issues and data corruption,
if CPU happen to write back cache after HW has dma'ed the data.

Fix this by mapping a cache line aligned buffer to dma.

Tested on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dbring.c | 16 ++++++++++++----
 drivers/net/wireless/ath/ath11k/dbring.h |  2 +-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dbring.c b/drivers/net/wireless/ath/ath11k/dbring.c
index fd98ba5..de220a1 100644
--- a/drivers/net/wireless/ath/ath11k/dbring.c
+++ b/drivers/net/wireless/ath/ath11k/dbring.c
@@ -87,17 +87,23 @@ static int ath11k_dbring_fill_bufs(struct ath11k *ar,
 	req_entries = min(num_free, ring->bufs_max);
 	num_remain = req_entries;
 	align = ring->buf_align;
-	size = sizeof(*buff) + ring->buf_sz + align - 1;
+	size = ring->buf_sz + align - 1;
 
 	while (num_remain > 0) {
-		buff = kzalloc(size, GFP_ATOMIC);
+		buff = kzalloc(sizeof(*buff), GFP_ATOMIC);
 		if (!buff)
 			break;
 
+		buff->payload = kzalloc(size, GFP_ATOMIC);
+		if (!buff->payload) {
+			kfree(buff);
+			break;
+		}
 		ret = ath11k_dbring_bufs_replenish(ar, ring, buff);
 		if (ret) {
 			ath11k_warn(ar->ab, "failed to replenish db ring num_remain %d req_ent %d\n",
 				    num_remain, req_entries);
+			kfree(buff->payload);
 			kfree(buff);
 			break;
 		}
@@ -282,7 +288,7 @@ int ath11k_dbring_buffer_release_event(struct ath11k_base *ab,
 
 	srng = &ab->hal.srng_list[ring->refill_srng.ring_id];
 	num_entry = ev->fixed.num_buf_release_entry;
-	size = sizeof(*buff) + ring->buf_sz + ring->buf_align - 1;
+	size = ring->buf_sz + ring->buf_align - 1;
 	num_buff_reaped = 0;
 
 	spin_lock_bh(&srng->lock);
@@ -319,7 +325,8 @@ int ath11k_dbring_buffer_release_event(struct ath11k_base *ab,
 			ring->handler(ar, &handler_data);
 		}
 
-		memset(buff, 0, size);
+		buff->paddr = 0;
+		memset(buff->payload, 0, size);
 		ath11k_dbring_bufs_replenish(ar, ring, buff);
 	}
 
@@ -346,6 +353,7 @@ void ath11k_dbring_buf_cleanup(struct ath11k *ar, struct ath11k_dbring *ring)
 		idr_remove(&ring->bufs_idr, buf_id);
 		dma_unmap_single(ar->ab->dev, buff->paddr,
 				 ring->buf_sz, DMA_FROM_DEVICE);
+		kfree(buff->payload);
 		kfree(buff);
 	}
 
diff --git a/drivers/net/wireless/ath/ath11k/dbring.h b/drivers/net/wireless/ath/ath11k/dbring.h
index f7fce9e..78a985f 100644
--- a/drivers/net/wireless/ath/ath11k/dbring.h
+++ b/drivers/net/wireless/ath/ath11k/dbring.h
@@ -13,7 +13,7 @@
 
 struct ath11k_dbring_element {
 	dma_addr_t paddr;
-	u8 payload[0];
+	u8 *payload;
 };
 
 struct ath11k_dbring_data {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
