Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA1CC00A94
	for <ath11k@archiver.kernel.org>; Fri, 12 Apr 2024 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1ZiDdEdBLa6WUq6dSl5bzwxlD6MdFYlMkt9vqw7lek=; b=Lje1rilFt5h2tv/YZKgGv+gnKG
	defpjLS4kClPenp+EPsMTLb1XlXtjW/NY+iXkJ/VYIdaqNCDbKvb1HnNXtswDTg/nAPPTkBaWR4Nt
	u38T5eVxgaqwE9SEAs2Remh0e/nBu8K2kXiaZ1NQttF4+LXwd4YJlaHgnFrLWOctNlUU7bfGY5E64
	UF+jERiucngrrgemmTBN4WQqzrcAWOBo4yH4QaU9Fo2VhHF/BUK8aVmizLWhbizTLzfbszhx92T8N
	Elq2ipRA1xj/v2QYwpd4hu/fFicDH/GsiX7DVtBDcqn7BWG2OtV4pEBd9PWQDQh265vgo1zOQ64Yt
	Q3CSPIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvJiM-00000000Tiw-1hW3;
	Fri, 12 Apr 2024 16:25:22 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvJiI-00000000Tfh-2HbV
	for ath11k@lists.infradead.org;
	Fri, 12 Apr 2024 16:25:20 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d8863d8a6eso13112031fa.3
        for <ath11k@lists.infradead.org>; Fri, 12 Apr 2024 09:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712939115; x=1713543915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1ZiDdEdBLa6WUq6dSl5bzwxlD6MdFYlMkt9vqw7lek=;
        b=V1vBQpmgOU1oY0DY7NGSZ0VYMyOfVerQnlmctVz45aJfocTSoIjebylQQLYHhmaZ43
         Mr+VLXz+Jlsp8LsmyhNe5XdZ5Ih6/uzCS8y0Pub8fzzdYlDtNHmnbwAkUvEoTKA79WAb
         TMRGxdAnCaYmrsch8AgRoiJNoZylGsA5E2Cy6UcXf1ciHnmNCHUOUrP3kGnxztF1+4K1
         goBnVFo42MrougTCDBq4vRw8m4zEyQXyzRmmZMnJSBy9+ucMmhw5wtOJMP7ZdsCneWhT
         /YSPGNTFpuQ05RrPP2xKelIp+/m0Q1GRvTq/VbCxgIq+Sc0s6yqDdWbVygyZwys/PLSL
         2AiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712939115; x=1713543915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1ZiDdEdBLa6WUq6dSl5bzwxlD6MdFYlMkt9vqw7lek=;
        b=K3v3QRfbj8Ms7cx1wvhzQiCwASjj0R/oadJFDl1wB5yyLji27O/Krk99G2RFqU1dHZ
         1kGpSx0vuN0PfC2L7meAi3cB5JLieoMY+3ZztA6buYZxW8ZlKwbuQhyl6qXI34KrVTIc
         OsYT8X+wqiwJsFBE61LyEOSO5YTXdPoFE5AiomxBU7fWNHcxMiJHlyakR3NCMVVVBa6e
         Zb7Rzig491wWFLkIpsUI51FoUa/Mk2mw/e4xa8GUZojvx4ZJcU/nsueMdyc9Zvi6Qt7M
         +JViiyJkAESd82Z7ISi5fhfvc6u75EyCH64YvX8TrUjq2BaUiCuUqUCLnChyXFzrAWTg
         GWDA==
X-Forwarded-Encrypted: i=1; AJvYcCXSV0BtUrq5vw/PP/1H3fR/8t/uapZqWYsBxCYNGA1qfWYNaRXcMmHlN3DGWRTUbjg8v9tZPNTf2vHxUjOx9SiCPZA9kuu+KdsVqg==
X-Gm-Message-State: AOJu0YyXWa/lGJVG7AO7Dk4t1u+87Lfj9JWFOJ/AFlJ7//sIQP4QM/8B
	9Sh0JoVj14ZGrObxG19s2CZqOn0cFTVdOnikC5+2RvvM+3jsAfiO
X-Google-Smtp-Source: AGHT+IEA2Mx2PVZ0wxEHfJ9V8RofGxmOrjMMCiJmTk1zmlFqSPe8iGWGd2yd72AmB/HZ5oyd/lApWA==
X-Received: by 2002:a2e:7c19:0:b0:2d8:cd7f:3cc8 with SMTP id x25-20020a2e7c19000000b002d8cd7f3cc8mr2526091ljc.20.1712939114765;
        Fri, 12 Apr 2024 09:25:14 -0700 (PDT)
Received: from fedora.. (d-zg2-064.globalnet.hr. [213.149.37.64])
        by smtp.googlemail.com with ESMTPSA id q4-20020adff504000000b0034635bd6ba5sm4576554wro.92.2024.04.12.09.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 09:25:14 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 2/2] wifi: ath11k: support DT ieee80211-freq-limit property to limit channels
Date: Fri, 12 Apr 2024 18:24:09 +0200
Message-ID: <20240412162510.29483-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412162510.29483-1-robimarko@gmail.com>
References: <20240412162510.29483-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_092518_616559_EB1108B8 
X-CRM114-Status: UNSURE (   9.08  )
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

The common DT property can be used to limit the available channels
but ath11k has to manually call wiphy_read_of_freq_limits().

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c32be587000d..59bde128d351 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10124,6 +10124,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	if (ret)
 		goto err;
 
+	wiphy_read_of_freq_limits(ar->hw->wiphy);
 	ath11k_mac_setup_ht_vht_cap(ar, cap, &ht_cap);
 	ath11k_mac_setup_he_cap(ar, cap);
 
-- 
2.44.0


