Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EF5C433FE
	for <ath11k@archiver.kernel.org>; Tue, 30 Nov 2021 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DzFNekEVccImIenVY0snnhqja949OpzPqmlGZZcUSkM=; b=xCgEzEi7i2dvHE
	rogFdHLX5qG69hoYNQbat/1RK1mnMcmk05cdVfI0Ryp3LegvmGaBkb0VDW//6uW1cAFbXSO3oz0Ey
	xxYe4r1o5hQy/AykmyCYELiqTIWlx4GvDhUhOVImqJshh/3p6Z5CVKyewjG7o1W59GCZqp8IkeSuo
	+eyIlpsMFI5/iiospR8sBkeVA/v+dSd4/h0bEfLNW87/kw/p530X5AkZkLV4TKE3un/CqhbxJlq+E
	cn0TvlhFhFzH3z6e+yEfaLq+LuW7rHWZMZ++YZ/272ORtCTpz4DzxlSDD8lVtcchNS8xz/LajyawI
	SzNI7/lKifruhAQIW+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mryjN-004AWS-Mv; Tue, 30 Nov 2021 08:43:17 +0000
Received: from mta-p7.oit.umn.edu ([134.84.196.207])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mryjJ-004AUe-8K
 for ath11k@lists.infradead.org; Tue, 30 Nov 2021 08:43:16 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3G2S0YTmz9vCGM
 for <ath11k@lists.infradead.org>; Tue, 30 Nov 2021 08:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DiTaIdLzMFl6 for <ath11k@lists.infradead.org>;
 Tue, 30 Nov 2021 02:43:11 -0600 (CST)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3G2R5VJBz9vCFp
 for <ath11k@lists.infradead.org>; Tue, 30 Nov 2021 02:43:11 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3G2R5VJBz9vCFp
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3G2R5VJBz9vCFp
Received: by mail-pj1-f69.google.com with SMTP id
 p8-20020a17090a748800b001a6cceee8afso6576414pjk.4
 for <ath11k@lists.infradead.org>; Tue, 30 Nov 2021 00:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w2+HpAwDa/HBxXc2VVtjYSYS1Y8V8tVj3abGe9wGHDk=;
 b=EdYA5Q2GIemYjDJPqF+oyaUvV3P5LSX4m2c2Kd71J8lrsdewKdAelfbMsXMWGixvrE
 ceKGqkzdfu8BTzITpU7Bm7eMLDRwZt88KJfPHAoCldicPib4kTbctWhbM4Z0CVSrYQ/8
 vGzBDlg9UraEEmBUNVNcH8xEhdqXIh/XQsxbCHVdsGRvu4JXwsVeyXY975BWku96n/c9
 5AzccnN4ccJtbQUCTa1LR8sTLof+wAgnBHqGPsmURKhn5E9qvuMok2t9/t+ywJdKUv8x
 avhvMdfqPYAzobUSeT6iNOln3B8KwSyqpIXxQCh34ZTuPOoxxHEFw/CLdOrLZt35x+S1
 MAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w2+HpAwDa/HBxXc2VVtjYSYS1Y8V8tVj3abGe9wGHDk=;
 b=j0VRIj31dX9UYoV03YSF2pSkgvW7fdBlAKnhDiYB6wvouEo2Gv8nBura0yMEe9hwWf
 +bvkgjex78dy15gGSQDO8oAVJ5ny3fl7eOkSNS+DapIoMEbktWWBT9ZoQaQO0YpWWArh
 68rzvicmy9JEty5uOAmEYbu937efjyJz4c8wHKKeqC+koHOikD6NlMlqLMJ94HQVsGNV
 7CjvsOKrg9hmBldYWTmCmt0USTFWTR7Ixy+HWDxKsm0FYcBDoiD5AMyAJRTMlHxnDBPW
 RFhiuI330j9+HVRABmZRV8ELEfU8IR2T4ACkJx8IEUJO/UZ2UqCQ7ZrhvYmAgWiGOF74
 i/IQ==
X-Gm-Message-State: AOAM530CzAkjSC3UEV7AzUBwnvU9E6+fFIJ8Hf7IUoiK3b3ucwmMNxNf
 JCTbzCfI7rtGEy4Ljdno2VZ8L7MWkhkZDMmYJWIwesHHjRjtOFz2WGy+EUXG7vGFFLBEG73R2l5
 x1NeYNK8I9x3SWCmI7mBxj2JPvg==
X-Received: by 2002:a17:90a:c58f:: with SMTP id
 l15mr4344401pjt.168.1638261790863; 
 Tue, 30 Nov 2021 00:43:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0xFxpS2KHZUTUB75/FtM3PAAx67zjQxerMVpND32xQFqaPgXo3bBmJYOsoiUb/JCP/+UwFQ==
X-Received: by 2002:a17:90a:c58f:: with SMTP id
 l15mr4344381pjt.168.1638261790641; 
 Tue, 30 Nov 2021 00:43:10 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id d2sm20962168pfj.42.2021.11.30.00.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 00:43:10 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Manikanta Pubbisetty <mpubbise@codeaurora.org>,
 Shashidhar Lakkavalli <slakkavalli@datto.com>,
 Govindaraj Saminathan <gsamin@codeaurora.org>,
 Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ath11k: Fix a NULL pointer dereference in
 ath11k_mac_op_hw_scan()
Date: Tue, 30 Nov 2021 16:43:04 +0800
Message-Id: <20211130084304.72160-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_004313_468371_3AEBDBAC 
X-CRM114-Status: GOOD (  16.51  )
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

In ath11k_mac_op_hw_scan(), the return value of kzalloc() is directly
used in memcpy(), which may lead to a NULL pointer dereference on
failure of kzalloc().

Fix this bug by adding a check of arg.extraie.ptr.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_ATH11K=m show no new warnings, and our static
analyzer no longer warns about this code.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/net/wireless/ath/ath11k/mac.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1cc55602787b..095f1f9b7611 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3237,8 +3237,13 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 	arg.scan_id = ATH11K_SCAN_ID;
 
 	if (req->ie_len) {
-		arg.extraie.len = req->ie_len;
 		arg.extraie.ptr = kzalloc(req->ie_len, GFP_KERNEL);
+		if (!arg.extraie.ptr) {
+			ret = -ENOMEM;
+			goto exit;
+		}
+
+		arg.extraie.len = req->ie_len;
 		memcpy(arg.extraie.ptr, req->ie, req->ie_len);
 	}
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
