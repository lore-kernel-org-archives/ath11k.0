Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94842C433F5
	for <ath11k@archiver.kernel.org>; Thu,  2 Dec 2021 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2uZ2gPgVKDnavBhHpbAZWYXD/wJqhjCeE6qoCDacAo=; b=a3hP3cayiqa/7B
	M0UGSIdrWxN3IWlLMpjuWWJ5Uh1fK8em0ZeMGPme8g6W4vVQVFqPYkh65f8WqPnlF6vkn5Hwdd9eO
	NLgDx/fX7vSs8Fs2HYcSSds8x/0rCjhpT2iUPXUX6EWdP7uQ6acgbG9fWz/dqf5370wcACidrmkpz
	ghg7pMUykSE0/DUyT03a15LnpR2IgevPrc4+p2w9djzEqNun0Fpj/O7tekmH/lYUfplt2ZwEKsgbE
	6cM3nZ2hVDOjdm0aaAjdM+A6L3XzHAIGLj7MsH1fD6ZiM9hmalg06fXJtI9r4qF6eYTMGx+y7fMqm
	fkbV5ZWWVfAcDO/Na8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msoT4-00CtL6-00; Thu, 02 Dec 2021 15:57:54 +0000
Received: from mta-p8.oit.umn.edu ([134.84.196.208])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msoPR-00CrxP-Hp
 for ath11k@lists.infradead.org; Thu, 02 Dec 2021 15:54:11 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J4gVY0YP1z9vCFn
 for <ath11k@lists.infradead.org>; Thu,  2 Dec 2021 15:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LlDZRM-Q7861 for <ath11k@lists.infradead.org>;
 Thu,  2 Dec 2021 09:53:56 -0600 (CST)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J4gVX5ZCWz9vCGC
 for <ath11k@lists.infradead.org>; Thu,  2 Dec 2021 09:53:56 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J4gVX5ZCWz9vCGC
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J4gVX5ZCWz9vCGC
Received: by mail-pl1-f200.google.com with SMTP id
 p24-20020a170902a41800b001438d6c7d71so2316plq.7
 for <ath11k@lists.infradead.org>; Thu, 02 Dec 2021 07:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V3zoBlZxTPRde+g9siLNuGgPLd+nbCtyGK7PJZtAzXw=;
 b=pW66DglKGJex4eJG5S3bkebOToXrAxAMRF7n4cPv4eCwz/vzdbuLvxm2zn7D9QQexs
 eh2wLt3b5PZNHt9uCChMdSQOsxJ+0MtpTROcQ4bOQkyxv/sfgmqyWYx5yfjbRnglUybE
 6smFSTVOURVlEb6CwGbmknMJ1OSPph3xAeH/o+32vFW/zfJGhnGWbQy64kApRtqtVJBH
 BGn+DydsJGixzmeedfGDJDPc057n3UY3hqqiaaA8fU2D+pYzmelOqarKO0GpjIxhbWp3
 pYI1XOdujSpjtrbilM8atNfSJ3yuFa9521QK3zWgoresL76ctEItdU209ujAtDnrCIqY
 1n4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V3zoBlZxTPRde+g9siLNuGgPLd+nbCtyGK7PJZtAzXw=;
 b=tHMWdsZLgMlLBCMjX62Lb/zdC9uMpgwM2jJGqKE80Vb4nwyU9lWbqjo14A8oD0y6dH
 41PxsT+9RGm3b6YCEK8cG1Xfsiblr5KMhJJDA2/iwJ23EmH3K/rnokqdGm4RyHd1YShV
 hZo5cHX69uUf/T8clC9TJruAEQJvYYuCscfeFKS4VXQKRZ1ldVTFliwA/pxvarX8CBb4
 afEJ9djEd+nwAeimNGsbYZzh0cAe76n3gpuMxX8Khj4Sa4SG8GTUEZEXqzns3iICAGt8
 ip7g3WJrkx5q9Aj2X4WIQvUxhcVqQxgoJ6hnStY4lWmClvk4x652aZVubir+z0dble7K
 zSSg==
X-Gm-Message-State: AOAM5325yHG/7C1VbGK7VS+p9cQe4u9mjGzhP0cc/YyJ5Ol9cXEIxxwh
 YGKPn6aLJnG+xP6Z1iLxznVXRQb2RVondaue0iGL7C/AfbVGxrO7WX4ck5EivU+UlNjJzvSHn48
 bDXHvdUgvzJDiNVgz9MPQXwFz0g==
X-Received: by 2002:a62:7a54:0:b0:494:6e78:994b with SMTP id
 v81-20020a627a54000000b004946e78994bmr13252853pfc.5.1638460435881; 
 Thu, 02 Dec 2021 07:53:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXmzC6zPzMQWzj5Zn4utpm5MsgA8OcVZjno+y9o8C7JA4+WJDkDp/FfzK2BpQf1slpLD7V9Q==
X-Received: by 2002:a62:7a54:0:b0:494:6e78:994b with SMTP id
 v81-20020a627a54000000b004946e78994bmr13252830pfc.5.1638460435652; 
 Thu, 02 Dec 2021 07:53:55 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.93.212])
 by smtp.gmail.com with ESMTPSA id s21sm240877pfk.3.2021.12.02.07.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 07:53:55 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Shashidhar Lakkavalli <slakkavalli@datto.com>,
 Ganesh Sesetti <gseset@codeaurora.org>, kbuild test robot <lkp@intel.com>,
 John Crispin <john@phrozen.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] ath11k: Fix a NULL pointer dereference in
 ath11k_mac_op_hw_scan()
Date: Thu,  2 Dec 2021 23:53:48 +0800
Message-Id: <20211202155348.71315-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a29a8153-2a4f-1876-ec48-47e08db00a98@quicinc.com>
References: <a29a8153-2a4f-1876-ec48-47e08db00a98@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_075409_728845_F769C937 
X-CRM114-Status: GOOD (  17.72  )
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
Changes in v2:
  -  Use kmemdup() instead of kzalloc()

 drivers/net/wireless/ath/ath11k/mac.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1cc55602787b..dcefe444e7e3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3237,9 +3237,12 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 	arg.scan_id = ATH11K_SCAN_ID;
 
 	if (req->ie_len) {
+		arg.extraie.ptr = kmemdup(req->ie, req->ie_len, GFP_KERNEL);
+		if (!arg.extraie.ptr) {
+			ret = -ENOMEM;
+			goto exit;
+		}
 		arg.extraie.len = req->ie_len;
-		arg.extraie.ptr = kzalloc(req->ie_len, GFP_KERNEL);
-		memcpy(arg.extraie.ptr, req->ie, req->ie_len);
 	}
 
 	if (req->n_ssids) {
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
