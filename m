Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AA8C7EE37
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0kJSHliIMAlyduA+OY/7I7/Lctns9avg4Uz5+Z+Tbew=; b=kfcVl+WRrPuMHQ
	+PHGjpBLDeDc2ko0HdRNKvBIpNcKbGSggeB6BxGXsUgn4nEIR3+ym3gc9RFXkHdVdKUhvgWtRUzNF
	fY0cb1sUUnkV8m9RGbWxH7dsIm0Y1dcK7mmmQ3SuTO4wjTHd1K9YNJn1WzBOntHfC3sbvmDEhxu9O
	IdQaysJxTzfGEziq5+b4/73/dzDWNHMWVWSs6FNtmROSJwubWhNZ9/DSsk56b6K2HfFmauYpe5J2C
	IUh5x8c+blMzXLrMV+B2QEltw7Xey7R5naDh1T2wGXSLOawMn7NwmMlQcEpp5z4JMOUqE421adP7F
	u7CrEp5Wne8rv0ZdJlvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Xjz-00CHDf-0a;
	Fri, 09 Jun 2023 08:45:03 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Xjw-00CHB6-0s
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 08:45:01 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-977cc662f62so231531066b.3
        for <ath11k@lists.infradead.org>; Fri, 09 Jun 2023 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686300297; x=1688892297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u2m01kvhOF2I2EUXo3IlN8hGgswTk7oH4FeWuyBRNa8=;
        b=am9QIvx7QekKST0NXLKJo5aSPv82fLUuKqa4LffbKR48CuwJBWxBzGpe3d72WgFXyO
         wLvIaV3AiujQI4AyhiMVHQjZac6NkdtmYHJnRO5lwco/SuOrYPNIOlzLi5K6HnoNhcE9
         ogccymsmzzXA97+/WKcGgtHpvYm/D5mVl6vmAKSlaZD2EvXIX1WkBJ/+hVL03NnarFDB
         QSg8YkUfC4ofUXhXwDkAOrAJS/PQqjQuuLH+28T+iIlz5GKOCaaSQQiC7q5uPfesc1aa
         n8GqhK+DreyECmxXXr9bajCNf5XALY+nc3eGTKg1BHrbFsKgNm5oSJzztJbH5qNDmFX7
         KH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686300297; x=1688892297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2m01kvhOF2I2EUXo3IlN8hGgswTk7oH4FeWuyBRNa8=;
        b=ibah90oJ38SzlqFEM4VxP1aZ+7R0mXGmj0mZ36hs5Vo5YsajVSa+6M/qAmjHCS7kp2
         f0bZpymv0leZFEdoFcG+OJC9i14jbEui4++0Ar3ZRE2smdyu0I/bTckBNpQk2xIOSfi+
         g2Uv0yg4hCAIUjTeVBUBUThvA9tMASDmlQipwnXOOJ/PfKiIE91Xuw7q1Q8aOyCqW1nv
         5/74ehKHj+Ccxj1lZHiO8rCSottKjWruzhEUPL2HMFK18MMAoRUrj6bj6/mBPkfCGmtV
         FnoI3SMh7kHDEvjEV4FCCyVr/weiQfpnxr9CNLmH/SpekRDvnSj+yqb5CcsGco/K10Nk
         mCTg==
X-Gm-Message-State: AC+VfDyYEhTzMND97zcqIQb/c4mzGGtgS97+rNjowJNZe9hOtqKTNC6G
	QcNP7HPv/It06BzB2Is/Qqg=
X-Google-Smtp-Source: ACHHUZ5QzLadAPdG9cB+kjCl1DS/fPiN26MxAdgN7lxN1c8+aeWylkl3/EDmP9O7dYv1z3xoH7RHsw==
X-Received: by 2002:a17:907:1626:b0:977:95f4:5cca with SMTP id hb38-20020a170907162600b0097795f45ccamr1037363ejc.54.1686300296651;
        Fri, 09 Jun 2023 01:44:56 -0700 (PDT)
Received: from shift.daheim (pd9e2959c.dip0.t-ipconnect.de. [217.226.149.156])
        by smtp.gmail.com with ESMTPSA id lc20-20020a170906dff400b00970f0e2dab2sm1000421ejc.112.2023.06.09.01.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 01:44:56 -0700 (PDT)
Received: from chuck by shift.daheim with local (Exim 4.96)
	(envelope-from <chuck@shift.daheim>)
	id 1q7Xjr-0004fO-1J;
	Fri, 09 Jun 2023 10:44:55 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Cc: kvalo@kernel.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Subject: [PATCH v1 1/2] dt-bindings: net: ath11k: add ieee80211-freq-limit property
Date: Fri,  9 Jun 2023 10:44:54 +0200
Message-Id: <a3075482150d342f71ec235badacec32cdd6c553.1686300243.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_014500_307369_75B5ABB2 
X-CRM114-Status: UNSURE (   7.36  )
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

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 7d5f982a3d09..91bf69c2df01 100644
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
-- 
2.40.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
