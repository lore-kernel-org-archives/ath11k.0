Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A4BD116F3
	for <ath11k@archiver.kernel.org>; Wed,  3 Dec 2025 05:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pG8HVy8WBKfj7Gbq7tiRoF3XvKUwWlK7Y7HtxcHNPoo=; b=OT0UlQnyZvSgQK30goiocV6ltG
	OAqvAK+5wSxQLitdk1iTcPSACYOfj4JWj2okgMtPbTsZekLtxQXORahTgLV18euXPGT8v9EYx6oNm
	Uormj5VpxTaQ70yrw7Qnyxmzg2OhMvf8AfOfN8YP/oK3IfoOp44DGJrM8DG3rt6pOKjSF8KWf+UFw
	fPbyQFp4Buly9Y2TfDvekzRQ+xI6AKYiq2X83DI35ewsPsy3FN4e/MaOHM4nLD+SzUE5N/1c5z1zz
	AtSdyyuC7HltGmbWpdeF50IsHqVaMcgfPpB41Mpc/VznOprIdN3TdeD2qd4XSXyHVLLbKIY6UnQv1
	uzAap78g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQfmP-000000069J1-2pVC;
	Wed, 03 Dec 2025 05:51:57 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQfmN-000000069Ic-0sPq
	for ath11k@lists.infradead.org;
	Wed, 03 Dec 2025 05:51:56 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso4986193b3a.3
        for <ath11k@lists.infradead.org>; Tue, 02 Dec 2025 21:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764741113; x=1765345913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pG8HVy8WBKfj7Gbq7tiRoF3XvKUwWlK7Y7HtxcHNPoo=;
        b=YgF/sICzb9Lu1rBjmOQmlmDUuNrBmvm67/DGju22OQsBmdkRTZoai1meh9r3f8fwov
         4KxTg++FG0ZqQHIe+HTkHpPnmAaDi6keqgVT0KBqvOG3JADNonljC4hn1HtUC4RYhdP5
         3WpKnIqu98u6IQi1KuUuK25TdgkreFN5fV/ulEPmvBoAzCihRK7Yach94TFWhonPoLtG
         /5+sKimbqBEYuaLMOS4512alJyO3qHJlSUoWuUPO49ZQQXDRlLePRqMdBuK34BrcKJfC
         d96Ez3Iu9YYQyv7f66WlwnAQbZ0ejv5h6lY7XdV0+Lg3juzx7GLO0SQPV9u4GM2hR2ot
         +rzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764741113; x=1765345913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG8HVy8WBKfj7Gbq7tiRoF3XvKUwWlK7Y7HtxcHNPoo=;
        b=RPidytm1Uol1rlBeXk/3HS2kgFm0cLhsUTHf0dMbfzp/1CLEwPe/7gxwOo23nllbUD
         9aoPZpBekpFlWSce+YY8nJOJI/NImQhwVnXYWv87GLjZtgyjJmK690F/QXzAA77s3GbG
         WHSLZTlGHSFYBiFdHWPK7rFbJ/868hHlOoGIuEfcQbFG1FuXSIcWPunH2G/fITilZ8Aj
         2GSsCpzHtvWtWoHpgS/RCJGqMGJYA2yc1AbDLf7i4P+DuhY6F/5Sxd1pP5h8bcASaVyg
         QRFv2lp2NVcEH8GoOyEewkWSMNjJnEHW83XlR0JWXZequftSHyU30zm2cxtpjAW/kw3D
         wDig==
X-Forwarded-Encrypted: i=1; AJvYcCV93zfuR7+WKDZLniEIOyMa+3ufTeFj10Fx7dxQh/VntT8FWOqCFKeWkfv5/VtwlnN3Ds9Xp3w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyxo7zYEiganfKlhvYO4XAdzZ6DUBVpNOMXMKbAy634ZxzB01Z
	SYQKHcPsAxqlHhM11Ugjx9yV/LY+kxVxlteWnJQm4PvP04ZZ60vwk4Xg
X-Gm-Gg: ASbGncuvWIhOfzSkBeBv6IpV+V5aFNgTovG2hxrLJ2ieTYBX/ZBDp3Zn4+c7yWmi+Nf
	JbEk2aznBPk1nUmowgt00ijtJhXOXXFxmG8+RRZy4cseFMhVvsjC8Tqz9dsczXedRtl88HhSJZ/
	1CCAsKTY9bf31FmgwCwm39JMT8L6kBFNBlzvvCt0fxrSB92AT8QsM6QjHj4UP7TfpcTszMqSWF+
	gLuIW1+rMu0GK0wgmqW3RYMPwx+Z4cmm/nUH1yfXvTSyCXF81TPJ1/t/sfXIkZlDOrsRQntCFI3
	/qcQpx0KSjIZE+me6PShnk6HvGZQBNJ1mH1ilBK0Q6LsCNmwE6vbj92/TbA/jVKWKGu0qD4KPqk
	1It9c4AdGQrndQMy3zddh51qo7QtvQZt6rSA+mCNYX9Q5S06DL4+VIE5QQw==
X-Google-Smtp-Source: AGHT+IHyEgLPqLDrjP+uUbRKGsluxoDUb/5jT6uyYFa1j70JyUaxLsI0PAs0cLoSijP1iOAiWrzdgQ==
X-Received: by 2002:a05:6a00:3997:b0:7a9:d1ca:8a44 with SMTP id d2e1a72fcca58-7e00d9f11d7mr1283429b3a.24.1764741113397;
        Tue, 02 Dec 2025 21:51:53 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fcfd0b6sm18920939b3a.64.2025.12.02.21.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 21:51:52 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-next] wifi: ath11k: ahb: use of_device_get_match_data
Date: Tue,  2 Dec 2025 21:51:35 -0800
Message-ID: <20251203055135.38641-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_215155_273783_6178918E 
X-CRM114-Status: UNSURE (   9.72  )
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

No reason to use the non OF version as AHB is OF only.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 8dfe9b40c126..2837789cf4f1 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1114,7 +1114,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	enum ath11k_hw_rev hw_rev;
 	int ret;

-	hw_rev = (uintptr_t)device_get_match_data(&pdev->dev);
+	hw_rev = (uintptr_t)of_device_get_match_data(&pdev->dev);

 	switch (hw_rev) {
 	case ATH11K_HW_IPQ8074:
--
2.52.0


