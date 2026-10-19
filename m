Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4350CCF2DA
	for <ath11k@archiver.kernel.org>; Mon, 19 Oct 2026 10:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/lTBcvbDBAETbw6KOJHM2bPYpGYh6uRe7+houmWly4=; b=YqLJ9ghGwgfy1MzaFUQ+9zV3ZY
	s8r3XlJQK6JeNcEPEe8bUcCl5rvc8JSB/YmUy65/kxfOKV5AU6PJ5LybJlfve4gJmq3pi86DHh3V4
	IDtSOijnOSsu4hCXbnrKLp2lYz/T4ZLNMYicBK8b/XaaV1GwbupOzAps7thQHmaNUjfUmYcST267b
	xrgNc8vPtL/FsL2Sj//oL1c+ZKVIDIqIsld0EpbVVBg0b9uyfgWtgDhtyEQj4NKqR6iUjQVM892RY
	J9fUdAefoBc62QPyvPvOt+otX2fvphq96A39yFv2K59GCUBTw/2rr7f6/0+3glfrmV89ZaxREQNYB
	FvTZ4Sag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkFM-0000000764h-2FrI;
	Mon, 19 Oct 2026 10:05:36 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkFJ-0000000761v-16hY
	for ath11k@lists.infradead.org;
	Mon, 19 Oct 2026 10:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=x/
	lTBcvbDBAETbw6KOJHM2bPYpGYh6uRe7+houmWly4=; b=EVJSNz/nEqhy9DLwmr
	iqglyHq26MpxkwDWfTKPNOOD/QFRcBzrEu1MQhYI8kKuIOCA6Q0gcAOpV8cCVGyM
	wSVkMM7QOUvDlwKH+6A5qQx3UO7AdRz4n6Cf2mPzLE6LDFqTXD5wN26LKI92bxr+
	tvy/0B1dfZC1ENfMz+Cha8n9Q=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnLyhT69VqOE_ABA--.43992S5;
	Mon, 19 Oct 2026 18:05:12 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Rajkumar Manoharan <rmanohar@codeaurora.org>,
	Bhagavathi Perumal S <bperumal@codeaurora.org>,
	John Crispin <john@phrozen.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 3/4] wifi: ath11k: validate ready event MAC address array length
Date: Mon, 19 Oct 2026 18:05:05 +0800
Message-Id: <20261019100506.1915181-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019100506.1915181-1-yaojiale02@163.com>
References: <20261019100506.1915181-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnLyhT69VqOE_ABA--.43992S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7JrWDtr4rKrWktF17Cw45ZFb_yoW8Jr1Upr
	WfJ3Wjyr97Ja17Xw4rJa1xuFyrG3ZxJF17trWrK34F9Fs2vr15CF98WFy5Xry5tr48JF12
	vF4jyrsxWF90v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pM5lbXUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BghW2rV61iALQAA3z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_030533_694583_8249C9E0 
X-CRM114-Status: GOOD (  10.77  )
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

The ready event reports the number of extra MAC addresses separately
from the fixed-structure address array. ath11k checks the reported
count before assigning addresses to radios, but does not check the
length of the array TLV. A truncated array therefore causes reads past
the supplied event data.

Validate the array capacity before copying any addresses.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 995fee2ffdfa..9a048c7d9858 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7328,6 +7328,9 @@ static int ath11k_wmi_tlv_rdy_parse(struct ath11k_base *ab, u16 tag, u16 len,
 		if (!(ab->num_radios > 1 && num_mac_addr >= ab->num_radios))
 			break;
 
+		if (len / sizeof(*addr_list) < ab->num_radios)
+			return -EINVAL;
+
 		for (i = 0; i < ab->num_radios; i++) {
 			pdev = &ab->pdevs[i];
 			ether_addr_copy(pdev->mac_addr, addr_list[i].addr);
-- 
2.34.1


