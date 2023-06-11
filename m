Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1ECC7EE23
	for <ath11k@archiver.kernel.org>; Sun, 11 Jun 2023 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LiHaxF2xIA5vKSIYYjjtbrdYoeC8Ok26LFNiLut7jTM=; b=eMkUY0DkwzUrUR
	lfdqnvd8Q2PbeFf4bAcYN34yMeBDuhvryVazBRFRBy/hj96uqJUHFKCQuivBaxu+xKWlfj6JulPxp
	F9d4oKZUDu2kpfxZ/H6pGK5/wTftlHdhurIIEbOMOfuYO45oAmOF4N3J+aLcp6wXDGSB16f0mJI1q
	AeO06b2PXaYFdUxYkVz/KU2ITvJy7Q2dngmpJVCb4GhvSrGOVK0BvZQk60yuiJK8XF450lVMt+5w/
	G1MTTvxOK1QVe9/BoP7yb30ftbiEC0uMxMwc/uXYrN1HIhxaNHBqk5sATtEW7qVblygmKYTprv92R
	Gzwi1KcOykzUV4OVArsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8KKE-000uD5-37;
	Sun, 11 Jun 2023 12:37:42 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8KKB-000uAm-32
	for ath11k@lists.infradead.org;
	Sun, 11 Jun 2023 12:37:41 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5149bdb59daso4889902a12.2
        for <ath11k@lists.infradead.org>; Sun, 11 Jun 2023 05:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686487055; x=1689079055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6QgzW966aN6BIIkzy3cK1mL47MJ4CEEdefvvAf/lCw=;
        b=QPs6ouJjMCKQWdtUgc3dgU1lUCNHVR3UNV4yaE3ZyXXxeW1SW0/XVCSDuFmvbueEq+
         y7qD6g+gE/84Yzourvtzc+qvWiDGSYV6uREOmHdrKwQ0+yOpQhyR/5zIMkKwDzzg7kra
         n9GTPEDLgiU1qafi5A2zHPzYbdNuIWsXlAAzFA4ZOwHyPi29XCsFNe37aBxmF3zBRq8y
         16166iKIKVtbocYQFzl1N5bZ704luL4tF0AH17A6aGBguhfCt87aU+uxQ2T6Ugc3qIIC
         ib/t68fZifu+gWf4VtaQWf44SB4w7lAEYbsgeKNiiBfBjPjsqtGzyPJiLsJlEwH3IbqV
         CG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686487055; x=1689079055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6QgzW966aN6BIIkzy3cK1mL47MJ4CEEdefvvAf/lCw=;
        b=IFZHiHiyHqg0Ur5vx0WrdLU291zedffdMnp1SCAeEQbtMx8VNCdaJVH5JqqdPLRbcF
         YeyTP4v4cVcfuHKTMdwkIR2DfbhzidxSu7P515umVAhKpDLsKVR9UO/5mYEKQLbJf3E+
         WH9qwjUGuXr2xnRMkl4qFIHPG2aZn9xsP+2seNfF7JCCjWXrxOYljCx/gnpxx3310krf
         B/Tm3ZWnSFdBwKuhmi27NTtNspJX8tH9EZMH5JZ/VpcQtGve3uPKH8AWlDP4IGGJDDpw
         3QfuzznXrqbUwvl51aYOY4H63Yx5HU69ovu6j0L5UvgjgbOAlZgItjlxa3I3WEtUrBrB
         Fibg==
X-Gm-Message-State: AC+VfDwRypPJ3FrNWbD5GJWVJYZUuC66m7Wvpyek1eRZlD1Nou2dPD2e
	cTXD9p4j9prafRSVA/jZ1rY=
X-Google-Smtp-Source: ACHHUZ5+L9bsKXky3I4zLev4ZT9LXDiJ8TXQja3KgzbdHNiaAdJAR1wnAzg9Ywpu1jzg+q/yLhNobQ==
X-Received: by 2002:a17:907:3f20:b0:978:82fd:758b with SMTP id hq32-20020a1709073f2000b0097882fd758bmr6423965ejc.29.1686487055192;
        Sun, 11 Jun 2023 05:37:35 -0700 (PDT)
Received: from shift.daheim (p4fd09ff6.dip0.t-ipconnect.de. [79.208.159.246])
        by smtp.gmail.com with ESMTPSA id k14-20020a1709061c0e00b0096f6e2f4d9esm3759194ejg.83.2023.06.11.05.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 05:37:33 -0700 (PDT)
Received: from chuck by shift.daheim with local (Exim 4.96)
	(envelope-from <chuck@shift.daheim>)
	id 1q8KK4-000LN0-2X;
	Sun, 11 Jun 2023 14:37:32 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Cc: kvalo@kernel.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: net: wireless: ath11k: add ieee80211-freq-limit property
Date: Sun, 11 Jun 2023 14:37:31 +0200
Message-Id: <fc606d2550d047a53b4289235dd3c0fe23d5daac.1686486468.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <288fc9a0db6c292bc132e828611c41785b075078.1686486461.git.chunkeey@gmail.com>
References: <288fc9a0db6c292bc132e828611c41785b075078.1686486461.git.chunkeey@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_053739_986885_DD35F3CC 
X-CRM114-Status: UNSURE (   8.11  )
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

This is an existing optional property that ieee80211.yaml/cfg80211
provides. It's useful to further restrict supported frequencies
for a specified device through device-tree.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
v1->v2: make dtbs_check dt_binding_check (moved to existing allOf: seems to be fine)
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 7d5f982a3d09..521dc71d5e97 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -58,6 +58,8 @@ properties:
     minItems: 1
     maxItems: 2
 
+  ieee80211-freq-limit: true
+
   wifi-firmware:
     type: object
     description: |
@@ -87,6 +89,7 @@ required:
 additionalProperties: false
 
 allOf:
+  - $ref: ieee80211.yaml#
   - if:
       properties:
         compatible:
-- 
2.40.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
