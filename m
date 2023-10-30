Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09026C4332F
	for <ath11k@archiver.kernel.org>; Mon, 30 Oct 2023 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5QRTgWPVAp5De8ZsIFUb1czjzS1npRvbxb1R3NvqN1c=; b=xDKPkRfcx/Yfoz
	94JMtj09wf2zedSmBdpwozrx5/xRrhDNnVJby3ELh/IGyNWOY8VEL1diV44XKmBFwlJ92cZTbR6LZ
	/H2qUrDQ9/WbOe25VMeGv1PRlA3VqycvopAhQwpLZXp2ZKurxU2CxFQziQT43lJ0NKqDMZ2IsM1CK
	ikA+Cc3hc8pzUfRSTvn22zjGVAnHlxEHZvsoy1GLa3ga4PM9wsLJKu8+Jj1tnLZ/ZiJMDuj8xgLee
	eC754SI+8PtUrEr0y1mNkbHuY32oFPL910pn8WX5Zxgb/t0vKro5MONrxCbbZNCLMLtZm9CwYwf7k
	gz8er/7qw7hugMPClqlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxLMQ-002dDw-1M;
	Mon, 30 Oct 2023 06:02:50 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxLMM-002dCo-1N
	for ath11k@lists.infradead.org;
	Mon, 30 Oct 2023 06:02:49 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Vv661Zr_1698645746;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vv661Zr_1698645746)
          by smtp.aliyun-inc.com;
          Mon, 30 Oct 2023 14:02:26 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: kvalo@kernel.org,
	quic_jjohnson@quicinc.com
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH net-next] wifi: ath11k: Remove unneeded semicolon
Date: Mon, 30 Oct 2023 14:02:25 +0800
Message-Id: <20231030060225.28987-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_230246_694500_883AA3DB 
X-CRM114-Status: UNSURE (   6.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

./drivers/net/wireless/ath/ath11k/fw.c:136:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7073
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/net/wireless/ath/ath11k/fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
index 8f84fba29886..4e36292a79db 100644
--- a/drivers/net/wireless/ath/ath11k/fw.c
+++ b/drivers/net/wireless/ath/ath11k/fw.c
@@ -133,7 +133,7 @@ static int ath11k_fw_request_firmware_api_n(struct ath11k_base *ab,
 
 		len -= ie_len;
 		data += ie_len;
-	};
+	}
 
 	return 0;
 
-- 
2.20.1.7.g153144c


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
