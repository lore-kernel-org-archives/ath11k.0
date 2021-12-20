Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2B4C433F5
	for <ath11k@archiver.kernel.org>; Mon, 20 Dec 2021 11:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8LQYucvM4UFwjjqWmlys/SleG9u/hzo3UvOp6UJKNwY=; b=2gkTq4BgDvn+6V
	G0dMtGr6gfEApVeDUqFrWr3R6aZ4efJM7OL4QXgO7tN2eQo1PHmJ2Xxl5AiJL2m9jNgrk+SSgGhVC
	3XOPx2yHsZDKnlJzoJSjwQL45ZDLdDBN+2xhyFV5FHDWJ03tDqTh6HQ7kMCeQxvd30Zc8fEED1Fdn
	ealuaKr/+sg15GWylorytHxg3N2HNdH2gZrbyJ462rdBR9WQpyDmQOqEeIVYejY1cgTGaoE7Upcnm
	r20JBgacJDageVyei8Ht8YffwCr6p9wM1CFTiqwWnW/Na1YcVdhUHS5e732vpD2CgvDZb8gxm8ItS
	mGATbM2mAdO+IHS+YPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzGoY-001z26-Ni; Mon, 20 Dec 2021 11:26:46 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzGje-001wCU-6y
 for ath11k@lists.infradead.org; Mon, 20 Dec 2021 11:21:43 +0000
Received: by mail-qt1-x82a.google.com with SMTP id p19so9326553qtw.12
 for <ath11k@lists.infradead.org>; Mon, 20 Dec 2021 03:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MBczxJm3I08jjd/QHRuYvFh7bIEcTce0GBizMJSEP8c=;
 b=d1gSa9qhkemwcKujwOGSI9dzt9WFOOqxeh34+7xeJrowWMfJVVYGDxUvaP/s1dXTde
 WEcPWmAe83rq8rFEyyYCc6YoWWFFE/5X0pZJA3vYAnfeNrF6N35X6aJx//4G2p3qGxwO
 ZU0sOO9ThRkOZm1LMc4pmmonXPEO9LsfXYD40aYL/htTXNbf4nTpCjycyS+djxW01mmp
 /3dMO7BkFW3cxjmIHTMPSkqgbJwyYVVe9zCJrnTl0yHrIwH1C8juqbiAXRDuG4LOoTJ7
 wWftqOiYGjzblReWdiwVDSA+wMFvDKI5ZOj8dyN8Y61aTtUnwVa57sAFFxOX2h8b3kLI
 dNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MBczxJm3I08jjd/QHRuYvFh7bIEcTce0GBizMJSEP8c=;
 b=6p2dn5YsDnU6/AmC+iFXDAV0V4KtxYpQ2/H6zrFdbw05I7oswvIFhDAxbjRO7WX38m
 DpTR+kgIS3eZDT/TJesIeZBtR2SVp73nLpCe00SRWi1bxEvg+2AzMKT8ymPiqpwGFh7z
 ML2i6QGmVGTYEXQIwTWHDIO0RZS9DgZMVl0aSKJo3qbpmxV+0T//mK/M6sLpNp8DOLnO
 EIZDWBPOvZ0crmiCU4RuKcSTvGvr5lqKm6Cpki2XwlE5STIO7Sjxxz86aH7tQ87BbSxN
 GByy9pQMyPAzxsiz9ZK1yzSrP07bIhPaaGckVNxU2iIM7yL5G5yppWFexQfRTFz2e9JU
 OTzQ==
X-Gm-Message-State: AOAM532cMnZkVdhJvxcXOO7AjzKDvAPkcHdPHFeOcl2VKXzPVs9jQBJO
 RdDI0GtWrc3lwwV0TPHQ8DQ=
X-Google-Smtp-Source: ABdhPJxiHawe3//spU8yo9RWOXKIfuZi4wTgQUI6t9d6+bgFUY8WNgGtZAIp8IuoiNwyWSV176A+3Q==
X-Received: by 2002:a05:622a:170e:: with SMTP id
 h14mr1108255qtk.479.1639999299996; 
 Mon, 20 Dec 2021 03:21:39 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id o21sm14724301qta.89.2021.12.20.03.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 03:21:39 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: kvalo@kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] ath11k: use min() to make code cleaner
Date: Mon, 20 Dec 2021 11:21:33 +0000
Message-Id: <20211220112133.472472-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_032142_296582_C8BEF68B 
X-CRM114-Status: UNSURE (   7.88  )
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

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Use min() in order to make code cleaner.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2b4d27d807ab..083856034136 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -614,8 +614,7 @@ int ath11k_wmi_mgmt_send(struct ath11k *ar, u32 vdev_id, u32 buf_id,
 	u32 buf_len;
 	int ret, len;
 
-	buf_len = frame->len < WMI_MGMT_SEND_DOWNLD_LEN ?
-		  frame->len : WMI_MGMT_SEND_DOWNLD_LEN;
+	buf_len = min(frame->len, WMI_MGMT_SEND_DOWNLD_LEN);
 
 	len = sizeof(*cmd) + sizeof(*frame_tlv) + roundup(buf_len, 4);
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
