Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75638CCF2D6
	for <ath11k@archiver.kernel.org>; Mon, 19 Oct 2026 10:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQFJWikUmdm5hTbH2JXMw4PDnsWnUwlmAWb7JNvs+K4=; b=yqEc36tkafAwMcwv+p5eO8/zbT
	XnNTwssqS3ScSlGAaj1jLRNMXGJoZSaCJkbZcu3E1iBBNdgESY4i7bkUgH4kre4MI77Ec30phZDXB
	L1gksIFifCFwoDB3u9TXlUDKbn9Vu+W1Fp/8QmMpRuRgYzXjGznmM06ei6QS1ius6Hwy23s9/634U
	MYgrudFuQqX+JlTrn0kE7Esv3bIOKlqfUQcIea3LV1hCjF+N3YLC9Ju/B1JlRlHj8XqTd4aHSJkDI
	LKQ9OBKDRqoSBROD7XjE9q+K93HvC9TQXHaWSZh1GqgJyfYHDD3aK6YrPaupwszW1+JyEPecCOdF8
	A3Idcj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkAu-000000075Ec-0RhW;
	Mon, 19 Oct 2026 10:01:00 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkAn-000000075B1-2GuF
	for ath11k@lists.infradead.org;
	Mon, 19 Oct 2026 10:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=eQ
	FJWikUmdm5hTbH2JXMw4PDnsWnUwlmAWb7JNvs+K4=; b=Wz5y5dd1/tGzRF2FlK
	RQJxYGg0ulsAMuP8cEJDVqZXp6/OkKIWOPzu/8oF9s/38tBoeFR94/U2l3Ius8PH
	Oq8QPAlAkpgSsVm4ayRLyAUibL1370Lp7w+XI3W3JgZ8JIUKpb0NNqXJeaYJdmDm
	YLXOdawGBGRDHn6YuEF7k/EqU=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgC3E3g+6tVqofy8Ag--.62619S5;
	Mon, 19 Oct 2026 18:00:35 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Sriram R <quic_srirrama@quicinc.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Ganesh Sesetti <gseset@codeaurora.org>,
	Julia Lawall <julia.lawall@lip6.fr>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <jiale.yao@example.com>
Subject: [PATCH 3/4] wifi: ath11k: validate ready event MAC address array length
Date: Mon, 19 Oct 2026 18:00:28 +0800
Message-Id: <20261019100029.1908660-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019100029.1908660-1-yaojiale02@163.com>
References: <20261019100029.1908660-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgC3E3g+6tVqofy8Ag--.62619S5
X-Coremail-Antispam: 1Uf129KBjvJXoWrKFy7XryktF4xJFWfXw18Xwb_yoW8JrWkpr
	WfJ3Wjkr97Ja1xXw45Ja1xCa4rGanxtF17trWF934Y9Fs2vr1Y9F98WFy3XrW5tr48JF12
	vr4jyrsxGF90vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzxRDUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgPaFWrV6kPlOgAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_030054_645070_A69F227D 
X-CRM114-Status: GOOD (  11.16  )
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

From: Jiale Yao <jiale.yao@example.com>

The ready event reports the number of extra MAC addresses separately
from the fixed-structure address array. ath11k checks the reported
count before assigning addresses to radios, but does not check the
length of the array TLV. A truncated array therefore causes reads past
the supplied event data.

Validate the array capacity before copying any addresses.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Jiale Yao <jiale.yao@example.com>
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


