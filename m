Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35D5E85367
	for <ath11k@archiver.kernel.org>; Fri,  3 Apr 2026 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOCuD1EIBix+K2H4tXL5BYaPaJquyNo2g3/MFSpuIHI=; b=jruLNCAwEVMpA7nEc2plI83mM7
	IojpruHSa4EUjmjVZhhGE1bUny6/hs4c0N0TaMPlS9+WIiFTcEaoylEpbBLnwBMEkLmSRva9S3jvc
	LGV7hEz/SN+HHDhOjW/MIwYCscTVewvanHqA6N7F+7hSo3XRImkgUWGZlxlKfk7HXTYGb4NzKbAU2
	OQtaQ72VWodWZN60P88fbaqIZNTuyvJh84y4mrjx6wyOhHCAOqNeNibFgiy8bZEjSVUNpOxzj0WIH
	/v9Yvn803O/1wdd2qu1NQ7KvLo3IndOTA5C6atEGeQLHTFvOTS9ggqq79hlwgkcVBLs+7SVfa1e1E
	Y9QTyZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezX-000000026Km-2fdW;
	Fri, 03 Apr 2026 13:55:19 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezV-000000026JU-0ulc
	for ath11k@lists.infradead.org;
	Fri, 03 Apr 2026 13:55:18 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b9c280322e0so229735766b.0
        for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224515; x=1775829315; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOCuD1EIBix+K2H4tXL5BYaPaJquyNo2g3/MFSpuIHI=;
        b=fBg/6u21Qq1JJrXb1elnN+y3xWSvd5f9PGm7qAc1sVV30/eMcF5uhR71Nyo7qrzr3q
         +Fw+roOgjjrFRNZJ1mS7oLbuz8WM88GerlcW7SnPorqGJgw2jCzHMndqfO3tPF8QSwjv
         eBxWg7ekjpJ6TrisVcGJYRKHmFLmKgzzAj8fvSeUiAh0aypk8eGexskU7BoGLo2JL4j8
         aNCJqTMWhWo1kcdMLi9enAvXz+BU3s5ABN5nlLvz3BBS5ronjySrD8wDTgsV53pYyAQc
         5D9Xwcl6JQ4sqbUAKJxIVfoLubX/CrOo56fIjpUWe/H1WjovSD9Fm3kiw31F1tPpZ7lj
         ZUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224515; x=1775829315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YOCuD1EIBix+K2H4tXL5BYaPaJquyNo2g3/MFSpuIHI=;
        b=cy4WdMbyPbnMOOn9U2/HJS6s/e4DGyvl8GTxT000VU0aLbAh3zK4qhw1plA5K/v0DU
         K1iIHrppPGhOGn7RUnGZhIWqkJyRsRL5lbcan9pu6B+1aQYRC6eb1cVqckOlEX0m13qN
         xSlDzD1nUXkmvuoAHoMTZ3iXS5Rvvljk525IBhhaoUwb7+XKvug60roiMJ93Xx4R/dBZ
         08vtRY3DKWYl7OqlzMK/nrUwnB4KV+5Sm3jRl7W4w2tViXrVFhkniJzaruprf9qjH8UJ
         L/Mbz0RIoxvreWq61ta6m713uw1/jkKcdNse5QxEkpa3UTYKAmXbvscl4k5+jxdXZTvn
         t+wA==
X-Forwarded-Encrypted: i=1; AJvYcCUrMou+opD+BXyrGIpTmH7q+xF8EdLnbHx7XVb93wTkOKYf1XVgTy/XcWaVgBGw+5y8kDU16gA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4mvt6RLidAw9jYWhoMhabuQuREeW0hJ9ydNAgqnif2Qwf6kEk
	TxMXYEhAClSLbO4PjhEdihZ3TI706RGUxA3b/ejQ1W2AzZkIVOxiObOioXm1CHSnRM8=
X-Gm-Gg: AeBDietde/7LD8wwqOh4vUsZY7xoXO5hrwBzXCrdaMk7MPkJBa7cI6eQJgq18/XApIJ
	lvT/EKoPNIIp9rv+wD+Oyru3PP4a+FnYgFoulKiiYkF8wWbn6cjiyxvaiI393+DC8pzq909iTfj
	12If2IMFFgf1DZFyb+Nkii6XW6T4nfL4WIPRIR6HNqQEOaopzQSDsJiYz2o6S+cCVjnsohyk7I/
	OdzdXvqF8rsFD6RCsRuVlfci75FvdoRHTczmBvB/gDMVq/ihf3E8ePihOeRiUt5xjkyjOXPDEyM
	/uT42/fciZyXPmoUXoWgwjVylvyFvygLkBxwERuGvGHwRaJuZlAa0Gk/e7IUPa6IH8XT4ZMzg5/
	ymI527Y4zpjLLfU9tZK3WqGtAKLE5ffxZ69cU924i7Ck+gkznnkMNyI2158HPT0tImXgUDCOwQy
	H27And8UjQSF2vnWFE+E8Ll+/veyXkb2INlo1OiL/+p+4HE0VlPOtaAxkq+749sa250pNIB6H3U
	gaSoqs+3q2HGOot3EVNNFI/DBNdynRQPoTHHw==
X-Received: by 2002:a17:906:5189:10b0:b9b:1ea2:97d3 with SMTP id a640c23a62f3a-b9c67924de3mr103637866b.35.1775224515233;
        Fri, 03 Apr 2026 06:55:15 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:48 +0200
Subject: [PATCH v2 2/7] dt-bindings: bluetooth: qcom,wcn6750-bt: Document
 WCN6755 Bluetooth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1081;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=pHexCrMEYsMQQy8zIs+sRrHJ1/ttZ3VMNeWvno6IS14=;
 b=XCK+78nLfEjrwFntw0oaIZ6QCMaMqe0pdyMGnaJ0nfiCKkScqZ/j56Z2tA7Pr/+6ADMeTVzTg
 pRaItd1h5BQBiCmYvoHhG6jioNRifeUAqMjZopZPnAysEnsr3FFCL+h
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_065517_298440_CAC11CCA 
X-CRM114-Status: UNSURE (   9.98  )
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

Document the WCN6755 Bluetooth using a fallback to WCN6750 since the two
chips seem to be completely pin and software compatible. In fact the
original downstream kernel just pretends the WCN6755 is a WCN6750.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml     | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
index 8606a45ac9b9..79522409d709 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
@@ -12,8 +12,14 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,wcn6750-bt
+    oneOf:
+      - items:
+          - enum:
+              - qcom,wcn6755-bt
+          - const: qcom,wcn6750-bt
+
+      - enum:
+          - qcom,wcn6750-bt
 
   enable-gpios:
     maxItems: 1

-- 
2.53.0


