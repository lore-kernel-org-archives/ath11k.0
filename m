Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4B7C433FE
	for <ath11k@archiver.kernel.org>; Sat, 28 May 2022 14:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PDz77X2YpUbKm+HugsDZIeETxEcKh68xdNGND2iq0I=; b=0BvVE9Owgpvpy7
	dNvn2ZfbDZA53K79YGh2G75RrH33K2RJKzsddZ+jjld/Dh6g2rNts/mbtpDDgFo++BPiQT1gqpNm/
	fjYDSM9GCBka8BhHzJPyGfQ8F1zJLYEYb4Zm8TvQEIx4CaX59YcB4OPWHYS38UTFSo9rEJ5ReQHss
	yyPox5l/Z3Ey7mbOFxFbnWbvoCriMALK64/anUAsHSAOdxW8DXZ/Nkn4Zib78x6XGx+DcWUnULP/b
	mMwqDTiwNqgaV1rKxJJqJssdxWLbOPbo8wHdsJFb/Z0gneGLBUerXQVvzGWRa9bxH7tsLgirFVWhh
	UZfegp7Wymnw6YiQTmZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuxOA-002Gcb-Mx; Sat, 28 May 2022 14:25:58 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuxO7-002GbE-JA
	for ath11k@lists.infradead.org; Sat, 28 May 2022 14:25:56 +0000
Received: by mail-ed1-x52d.google.com with SMTP id h19so404791edj.0
        for <ath11k@lists.infradead.org>; Sat, 28 May 2022 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KbxWDlL+f31Iv4yXrvS4EjbF/ghfF72fs8lCTuVNEck=;
        b=bxjjLNS6XZw7QGXX5R+4Jf0lwNKpUqVRrxJataQlYji7m3EUis/wMQhmoW9bglan4M
         /UZSk+W3vUM/S67Fhk7RW5yi+n2BqJbUXg8teg7fS3l5g9iz++mQrbkhMrE6B3WobQjh
         MxDcYq2y+JktasQOXhELvnDKsTSInvOj8y9liVQ/A8mEcwo+uoGLs2QeR2pFpS2ZOjgd
         tZ3bd8zIvOFwX6luOaC6dF5JP/xKFh0afLaSN/F7EArwrmfg2XQSEjgcYfe74Ozi7s6b
         NOZpkaALfL8C3ZXOQpRuIhNnTYKfZ7s2c3bI41TczZtNpK/5bccbv7+3gs03ymeD1o8o
         lExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KbxWDlL+f31Iv4yXrvS4EjbF/ghfF72fs8lCTuVNEck=;
        b=0DO3EZoqqJJCZubx2yK4aPUExsYcgkZ6HymPhKnNj59dXinj9IN7T40jzq0Le0TsJ3
         ZTtXsSyKE3mtyP7T1iOJUdaG9tchh1a/9Mv5c4KdqQ8g0oNo7PSBLU4bpMaaI92sBvwa
         GmyRCXr6akbERFWQxvGuXocv3wE6mr9JpSjQqSddam4D+czgeGGy7DCFlFOMDGpp776y
         IKZ9eX1RvsdB2ZwkD7ifazA0AQsHrKIojZCEyGuWUH/SSMWd3gAKlt4OgFKhrNLD+kAO
         OpRg+HfwW3egPlSkY/9d/fEB5lI7M9YLzlSMX3SyYgmGxhpAH3hkplpxyZKzKsR5oQf7
         z8Uw==
X-Gm-Message-State: AOAM5328HeIpAmmfpr8/1WtKNxNNXT2iUSALUNQwZaKxL07PCkFSmQ7c
	QlDiQmJfOKAV6c3VtYb+QoQsOmcZLjs=
X-Google-Smtp-Source: ABdhPJyfxT8XAzGJC0dKREtecTLuyCjugmGL4SpYp30E2dfWq45XCrO/Sz1dg8SdzdayCNAjoJVh6A==
X-Received: by 2002:a50:d0da:0:b0:42b:cfa8:f1ce with SMTP id g26-20020a50d0da000000b0042bcfa8f1cemr16534313edf.365.1653747953124;
        Sat, 28 May 2022 07:25:53 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id m3-20020a50d7c3000000b0042bc5e8f7fdsm3601915edj.16.2022.05.28.07.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 07:25:52 -0700 (PDT)
From: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] ath11k: fix missing skb drop on htc_tx_completion error
Date: Sat, 28 May 2022 16:25:16 +0200
Message-Id: <20220528142516.20819-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220528142516.20819-1-ansuelsmth@gmail.com>
References: <20220528142516.20819-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220528_072555_665299_7F3791A9 
X-CRM114-Status: GOOD (  11.96  )
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

On htc_tx_completion error the skb is not dropped. This is wrong since
the completion_handler logic expect the skb to be consumed anyway even
when an error is triggerer. Not freeing the skb on error is a memory
leak since the skb won't be freed anywere else. Correctly free the
packet on eid >= ATH11K_HTC_EP_COUNT before returning.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1

Fixes: f951380a6022 ("ath11k: Disabling credit flow for WMI path")
Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/ath/ath11k/htc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index 069c29a4fac7..ca3aedc0252d 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -258,8 +258,10 @@ void ath11k_htc_tx_completion_handler(struct ath11k_base *ab,
 	u8 eid;
 
 	eid = ATH11K_SKB_CB(skb)->eid;
-	if (eid >= ATH11K_HTC_EP_COUNT)
+	if (eid >= ATH11K_HTC_EP_COUNT) {
+		dev_kfree_skb_any(skb);
 		return;
+	}
 
 	ep = &htc->endpoint[eid];
 	spin_lock_bh(&htc->tx_lock);
-- 
2.36.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
