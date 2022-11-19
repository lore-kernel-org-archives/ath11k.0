Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A3DC433FE
	for <ath11k@archiver.kernel.org>; Sat, 19 Nov 2022 02:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkBhp5Z6pT60Mck5wdXoSMY1e/xAPKrDZuvdaw3km/0=; b=3pH1y/vOFG5Jtu
	c7Lp6/G1jNKQu5eSDiCdXA79/F7oZr/55TesL1qrlpSXDFhl0t1hvYFU5zkIGG6zArsmzSVFUszIu
	FVY8fJUnSLs4LDCDE8yPz2VHI8rf7ZyNw1yexaf6Ug7SGZFHMpL6bNv+tVdHxQCLA50vIDtgQjXn4
	ytIYhIEi29wYyOzLAlDqEjD8NZ1ZBOf5Ov51xp+laTYPOWvO1vdi+e2HimHD4yc3TWhqqa1KEoD9b
	Drt9Phcbtovkz2/K7wP1/x/qypxjfOhmO1Oqe+KMtH1GK/zL4t972pYkk0jzMA2y8VmpRBvM6oHct
	7WdjRBtQmmwJbT1XuQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owDKj-00AFDQ-M6; Sat, 19 Nov 2022 02:11:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owDKg-00AFCY-Ky
	for ath11k@lists.infradead.org; Sat, 19 Nov 2022 02:11:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 962FB62834;
	Sat, 19 Nov 2022 02:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218F9C433D6;
	Sat, 19 Nov 2022 02:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668823908;
	bh=MlbvOiMIzJGCXboIDtutu175+4WxBuENiY1GhJnkDZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wh2MdlZHjiBMPeR/gIIUiIJ4FZuwq2WGLD/ngAk4vb7E12EWPKEDvLjlvF+bkQLyX
	 cqrQfZM90kjWpNI16b68VVgkTTKSsjigVBiJ18qZy0R2YfSFY4NyKS7FyozNf+hhEM
	 e2zsgDMcklKVT0oJK2aamjTUL1rjDR7JsOTpv36l6UvNx7Gb2aAdgTIKwASmHAQkxX
	 q/8xCy9K2iVVyGDim038YMMJrN3pwIVCwTrxv3pq6q0FZZJfv866wzHn56UOqet+dF
	 +4tOAhFJJ7rXilkyfMKQzJWl4MZiwQEJdlO0W1yvxKnGlHQUaWmCSgqd9BpxKARi0S
	 ckByuHzek6dww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Tyler J. Stachecki" <stachecki.tyler@gmail.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 10/44] wifi: ath11k: Fix QCN9074 firmware boot on x86
Date: Fri, 18 Nov 2022 21:10:50 -0500
Message-Id: <20221119021124.1773699-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021124.1773699-1-sashal@kernel.org>
References: <20221119021124.1773699-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_181150_749674_71278E50 
X-CRM114-Status: GOOD (  13.48  )
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

From: "Tyler J. Stachecki" <stachecki.tyler@gmail.com>

[ Upstream commit 3a89b6dec9920026eaa90fe8457f4348d3388a98 ]

The 2.7.0 series of QCN9074's firmware requests 5 segments
of memory instead of 3 (as in the 2.5.0 series).

The first segment (11M) is too large to be kalloc'd in one
go on x86 and requires piecemeal 1MB allocations, as was
the case with the prior public firmware (2.5.0, 15M).

Since f6f92968e1e5, ath11k will break the memory requests,
but only if there were fewer than 3 segments requested by
the firmware. It seems that 5 segments works fine and
allows QCN9074 to boot on x86 with firmware 2.7.0, so
change things accordingly.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16

Signed-off-by: Tyler J. Stachecki <stachecki.tyler@gmail.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20221022042728.43015-1-stachecki.tyler@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/qmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 2ec56a34fa81..0909d53cefeb 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -27,7 +27,7 @@
 #define ATH11K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	52
 #define ATH11K_QMI_CALDB_SIZE			0x480000
 #define ATH11K_QMI_BDF_EXT_STR_LENGTH		0x20
-#define ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT	3
+#define ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT	5
 
 #define QMI_WLFW_REQUEST_MEM_IND_V01		0x0035
 #define QMI_WLFW_FW_MEM_READY_IND_V01		0x0037
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
