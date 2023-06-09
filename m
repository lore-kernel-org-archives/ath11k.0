Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633DAC7EE29
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qMIIsiPzKw9URvUDOCc+DPlUlXTf/Bp+/yROF8vyZA=; b=pKmLoNBOoVIgRY
	WW2iX4VGaetzg5DUL13gSs3EFbH87f5oK5bWrU5FxJCdEsY5t330v+Dbs1eb/qachoLm7S2CmDshB
	iGkKi3ZBiXkVHv4VOuRx26S1v9YGTv9oDkhfJXj95TOSgUtWb9YbWlxkAX2Ed5AdCnHOcO1wqb9LJ
	+hBWWCE1WChhKEhi/jrv8cmj0lT7emDdMU76xx2gjW0n8cjAXzW4oMYjl1TUVEa5UjadatVsWWQ4z
	3+uKzFblFVwuLzcZIkMIlHnoe3siyQbXorWLo/6YX0NBggPzdaXf34omdCSFGfTw8bnOjAIQvywqN
	Cvi26nP+cNs3UpcCZEBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Xjz-00CHDx-1v;
	Fri, 09 Jun 2023 08:45:03 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Xjw-00CHB7-2K
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 08:45:01 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-977d0ee1736so234769066b.0
        for <ath11k@lists.infradead.org>; Fri, 09 Jun 2023 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686300297; x=1688892297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sV5kS4uFTylsIKBTpLATpLjmqF+bm2uJbZFR1pKIFFU=;
        b=ev/gO9W54hYaCq9ean5DupK1uYMYJe2cw12AnKy5KCgHrVvXscqgta6p77dUi9PpD0
         SQ/8RR5w1cKmN9AKkuezoVkYeu8oxjL1GovQ4Th659JBhce999+AcsmOkaqYQRkfCm1B
         XRWej+p7auDkDaBPPqeKDPymHRTSJ/6iIV6W0Dy2kd0/SlXCXuwYrgaWzMSURucXRWye
         DtfnyXC6hIDfEHOf0t09TwpMGqxWhV9Mf2oBVG2Q8AiLCiT+jxjU4rGtWrajThtnCXqq
         2PEDII6gwra9FL/ixUsC2wZaUb+0bKHxfjioOC4g5KRZd2t7PvGuy9u83kxaIzbUAFma
         oMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686300297; x=1688892297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sV5kS4uFTylsIKBTpLATpLjmqF+bm2uJbZFR1pKIFFU=;
        b=SJUo24N9L5op+okrt8o8LKl+uDhuRy+z/mk74vsrofiJlCsJ7ITPN6VEmOD8/cu/3h
         cvj4u6tNM8y191oWmKkq+rTZJdrJYabQqLZ2Y6dUPr9GrRq4srNjS6MsxNJVuo4N1aAa
         yUcc6TbmJBGpObe5j+9H0OfQcF+X5+lVWGsiDuwWFAKuVIcmrFWQk/I/C12kIKXLWFAe
         8WhkZZHecLTb1k0HAU7HSeDs6g5JJH356RC6prmYTqwmOo3eRX1fppQSyKfvNxxkIVNn
         /dY9vajDQ/YSYuX1CM9z/QBVIbDHwegQ2DLDifext54whrauxsUIINxrisT8X1k4VCEe
         NA5Q==
X-Gm-Message-State: AC+VfDy+fgskR8uTYLBc9OloPS1j4vyIMDCHhSfWB3o9eVzrbfubRsU6
	rg7IZgIAF5fvq7Vx8l5sBfU=
X-Google-Smtp-Source: ACHHUZ6BRxs/pXjmvDXY/Ix/M6PsYGHPtG5nSO4nq825Yv/jpYmkLikZjzLYUPDhzmiNY3syp+zKHg==
X-Received: by 2002:a17:907:9349:b0:973:e4c2:2bcd with SMTP id bv9-20020a170907934900b00973e4c22bcdmr1042732ejc.18.1686300296517;
        Fri, 09 Jun 2023 01:44:56 -0700 (PDT)
Received: from shift.daheim (pd9e2959c.dip0.t-ipconnect.de. [217.226.149.156])
        by smtp.gmail.com with ESMTPSA id jw19-20020a17090776b300b00973fac6065esm974199ejc.223.2023.06.09.01.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 01:44:56 -0700 (PDT)
Received: from chuck by shift.daheim with local (Exim 4.96)
	(envelope-from <chuck@shift.daheim>)
	id 1q7Xjr-0004fR-1N;
	Fri, 09 Jun 2023 10:44:55 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Cc: kvalo@kernel.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Subject: [PATCH v1 2/2] wifi: ath11k: add support DT ieee80211-freq-limit
Date: Fri,  9 Jun 2023 10:44:55 +0200
Message-Id: <a57a3e1e23b5ac4a18d772e3b82527498ac85bb5.1686300243.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <a3075482150d342f71ec235badacec32cdd6c553.1686300243.git.chunkeey@gmail.com>
References: <a3075482150d342f71ec235badacec32cdd6c553.1686300243.git.chunkeey@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_014500_753910_7F6564DA 
X-CRM114-Status: UNSURE (   8.85  )
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

The common DT property can be used to limit the available
channels/frequencies. But ath11k has to manually call
wiphy_read_of_freq_limits().

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
compile-tested only.
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c947d1c8d8c1..7e43f2770f27 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9414,6 +9414,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	if (ret)
 		goto err;
 
+	wiphy_read_of_freq_limits(ar->hw->wiphy);
 	ath11k_mac_setup_ht_vht_cap(ar, cap, &ht_cap);
 	ath11k_mac_setup_he_cap(ar, cap);
 
-- 
2.40.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
