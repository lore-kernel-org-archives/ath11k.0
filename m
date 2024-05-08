Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D38C04FFE
	for <ath11k@archiver.kernel.org>; Wed,  8 May 2024 18:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eFrOIrDzTcMn622VateT75IhKFBfpAyCB1nXrmsjnHc=; b=Xq3ftSvMyt9NnA7xJ5qDjjxRZa
	sdZnBFLwBkRu77qbKXU0aCjMdCv+CJmO0+q3cLCO73qCk9YF6KMYOkqU60IoBnuP9ZfpUF5f9hyIZ
	HSvmC3+qWlGSXfkzEmN/ciUWlJF7EBpE/QCOVc2tavvW9YRXUrKxop2OrgEV6QLrCVXjst+4UamAd
	uWJelev/I6nlpPhopuQ+j28/fB81nuZjVoXUPhiBSMMNxCmGLFmLwavdc0KXsMHMTIW0wfJxbof/X
	aumFbQfrm0N8XvSmQKqelJFncHQefWk2IA+MIF8eU1sTBvm0ekFk4P5FeXXzd5SIfG6d7YjypvukQ
	ozNujVtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mVv-0000000GdM6-041N;
	Wed, 08 May 2024 18:59:39 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mVX-0000000GdBq-1u0n
	for ath11k@lists.infradead.org;
	Wed, 08 May 2024 18:59:35 +0000
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-572baf393ddso2002654a12.1
        for <ath11k@lists.infradead.org>; Wed, 08 May 2024 11:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715194753; x=1715799553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFrOIrDzTcMn622VateT75IhKFBfpAyCB1nXrmsjnHc=;
        b=YY/H2rY6Xdtkkl+lniPhtimd2qs4jsysl98JlHJeo3zg0aA6LH4cYulCa/B8DuLOnP
         V4nNA2DDHhtgNXuhVRgZo8cj6gdNKJfFhvtykuwMa3lcht6xIQcLJODE8T/Wumx/1jhz
         cKhwZgYAs6IPJnaNqIYzOkPkzKp4SZLjQsC0GkrP6Q1RQ89p5IahCP6Zw5+RLZC+5JkW
         V9TkTHKFoaDGeRIligZiDE03svGMJmdUMBShftSUW7Kxfj763OjnkcTFDtv7c6dPQN27
         XrRVinrPQKfngVHAYrU9rZOplS+5bgE0mBlGZYVX4YVAdh0XtviIqknPWNBuYu28hAMD
         gTfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXROiCWsqVEa89WpsMGOlTgELoUe45MINtqpe7tkS+VW2tv+TJEklA+t/96ArT1vi6BnyC7WpMXCB8fuolHlmMZR0//2sZP2/aYLw==
X-Gm-Message-State: AOJu0Yzei765bQCl+vbSHRdnS4lbRgLAbnDGXG2TnhCVMwXKJTuqno3m
	v8vn56X08qwxYfqrJh/usXQ22dYcK3vhKH5VWEGtqQomnd/8m6k4
X-Google-Smtp-Source: AGHT+IEK4RWsOUL+8o+nVUUM0654BVgn5v3VnQl5a8AzTg5iRjxacDUtx9DKydCnJGRbKSZJvyiVQA==
X-Received: by 2002:a50:d50c:0:b0:572:3eaa:a637 with SMTP id 4fb4d7f45d1cf-573326dbfe0mr342070a12.2.1715194753099;
        Wed, 08 May 2024 11:59:13 -0700 (PDT)
Received: from localhost (fwdproxy-lla-006.fbsv.net. [2a03:2880:30ff:6::face:b00c])
        by smtp.gmail.com with ESMTPSA id ee53-20020a056402293500b0056fede24155sm7890077edb.89.2024.05.08.11.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 11:59:12 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: horms@kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS)),
	ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless-next] ath11k: Fix error path in ath11k_pcic_ext_irq_config
Date: Wed,  8 May 2024 11:59:01 -0700
Message-ID: <20240508185902.70975-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_115915_571271_F928097C 
X-CRM114-Status: GOOD (  13.91  )
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

If one of the dummy allocation fails in ath11k_pcic_ext_irq_config(),
the previous allocated devices might leak due to returning without
deallocating the devices.

Instead of returning on the error path, deallocate all the previously
allocated net_devices and then return.

Fixes: bca592ead825 ("wifi: ath11k: allocate dummy net_device dynamically")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/wireless/ath/ath11k/pcic.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 79eb3f9c902f..debe7c5919ef 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -561,6 +561,7 @@ static int ath11k_pcic_ext_irq_config(struct ath11k_base *ab)
 {
 	int i, j, n, ret, num_vectors = 0;
 	u32 user_base_data = 0, base_vector = 0;
+	struct ath11k_ext_irq_grp *irq_grp;
 	unsigned long irq_flags;
 
 	ret = ath11k_pcic_get_user_msi_assignment(ab, "DP", &num_vectors,
@@ -574,14 +575,16 @@ static int ath11k_pcic_ext_irq_config(struct ath11k_base *ab)
 		irq_flags |= IRQF_NOBALANCING;
 
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
-		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
+		irq_grp = &ab->ext_irq_grp[i];
 		u32 num_irq = 0;
 
 		irq_grp->ab = ab;
 		irq_grp->grp_id = i;
 		irq_grp->napi_ndev = alloc_netdev_dummy(0);
-		if (!irq_grp->napi_ndev)
-			return -ENOMEM;
+		if (!irq_grp->napi_ndev) {
+			ret = -ENOMEM;
+			goto fail_allocate;
+		}
 
 		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
 			       ath11k_pcic_ext_grp_napi_poll);
@@ -606,11 +609,8 @@ static int ath11k_pcic_ext_irq_config(struct ath11k_base *ab)
 			int irq = ath11k_pcic_get_msi_irq(ab, vector);
 
 			if (irq < 0) {
-				for (n = 0; n <= i; n++) {
-					irq_grp = &ab->ext_irq_grp[n];
-					free_netdev(irq_grp->napi_ndev);
-				}
-				return irq;
+				ret = irq;
+				goto fail_irq;
 			}
 
 			ab->irq_num[irq_idx] = irq;
@@ -635,6 +635,15 @@ static int ath11k_pcic_ext_irq_config(struct ath11k_base *ab)
 	}
 
 	return 0;
+fail_irq:
+	/* i ->napi_ndev was properly allocated. Free it also */
+	i += 1;
+fail_allocate:
+	for (n = 0; n < i; n++) {
+		irq_grp = &ab->ext_irq_grp[n];
+		free_netdev(irq_grp->napi_ndev);
+	}
+	return ret;
 }
 
 int ath11k_pcic_config_irq(struct ath11k_base *ab)
-- 
2.43.0


