Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894F8C98332
	for <ath11k@archiver.kernel.org>; Sat, 26 Sep 2026 11:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WUePfDmCfNLpzcWpvJPtJwMT6WGDZs7a4ovshwuMNTQ=; b=YC+vEEJ9+MeeaVo1wFDVHdpB2p
	JNB7nFENdpQiXT18gZBR4v3uLoedW+/xKXJFwsr3feFtYZVlA7P6qJANrC509pL/EoQ6tHoihPcu5
	9XUc1ipj1DSiXMsC3nzmHZsoh8uCjVfPtDLUMqqf7FlpuMptNTpCPqkZGu1FT2xqKyjaI5zz9KohF
	kcc1DmyP/pVoGDXDCSR7QOJpG1y0yGnnwymPzqrIoK8SLSPljCYoU0JKOW1TbkAhvKNMbV6j3HZZP
	6IJ/E9Q1pOp78WZ6l0cGbi2/2319Uvra0lFfc5g3mdm3h9rf4ZkB3sidqRGmP6Hjy03akPd/6zXMp
	n6NQmEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQmE-0000000FL1R-346N;
	Sat, 26 Sep 2026 11:41:10 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQmB-0000000FL0Y-3a2h
	for ath11k@lists.infradead.org;
	Sat, 26 Sep 2026 11:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=WU
	ePfDmCfNLpzcWpvJPtJwMT6WGDZs7a4ovshwuMNTQ=; b=OeXLYos5PK8DUaHnVp
	PbTSY/2nHlPojLssC33/39ZZSklHF9mf2bylb2eG3jvyTTO9F8QwptJIU6k3u0bb
	M54YcKH8ytHRQj/Kq/1pWnYvKCNQxB1mJl4TK8mdhI1eJyZGiQe3CGNnwo2AOZCB
	ogJbB2xN4XhsuzpUTjiL4nWlY=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3_5g2r7dqdKZ3Aw--.46536S2;
	Sat, 26 Sep 2026 19:40:39 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Shashidhar Lakkavalli <slakkavalli@datto.com>,
	Ganesh Sesetti <gseset@codeaurora.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] wifi: ath11k: Reject short management RX frames
Date: Sat, 26 Sep 2026 19:40:37 +0800
Message-Id: <20260926114037.3231795-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_5g2r7dqdKZ3Aw--.46536S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWUur43GryxJFW8Zw1fZwb_yoW8Xr4kpF
	W7KasFkry7AanrJr15AFW8ZayY9anYyFW2gFWrt345uFy5CF15tFn5WF9Yqr15tr45Jr12
	va1jvrW5Gas5t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRR6wJUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BeBu2q3rzefgwAA3E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_044108_300517_67CE7F28 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

ath11k_pull_mgmt_rx_params_tlv() verifies that the firmware-reported frame
length fits in the WMI event, but does not ensure that it can hold an IEEE
802.11 management header. It then sets skb->len to that reported length.

ath11k_mgmt_rx_event() subsequently reads frame_control and other header
fields without another length check. A firmware event with a short buf_len
can therefore cause an out-of-bounds read.

Reject frames shorter than a three-address IEEE 802.11 header before
adjusting the skb to expose the frame.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index bbca275a8289..02cd9764b6fc 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5995,7 +5995,8 @@ static int ath11k_pull_mgmt_rx_params_tlv(struct ath11k_base *ab,
 	hdr->tsf_delta =  ev->tsf_delta;
 	memcpy(hdr->rssi_ctl, ev->rssi_ctl, sizeof(hdr->rssi_ctl));
 
-	if (skb->len < (frame - skb->data) + hdr->buf_len) {
+	if (hdr->buf_len < sizeof(struct ieee80211_hdr_3addr) ||
+	    skb->len < (frame - skb->data) + hdr->buf_len) {
 		ath11k_warn(ab, "invalid length in mgmt rx hdr ev");
 		return -EPROTO;
 	}
-- 
2.34.1


