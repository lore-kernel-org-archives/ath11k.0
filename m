Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF194C4345F
	for <ath11k@archiver.kernel.org>; Fri, 12 Apr 2024 16:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=caQTinMj4HV+puo76LX890/vq6ddN+KcGH/X/bwBRlw=; b=YP5HXcPO7YH5xPD44D9EYn4IP9
	z0IGWoRTH3X3GEesifsgxz8V156IK3ceCr1FDkhfzK4z2GxaRRSon6zW6t9vox2q1YkTFMqxWQAej
	kXUggRsyJe7Bp/B2pkswT7RX53QwMJv9A5n8DyUjLvSS6eTuH8OjkLulQIWbbNR7WMNKmbFWK5y2e
	iIzIwTzGJrQGrBhvFRApwVi+XkuqraGWMv3qjOixu277/O+TLUetII6tMw0XR/OLM+lDgDYHoiVlI
	qm/tKXjDVeNEzTToU/AQ/I01FlIZakOJmMsj/fo+j5vYO24o1W/3KneAFFZxqf7+BWN7LNSuXmamB
	p+dH+IIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvJiJ-00000000ThH-1QNi;
	Fri, 12 Apr 2024 16:25:19 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvJiH-00000000Tf3-161w
	for ath11k@lists.infradead.org;
	Fri, 12 Apr 2024 16:25:18 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-516d09bd434so1359084e87.1
        for <ath11k@lists.infradead.org>; Fri, 12 Apr 2024 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712939113; x=1713543913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=caQTinMj4HV+puo76LX890/vq6ddN+KcGH/X/bwBRlw=;
        b=NaGKhhhtKhKjxFK4x866LefHEuROj8MJlG21pF+QlkA/Paf0l90vLPFKAZ2iN778HX
         vZ9BmkmAEsVywHfygTs8khttrhX+8+FM+JUX2UGAF08d+4w0eshA2X+NMISBeoF1EYut
         oE0Pop18xIo2ky+eJ+JmVkk49ONUz6BNNRHibxAvQHm8+JwyPWHknRi0b3P86NYVPNrf
         6nvL2kLgRUsMlTh+jDxzxzXJCFwvBFoCeDsBaROyLUopnJvITWvbeJdbNwPncb7+f+RO
         oPbOMp9XJI0bKvjpQ0a6V0SabM7NNBn2EunzvKAWm0Ct1hbjussMkamf1sbod3zHlR7a
         0DZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712939113; x=1713543913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caQTinMj4HV+puo76LX890/vq6ddN+KcGH/X/bwBRlw=;
        b=wMUDQ8Sf0/cQkGW82lerznPcenNqx3nsfs/VhDX6r32BJWv4i0gY7a6th1ULGvwc52
         KgP6O3nMhrzJb9zuSEAWhQvxw9AN8RkGRSqB13/Ol5OutXHsgUdlscVULy6YyowpJ2L1
         mTvMyXOuRGpasYqSERNsNb2z/KqTls9psYd2k0g46iB6bD6xVplBhlnVKRxeuL7g8BLj
         iYek2Q4hp3O0qA9OYGmg8pz1nGxGVfj4swL1l/014CBrd5loM4iRm9N4sMBt9zvvIc3c
         8/IiAwfT8Bi/n5sztdiH7ONNwofrLuS8FVk0ria//vAqiQ9tWTvPgtUG2P1VhmVM+isZ
         2izA==
X-Forwarded-Encrypted: i=1; AJvYcCVJHY7//CKGX+XGiGX9LIlaogOAjF12jWTCAbz4uHf/BGKVYmHEsquT+IxQP8d/s5iWYV+6yZfv78ICpUWAxDvp5XFHF4xvPSa7Lw==
X-Gm-Message-State: AOJu0YwC+bf5HizlzJmro0RHTwGnk40feyKFbTjhHN7W6/uHo/l+8HgL
	DC1R5Z8q8l29L1hMf6cDH0y8qymPxtTFP7rBhxfCVisBeJkt7N4/mmF8Zwx5
X-Google-Smtp-Source: AGHT+IFSMXcf/XnY1RW70gVLOV7EXutIJ9X7L4Sz2vOg6Nlj4vKSBVkxS1dxMXOgsnqrl1AAn7dn/w==
X-Received: by 2002:a05:6512:499:b0:517:855e:2e3e with SMTP id v25-20020a056512049900b00517855e2e3emr2064344lfq.6.1712939113253;
        Fri, 12 Apr 2024 09:25:13 -0700 (PDT)
Received: from fedora.. (d-zg2-064.globalnet.hr. [213.149.37.64])
        by smtp.googlemail.com with ESMTPSA id q4-20020adff504000000b0034635bd6ba5sm4576554wro.92.2024.04.12.09.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 09:25:12 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: net: wireless: ath11k: add ieee80211-freq-limit property
Date: Fri, 12 Apr 2024 18:24:08 +0200
Message-ID: <20240412162510.29483-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_092517_319524_2B7E916D 
X-CRM114-Status: UNSURE (   7.66  )
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

This is an existing optional property that ieee80211.yaml/cfg80211
provides. It's useful to further restrict supported frequencies
for a specified device through device-tree.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 672282cdfc2f..907bbb646614 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -55,6 +55,8 @@ properties:
       phandle to a node describing reserved memory (System RAM memory)
       used by ath11k firmware (see bindings/reserved-memory/reserved-memory.txt)
 
+  ieee80211-freq-limit: true
+
   iommus:
     minItems: 1
     maxItems: 2
@@ -88,6 +90,7 @@ required:
 additionalProperties: false
 
 allOf:
+  - $ref: ieee80211.yaml#
   - if:
       properties:
         compatible:
-- 
2.44.0


