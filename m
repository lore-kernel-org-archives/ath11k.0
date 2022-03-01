Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1E6C433EF
	for <ath11k@archiver.kernel.org>; Tue,  1 Mar 2022 01:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EOmgO8R06zWjvtCp11Ms8SOzFZ+y/1NB6Cl3DAM2u6I=; b=jzBxjb/CCl9v3r
	8QwSEJ3feXwY/DfMhlYNvUf65G6pc779a3nl5Vkm2ovM7eQ1AnnGM0bOtwDO2siFXMb+GTCSn+GDu
	Y09BU8DRTeeJYRFFQxd7LdmU0A1vMuhy3daZOUyCLpGrGa1w8PC/pAZqcEXagugjr3sEE7q815Ykm
	w2UwSUAzby6iWWvkpOUZQ2dmY+mW0XxMSDR98PZOOxExGJVpQ8rvljA4zYYu0/kXd77l0mA7mYntj
	GllH1VcCZ9wB64rc6YE9tPIY4I3+Iuv1mHHmo7mc94qZWMdhXmqFau0jFYljut+yDQ57/MvG+v/Wz
	FOL0HL15O+2Cx8kxFo2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOrNs-00Eajp-EI; Tue, 01 Mar 2022 01:33:00 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOrNp-00Eaie-O5
 for ath11k@lists.infradead.org; Tue, 01 Mar 2022 01:32:58 +0000
Received: by mail-qk1-x72d.google.com with SMTP id v5so11890863qkj.4
 for <ath11k@lists.infradead.org>; Mon, 28 Feb 2022 17:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9JEn06hcww2L6NS4S3p4jO39Ct9x9lpXynd0qsWDBiA=;
 b=ooLMJfc6fgqPxZvdt2P1iN6fDeJda7eqKYC88DNkDtigehLPK04vGLcKYaIEcNWnol
 1z/ZNyUr+FHs/Jf1Nqru9j1ugBzU2M+kuZ3RxxdzKw+ZaE8lfOApbt+dSfM44nBWtqlF
 bS7DApyT+OfSYITA1ftjd9QnyR4S0fY9yBlbHdRdouLIadZfFGkKqqPEw3oZCOFGJe5N
 PDLA1hRe8DQVmdOqBv+j1MI5i/VnovsR9VsR53vCpHovS0gWK2QdSGFr+obDTZIRk9r+
 0iUGYqi9lyPIx2DR6zh3OoA4zWGYgUcu2qd2hOzwmJpu1CePifEq0lVA3EiZ6OwlpPH3
 YDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9JEn06hcww2L6NS4S3p4jO39Ct9x9lpXynd0qsWDBiA=;
 b=Ai3yPBSAN8ijxfP+zZFxTmlUA5YVucXdqyh1QB3idCJanBHn1RGt3LHJdUW0T1VeIS
 HB6+kOaLupJMqpjdw8BobI4Hs4GzmUH7UO6XHThXd3LgPWut+5nudfgz8M+FapuwUoZE
 scQoXJ7bDO/JN7mkc0Zhp4c785+P46s/B/PjZgM8smjQaXBcFar2j4JCXLzC1mwNfX8Z
 I/RZGMw2irNxybDkjY3MugX85sub4g8JGWXuW3GRWkdg0Jxv55JttoZnjw699l2XQ+l8
 j4Di7bvO1DwRwj9MdWxj0v2hlkH9Q1HENJYta2WOr6PfOx8JiCXkRuT+6H3oxXnE6fAI
 tVYw==
X-Gm-Message-State: AOAM530XMeTS06pIgRyi55MupZLiANvEB2n7zIM+T+p4Z6FJueHmiNI+
 H6W8OEh7CY+4UKKVwKVE1dQ=
X-Google-Smtp-Source: ABdhPJzo0tWiorMvWcE9Vcd9FqDf7fgvFbLMLlJtG/G2wXt9rlQP2Mw+EG2A3+Gk1V8rJH1HWcjz2A==
X-Received: by 2002:a37:2791:0:b0:60d:d5a2:965e with SMTP id
 n139-20020a372791000000b0060dd5a2965emr12712941qkn.701.1646098374149; 
 Mon, 28 Feb 2022 17:32:54 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05622a121000b002deaa0af9e2sm7937286qtx.49.2022.02.28.17.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 17:32:53 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: kvalo@kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Lv Ruyi (CGEL ZTE)" <lv.ruyi@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] ath11k: remove unneeded flush_workqueue
Date: Tue,  1 Mar 2022 01:32:46 +0000
Message-Id: <20220301013246.2052570-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_173257_812668_193823A0 
X-CRM114-Status: UNSURE (   8.57  )
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

From: "Lv Ruyi (CGEL ZTE)" <lv.ruyi@zte.com.cn>

All work currently pending will be done first by calling destroy_workqueue,
so there is no need to flush it explicitly.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi (CGEL ZTE) <lv.ruyi@zte.com.cn>
---
 drivers/net/wireless/ath/ath11k/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 5d570a2cc2a5..71eb7d04c3bf 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1417,7 +1417,6 @@ EXPORT_SYMBOL(ath11k_core_deinit);
 
 void ath11k_core_free(struct ath11k_base *ab)
 {
-	flush_workqueue(ab->workqueue);
 	destroy_workqueue(ab->workqueue);
 
 	kfree(ab);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
