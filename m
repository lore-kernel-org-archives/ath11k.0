Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C66CD13DA
	for <ath11k@archiver.kernel.org>; Sat,  2 May 2026 07:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8FYF8oZhNqSuTK+FyZ824o92INSUjfpo9VA3IN58oI=; b=YwI/g4E1f2yec8EMJgXElG8Dn6
	Y5zsU+yjspsIn6SmeFiWN1fcIiAfudtra/Ip3BmJ9eb/HCyn5IhmJ4jTNqSWOalt2nSIudJR9IThj
	n1906/HyDlMGSxkx9cOo6UAISnV1MShiK153oRBkXu1zxx9epk2ITBQTk/N9991VaXxPLWYuTtVBr
	IVCnP3fQhunjw4ZYllDZXC3KanxZeuXrKcPRGpF3r/eMAj1moY68KLRwaL17CclSgEX1LReO0RbHb
	7PXQhftrYccNdTj4GxubHvV65qUrq2WBRmPwJJ31cvJuteNaYpPtu3dW5fK4GBhy1ZWGswzqsxb+I
	9WyRyeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ4Z1-00000008UhT-1PgO;
	Sat, 02 May 2026 07:14:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ4Yy-00000008UgJ-33up
	for ath11k@lists.infradead.org;
	Sat, 02 May 2026 07:14:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso17246795e9.3
        for <ath11k@lists.infradead.org>; Sat, 02 May 2026 00:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777706094; x=1778310894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8FYF8oZhNqSuTK+FyZ824o92INSUjfpo9VA3IN58oI=;
        b=krLWb6qiKD1OPpdkx7zshARvSoU8K47v7RmENHgs5vvPdFdbMx/uJGDV2haFCZXzlf
         cfLAkLT2qdogksZHYvsBMiCWR1M2JFiWPZ5R7h1XJBtPGHx674TCSpOEijph+DM69me5
         rZ36F1Nw6jfACCIbkdK71ihfALF9YmpsSgdu8r91kAZ72etn0aaczn+CKdb3R/pdxpOZ
         tPNJAXCqM7YzuMwbGijL8WVa6bf5RzlxjzWKa+GTuAxsamPFBMQ80VknFhuq+Re8ghaO
         MsGdshZthSsWTK27eZc8GFK1nLR+xGNdnWEkMdJRcsVbpD7ydLlMPh1/tRk92X/Q0ln5
         EWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777706094; x=1778310894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v8FYF8oZhNqSuTK+FyZ824o92INSUjfpo9VA3IN58oI=;
        b=REsPLCYMTw1Kyg8IlL3glzguux85mTH4FsmrI/NnIsI7cDuJOdR+pb85IU0UqBVPrk
         Y1A9Lk9bdijfcNIPTr+XNAc7WXVyVrj4IUclncXrLpEhDR8FLWCMEE0AsRjJyWjAo40q
         Gr+Sp16ytK6jFN2lJ2Bu4N2fjPpg1iGaVmdnWvGoQUlvw8OXZOxkhEPXz9obPlGRa5Nl
         gqJHmMF8ntssbt7oLMkrQfRqDqbW1FpkzvaLxIc3X3CqzoFtaJw2DTkWlyBNhVvLcV3H
         Q7XjzMthtxn8aRpEG9+Dbbtdv1z3sIFP4o+J5U6q0GASNYrwtBniYZMQlMMweqMmEJs9
         oMqg==
X-Gm-Message-State: AOJu0Yy+T4qEDHZNlw4UhPeRBHad3gMPr7RZGMX67gOVE2/SbAK8Bgpm
	qTvh9sR2aInhlY+Daqk3QGJC48Gf7q6Mt6gIM7i/qeYsyyT/XI5zjIK/8c2laA==
X-Gm-Gg: AeBDies6MqkfQ61dyIcPJlxYKA8LSn3rBe/Z6zJGrTyg4L7cl5XLiaIeGSVhvz6tj+s
	Xjht2yJaEkdqSjrdJzpsm0ss0Q9yEA9yWkqY1NspSEmtHAcvC6/BCeU/pwyF3SxszPDJ4T++L/S
	gVb2VaYKASRZJxT5xe2YFHOi7I24sXhUUcRxINpRfRLP+Av7F0491G779gpbal4Vd/06OrPCc1M
	YtARBeGqUSZkwECvOUHzWC4PyH4A+vKEOPPg6cSZm861beJt4v+VNvc9asl43BJLKP4SvgS28ka
	S2Reo6Lve+zEXQp0IfEvDn5ADq3MxkfTSfc7reQabYiF96o4YWWDzpby3OFLAQ7JdVrIkipbuq6
	g2J3ZwPWDqXTz9Wzo/mBNkxjpjqIY3ssutDVBsaY1J/F8BfoQq4SrEOHDHHq47+xKnzUzKpuHHP
	ZTtdzUwTI37gzWlRB3Ana8+WM90qVnZ9fO83YhSwjdoPMdqD5V5mi0VmSeUxUhBXsP5l4=
X-Received: by 2002:a05:600c:c058:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-48a9866a998mr23542205e9.21.1777706094287;
        Sat, 02 May 2026 00:14:54 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm281862135e9.9.2026.05.02.00.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 00:14:53 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 1/2] wifi: ath11k: fix error path leaks in some WMI WOW calls
Date: Sat,  2 May 2026 09:14:52 +0200
Message-ID: <20260502071453.2379188-2-nico.escande@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502071453.2379188-1-nico.escande@gmail.com>
References: <20260502071453.2379188-1-nico.escande@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_001456_789452_9BB56C3C 
X-CRM114-Status: GOOD (  10.42  )
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

Fix two instances where we used to directly return the result of
ath11k_wmi_cmd_send(...). Because we did not check the return value, we
also did not free the skb in the error path.

Fixes: 79802b13a492 ("ath11k: implement WoW enable and wakeup commands")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 40747fba3b0c..024c2aad9fb4 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -9332,6 +9332,7 @@ int ath11k_wmi_wow_host_wakeup_ind(struct ath11k *ar)
 	struct wmi_wow_host_wakeup_ind *cmd;
 	struct sk_buff *skb;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd);
 	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -9345,14 +9346,20 @@ int ath11k_wmi_wow_host_wakeup_ind(struct ath11k *ar)
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow host wakeup ind\n");
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_wow_enable(struct ath11k *ar)
 {
 	struct wmi_wow_enable_cmd *cmd;
 	struct sk_buff *skb;
-	int len;
+	int ret, len;
 
 	len = sizeof(*cmd);
 	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -9367,7 +9374,13 @@ int ath11k_wmi_wow_enable(struct ath11k *ar)
 	cmd->pause_iface_config = WOW_IFACE_PAUSE_ENABLED;
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow enable\n");
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_WOW_ENABLE_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_scan_prob_req_oui(struct ath11k *ar,
-- 
2.53.0


