Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEF6C3ABB2
	for <ath11k@archiver.kernel.org>; Wed, 28 May 2025 06:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6C+2QOW7/ZJEC4rlOPPzFqqXSyx5rUQG+Wyj+dRbRCg=; b=W6Ldim0thiR20/6aHrWkR9PsI+
	EYNyagD4bjZtw4ZJYhpyAYxnPJhr4Qdc9+4i0v0mBQ68bj/ghIh8o4vB9hAYzWNqc2IRgtKA+y0sR
	f3QntEdAXalKjX8LJxUOts9WhOgtKIkhRwE357MOi8Q06tmUNVeA6MFzjqWL+57ReUiNqnYgCddrB
	yaOJ7vVCtTh3JGOKLFXHNv6QPgQi+8k52QH2OyDXAOTvWFG3Oc4/Ia6Hxp1BR47UmtUC3pIdS9YF6
	m88ep8NBFrTjjPjmxQmZF6q31MFxc774GxvjYKPCbHJf0sSjXB5iw0AUeefxqp+0c+HZCkgdPu3Ok
	g5jFGOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAh4-0000000CMj9-3bBo;
	Wed, 28 May 2025 06:55:18 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAh3-0000000CMhY-0gIw
	for ath11k@lists.infradead.org;
	Wed, 28 May 2025 06:55:18 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23461842024so26924385ad.0
        for <ath11k@lists.infradead.org>; Tue, 27 May 2025 23:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748415316; x=1749020116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6C+2QOW7/ZJEC4rlOPPzFqqXSyx5rUQG+Wyj+dRbRCg=;
        b=kc/DjkjImXXUjwbTICpW/LWYRj1RuT7pWHqfYFodV7OPWShPK6kOkDp0/4h+8X7EC4
         RJzpIJoWRrKzCy52DAHzVDL1S5kofQy2AOeM4CFbsuVmN14mrY7HvT37gkwQmN8uR2ZD
         cfLGpapEvsoWvhi32advM5UgBM0ie3Cq06Kjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748415316; x=1749020116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6C+2QOW7/ZJEC4rlOPPzFqqXSyx5rUQG+Wyj+dRbRCg=;
        b=PMMvD/6GH4sGFnMDM8ClZllI2xpnDZmx0jpbB7BqTY8Mit4xynC0/rOUMiu6Pbu/uV
         CC9rkslK9gWG9DZgGh9XEvXuJ/ty5cu1Gnb1WjK9+2zcNrF3qkW7QxV/AL0UK0CWAFrj
         PMSoHoaMUt4DbtEMtPtD/WUpixL4j283pb6+S6CJeveNihU84Gdq1UYDres7xUA2R0QD
         Dsu2uxNOBvznqxqwtxu30diLXK5VVQY8iU+Kgqn5FYrcq74/AOAmKa++HrWR5FQsupLW
         v+IUh3uRWk82iRv6R6wGkn/49AnqyhUx/tu1heGwYAf9Ip8I4cj2gLTtpwm/YGUgSXrd
         XU4w==
X-Forwarded-Encrypted: i=1; AJvYcCXX5fEXIUAp0W2sRjwKrIXVG7a4xG/4YpN8u3hXIXyhynLNVJ7I9VDiYy7reD3cSExCMbJHjV0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxijQVdxcl7b6NjyEGdDy2inUZPNB34iufNwXI1glCjYJDuHWre
	6jN0FvYnQ/cPAXSYbjABvdJyweKFI3FwywW4W7O2t5X6PyDFjc1FopOOTtWXNJe80Q==
X-Gm-Gg: ASbGncsIJorj0bJ0FIWqvh7fYRj8GeTLt9r+btF53bXuioh99vJ887rk7SXA0gt/oRK
	6Xz9eAKF2mfGC8zb0ZpEC1ww2HGsYBVdOzgJgNsV6ACS9PqyTXUroVU52+Cg5ylqL2bdWO1KH4e
	03YkZvAfEN0dNvECsWQjdYqI1rndKmXloyySSgmpPLid+WX66qzZ20elB7wolg6cLY5hbgXTfK0
	YfU586c1RSyv7v7xr4MyRS3DoGZh9Q0K0/3xl4eieVPcNcnBUD+YAz+1t4NnhctN/SjOmQ2PraM
	XtIh+9EmvEHmyEYjPny86/pLQ/6g1OYqhcMkTJYDT/LujUA6U4hj+KQvN5Ic+5gntl+E4zd1yNs
	=
X-Google-Smtp-Source: AGHT+IE/QtR9qQUd+B8NC0qRL0iwl3NZ+QPWzLqIvwbbP5nfveyy0JEebh4jUyokCIMZHNZo9wpIvg==
X-Received: by 2002:a17:903:244a:b0:223:f9a4:3f9c with SMTP id d9443c01a7336-23414f3343cmr230103605ad.9.1748415315890;
        Tue, 27 May 2025 23:55:15 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:88fd:67f2:b90d:8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-311e3da5c37sm670902a91.24.2025.05.27.23.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 23:55:15 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] wifi: ath11k: mark reset srng lists as initialized
Date: Wed, 28 May 2025 15:54:27 +0900
Message-ID: <20250528065510.2790649-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.1238.gf8c92423fb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_235517_250380_250FED1F 
X-CRM114-Status: UNSURE (   9.57  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

ath11k_hal_srng_deinit() frees rdp and wrp which are used
by srng lists.  Mark srng lists as not-initialized.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/net/wireless/ath/ath11k/hal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 8cb1505a5a0c..cab11a35f911 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1346,6 +1346,10 @@ EXPORT_SYMBOL(ath11k_hal_srng_init);
 void ath11k_hal_srng_deinit(struct ath11k_base *ab)
 {
 	struct ath11k_hal *hal = &ab->hal;
+	int i;
+
+	for (i = 0; i < HAL_SRNG_RING_ID_MAX; i++)
+		ab->hal.srng_list[i].initialized = 0;
 
 	ath11k_hal_unregister_srng_key(ab);
 	ath11k_hal_free_cont_rdp(ab);
-- 
2.49.0.1238.gf8c92423fb-goog


