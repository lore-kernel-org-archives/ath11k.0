Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23DCFF8855
	for <ath11k@archiver.kernel.org>; Wed,  6 May 2026 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=566swxN5CfK8+IAC0jG77Ukl7ynr7hgeiWhy9OmUy48=; b=WrxH3OBFQnzk+ggalDScTZSRFh
	Khljg34vcdpDY4FDj7ZcvDla6Oe3BryO+sGb4FPCMt7Puj/KaKlFMPNgQNakXHnbas12fBAktEm04
	zR0RfRLysjzdGAbC5LlAJrupWsIWnjTpHKZApPoR1xfZKlQMXQdw4nhgmjwK4AgFYRF7Vq2WsZ0dV
	zg285etFPoVerZR8XDAMccBI2g31fsAHwYCCYedl5+YCCZu3pNZDwjGf8loP3UdSQdim4MnuXJxwP
	3WJ0a7ob7YwSVDhw8ZHjUNuhIeVxgcVIVKKUs/rKFvs5/gzP33f1LZCDVnghpcJKHlXCyCLPye+9Z
	jLMtKohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcWV-00000000vuO-1CZm;
	Wed, 06 May 2026 13:42:47 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcWR-00000000vr7-2yMg
	for ath11k@lists.infradead.org;
	Wed, 06 May 2026 13:42:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so4980838f8f.0
        for <ath11k@lists.infradead.org>; Wed, 06 May 2026 06:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778074962; x=1778679762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=566swxN5CfK8+IAC0jG77Ukl7ynr7hgeiWhy9OmUy48=;
        b=L0BdSv9LD23gqnIqzuNtmUEgbezv1Cf+tHVBJK6/zGYd3aL/Tslo3dS9x7C4c2LeyC
         JVSokrYi6NKZHz6xSD5LyPvotkRiJZCnx35zH8Ay6wHkTo0bA/a9QQuQJV9VEYUTLgsM
         SKNAjxfZCRr5CVhK62EBhndqeoPafwaqkjDGCxcF442NdXTGYqkU97+XlLs++J5D1myg
         HN/kpiJWNf8/boXc0O2qXvE3y74ZjjsmpxwhR2EBQd0FtVTZIsRzTcNj8BCbFqb952kY
         98CJUN0kzof9Wz+tdZ95JxEYSc/gHht5LF1fMFyoV6glG9WyB86X1zCgD3yniOOqraCV
         nKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778074962; x=1778679762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=566swxN5CfK8+IAC0jG77Ukl7ynr7hgeiWhy9OmUy48=;
        b=l20qloQZF9KiRIf9yWVyUIit4ye8ApQ5vNFuwqrF4wWkbV2fXM80aPEInk0mdOp5MX
         kalDgqLxByB+CbAntjNjcWsSoXTJTmy8pLEnowPVrv5hC78541oRx7tt0nIRtAE0+HyY
         jtDX6gRRlnM+T5estff+cL9C5ePM3hGtuQ8fVtC1XWglzNJw4XQ0k5SMP3lK/bHfClIi
         WhTRXsBfAcK5hVD07GW/4tUBnHgAskQ3U/tTXDCmf/yrkJo/XOZx7hR3SczRdViJXZ4U
         EDsUJQH19Vtv5mpFHAJAUU4jy7JJLB7AQBt+/w8qzj2anN7t5Fd0EjYoyhLBYaxB9EkJ
         RSug==
X-Gm-Message-State: AOJu0Yz/og/xGj1LLxUqw6tHBOfk8qVnDH/xsghrgtmwTYWcRDWBpPkA
	PyDPayB50VCrfUfvLsYx9nc2zg5dBgIGNqqVYUdnXLZz5LRBON1SuatarKnO/Q==
X-Gm-Gg: AeBDieuFti8s0cK4dFYTZ7i0RhfdiqphCNh3lFyGhbsh0ugX8MP5STb0A1ZkHf0OodJ
	ipODqDztoTLi4zLA3fFM4auVknIFNbVcPcIsg6bbq5/prf0Q9EeLqGQR+BxXgHHzN0Rzq6HC12o
	J7a0ijNIfZwiqEWGYKgiLjB8J85F1tC0bWThDsvQoCCYa9XV715xBlgbyop9jcN4DxuGmMnkk7Y
	dr1FcZUPedtnSm+u0of0o5mnao9PFEA7znCyS1ZEL23nWd4CX5ib87oc/5nz3FOuhdprNaDVbMg
	iw1+/+u21yEVzpCum0GtYgt+XqXXG9oXOhqTX0G/oQStuUMZozqkAfr7P2Oem6N0N4DjPzVwNeO
	WMwsw5vrMD2Lf2TJrKDB9l9GmzqVKfhPTgqjeM/TzezxvEVAL016G7P+qH21mDMrxDmzLZp3/lF
	/9hIl2AoxwpHvM4CQv0bCBQCLH+X+scIELS12Kn7lH2EGrnDqMuLwCePBvsWNy2UuQ818=
X-Received: by 2002:a5d:6282:0:b0:451:be9b:5f79 with SMTP id ffacd0b85a97d-451be9b6047mr3058918f8f.2.1778074961723;
        Wed, 06 May 2026 06:42:41 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052483166sm12542182f8f.7.2026.05.06.06.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:42:41 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 1/3] wifi: ath11k: fix error path leaks in some WMI WOW calls
Date: Wed,  6 May 2026 15:42:38 +0200
Message-ID: <20260506134240.2284016-2-nico.escande@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506134240.2284016-1-nico.escande@gmail.com>
References: <20260506134240.2284016-1-nico.escande@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_064243_759792_D7A2969B 
X-CRM114-Status: GOOD (  10.53  )
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
2.54.0


