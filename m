Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162E7C433EF
	for <ath11k@archiver.kernel.org>; Thu,  7 Apr 2022 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZwdcTT9GNnsB7uJqyLJvhsVMpqmY8CfisVhY/7F8B2k=; b=COS8HRhG+/+s1g
	33Cm/Ixaws+33+TNM4wcCjUaMrsFZbPmqMYu1hk91dk4lqbkbD87nKZK2vM3d+nO8pLA1r7SNseZj
	dlSFBSVsJWefdbVqM1Ui3vzbFf0Auk6Zb/71bhTVzFng3cHNSim1yZUeTxu7ZWxH/oYznDuGV/Cr0
	ZupHfg74LtH6lcYejWYUaLF8dvjObM3LobC9WtWfETa720A+cbHTw2NaACeddg37V3r86xY0K00vU
	ePCK7jVKpGowCUO2iu+IU5eBeTk/+vO1FsyLajN6LgBoUPjlJULqJ9GyfK9KZb1eGJ9t6UjO/oUuA
	wxTFqvBrElLz4uCoY62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncPNO-00BDbB-0f; Thu, 07 Apr 2022 10:28:30 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncPNK-00BDZd-VV
 for ath11k@lists.infradead.org; Thu, 07 Apr 2022 10:28:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id z1so7177416wrg.4
 for <ath11k@lists.infradead.org>; Thu, 07 Apr 2022 03:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ysgmGY6z1GzJduDa17oOz+oi20hGek39JwUR/trWayM=;
 b=p/UKZVzzSUUKarQCEnoZqYwnOj+5vqcExcRo3+EUkYFVCcXjRLJIEQI5GVNfNtmCcF
 v8midJ0etw5XJGZTnMUnHCf95YASegao9CAoqK5BkIPREypo3OSYwoAVWIsB868p7x3N
 +xt6oxh97IpMEpGqXt4G5QNCPIcjcbqaDG0lxhtXHlJrTG/N910e2LFuEBqson19rxh1
 XF9x1CyDwoUwZPMo/fa0ngSje09cbZMublaAXz7je8SfS8mhDo4Hl5eDAkyMWWJREsbO
 3rgFQBxtbt0v98Zg0m3Uya9j10VNdFDtllzVNsDdpUsI/OPNmjcjDMFIdH/ejYcNbo6/
 LajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ysgmGY6z1GzJduDa17oOz+oi20hGek39JwUR/trWayM=;
 b=NtVoiR9dBUutl1+HwfrRjE6+JKkfIJBMH+++YBzJaBbJbcGzgIB1Zaqw4U5h3qRaY0
 d826oB8bA+K5PGvelMi5yGMYKl5D6Py37wIU743ocW9hvXV0STurXo0FtYhi8mbtH7to
 AFKmZrF7WBqfOTxAjCBJ4oZpPi4lUJs0OhUzZsxMqG2/0c4Hm00yWJwoWXtrkcCWjCKx
 1+JZ6jiUlO85CBYuFyAMpzLdRRo9wmZTT7nD0jGIFQyXeooX1Y2C8NikZQ/boRqyJDwl
 ymtN7numjx8xaTebtPhPNC77jUwASHOGQRxAA4jSWY0xqXLMNRnxaEQY8xsTZ268YqK4
 PuuA==
X-Gm-Message-State: AOAM530AEtw5++my2rBHvoCWcwmBHLGUUTu+oIc1iwb0MNYeLjX9AGqu
 BI09jpGdhx3cD0P1s4lN5265Ryfk/m/yeA==
X-Google-Smtp-Source: ABdhPJypRKzmEZSzNa0J3mxMTVI9MuNVTozm69KlQDYEEvfmJj13FcjuX0vcYG5/HgQzqulKmvGw7w==
X-Received: by 2002:adf:dcc1:0:b0:206:1a02:95a0 with SMTP id
 x1-20020adfdcc1000000b002061a0295a0mr10127116wrm.183.1649327302637; 
 Thu, 07 Apr 2022 03:28:22 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c3b0500b0038e7466b048sm7727933wms.0.2022.04.07.03.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 03:28:21 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ath11k: Fix spelling mistake "reseting" -> "resetting"
Date: Thu,  7 Apr 2022 11:28:20 +0100
Message-Id: <20220407102820.613881-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_032827_049540_3C0C64CE 
X-CRM114-Status: GOOD (  10.59  )
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

There is a spelling mistake in an ath11k_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index cbac1919867f..1537ec0ae2e7 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1567,7 +1567,7 @@ static void ath11k_core_reset(struct work_struct *work)
 		 * completed, then the second reset worker will destroy the previous one,
 		 * thus below is to avoid that.
 		 */
-		ath11k_warn(ab, "already reseting count %d\n", reset_count);
+		ath11k_warn(ab, "already resetting count %d\n", reset_count);
 
 		reinit_completion(&ab->reset_complete);
 		time_left = wait_for_completion_timeout(&ab->reset_complete,
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
