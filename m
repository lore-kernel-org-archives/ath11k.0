Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB60FD3B7E5
	for <ath11k@archiver.kernel.org>; Sun, 28 Dec 2025 15:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YP3c0TfYURBai4VYDxBCeRIp2KUlF60Zf3Z4JdQhSd0=; b=5GsMlY5PHhJt7uAlu/oCSn+ccS
	VqKDC9cdciV9M3siW5mwXUIsE1aK4fUgt779jMfTVNBHPqsWeoll+sfvoFLwy4MgKLoxmq9xB+zIy
	KrU53ScPEk4egEqmk6oiaSnPDxMPuSW+qSPElGd06dutlAoLD85nqYNx32JXL9CmiB2BFx1td6OzL
	GTf+8pNE045j84vPNzhMQILWtXnC5v2tcsDhN3nLVvxjT30SCDvph6PFK5hrtPijuF5Lt7qzX/xty
	rxnQGKnAy9ZLSZkrFueJrrqhOwY2cWl0O5y7w/5MkYcO6itW3iuRr2j/c0fK7xEGq1rfns4bgZcvD
	Ehp/bvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtAe-00000002rUC-3Che;
	Sun, 28 Dec 2025 15:59:04 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtAc-00000002rTI-22mk
	for ath11k@lists.infradead.org;
	Sun, 28 Dec 2025 15:59:03 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7c6dbdaced8so6864919a34.1
        for <ath11k@lists.infradead.org>; Sun, 28 Dec 2025 07:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766937541; x=1767542341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YP3c0TfYURBai4VYDxBCeRIp2KUlF60Zf3Z4JdQhSd0=;
        b=UhwtHEePhWcU8xvL7sPKi9nC+ZWlF7+SAcv5T7Mz3ceHX8AEsQgkS1LjOMCsz0+Pee
         Y2M8GdjC7W6x8qcdx1FySrTLfn1Q38mMVIOPIq8DC4Bc+6eYybOrvkWNI7Zo/S+zWWg8
         hRb+gnBcvnMzNV+vM0XNc0p1T5kceWrOnVEvt/ThpYxm16vAxfKpEEgLaOVa3wBh9KFb
         HMs70f1pW/Bg+amF8RIWN84S4Vnpze+xSQuT2ubMhyfENiitfnAHGr7fSl0+EL4qoODI
         sqsC/AWaVHbNJ/abt54VZ5ImoTy2z2ajHEgHxBXX4plHR8zVg/kzt/mBjK/qUXrh4Ubx
         wMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766937541; x=1767542341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YP3c0TfYURBai4VYDxBCeRIp2KUlF60Zf3Z4JdQhSd0=;
        b=lDC6f/7lomvNahWa/6LYeI6TKDr1WE1oVAFQnd5GeMP4Dg6xr/t3mGShO7mbOUU84M
         vIl0StYHbyof5TTjtNX238rj7c9l1FlnN8Sz5mgMPgTMNkYDeAFdbag52X8N4hkr/pBe
         dZcr3QtvkEJa9yHbrgfBlcWboy+6GIbrAkIKBQXxpyAA0EPxtvQ+Z0+pMUHmxpcc3500
         17A0yq2ovCXmw9saT17HdrR8kIwaqH6n1UwRJIN4xAhH5JQYjURhpjR7fwMWzZO6cv2K
         vhZRL4GIkOpQm7RmV8ZN5AkgHS6Z8Txf+VZHicMYllDS82yMLOlo5HuiUKUMGjduFLFl
         eWww==
X-Forwarded-Encrypted: i=1; AJvYcCVVMl7ugjhW/dBV8U4QjDKglsBCDNjCUq7ZR97J+65WMX8FtpYU+NTUAz5WnESpW4tnxRv3uWE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMIxLxG0KWwjx1qmzLFhpZE8C6gwLm790/sNa6waMwNi/Z5ZFO
	5KWOoC/ky005BXKn0zSjyMf7YNznRd44FTQlic1isIpf0Jot2Xxg6pBL
X-Gm-Gg: AY/fxX49ehr0dcoN5ORdCOWZmfTz3+wZSniV64ABgNKmuAxxPJBtQWIBFrpwC8977rG
	vrIwkB6j+7cceMjJvxm/VrWhwGFy5oOAOXMvqa/XfGciymL3mrvo0U+QB3iHOYUn4hydTkz0/Cc
	TCmEACF+9nRBtQt+8Yt+dy5XTjaPSXvZ455LC3S4ZjoIyMHuvnysTjoajoufopgzIlI6ClggCwS
	d9/Bz1FBmFcojxRUUYbDzCq1r9HOVXikP+mXMLWGjV/FuZ0dw1yLMaHUuhliez+pX6qXe67sGAF
	2V8u5jwuIjt6mRfmcad9ImubG/B07miGXN4K9Wm/UHO1YPLCTCgHHj39KWXaJyKoqd8lYyyiIIV
	/6D9sK7kWWeSRkRLH25Rs2NHBf8WKa4JPsXOwNYGlSfLEBUS/tv9Rh6lE12f6QRqERoYZWiEfVV
	5iK6/heA9qIV7gNC2N7UvQ+QwMoBDu3gVF2ysKhWeLY+oXbNdW9seyC/bQ34NersVS2fRhy9APz
	ITEMwSJGT9Mbi5BynMKDYFjTXDj
X-Google-Smtp-Source: AGHT+IEh9nd0qc+nLomD7TlSHUU1Fad3h+pjFahI0ZbjYkMUhS1mnTBKtoHTQC3urWigQnTZxXGkbQ==
X-Received: by 2002:a05:6830:6619:b0:7cb:133b:c07f with SMTP id 46e09a7af769-7cc66a959admr14336907a34.28.1766937541462;
        Sun, 28 Dec 2025 07:59:01 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667ecd6esm19004434a34.25.2025.12.28.07.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 07:59:00 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jjohnson@kernel.org,
	ath11k@lists.infradead.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH 1/2] dt: bindings: net: ath11k: add IPQ9574 compatible
Date: Sun, 28 Dec 2025 09:58:51 -0600
Message-ID: <20251228155855.2118792-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251228155855.2118792-1-mr.nuke.me@gmail.com>
References: <20251228155855.2118792-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_075902_537349_F3368C67 
X-CRM114-Status: UNSURE (   6.19  )
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

Add IPQ9574 device support for ath11k. The schema is identical to
ipq6018, so add the compatible string where needed.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index c089677702cf1..8293ea29b723e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,ipq9574-wifi
       - qcom,ipq8074-wifi
       - qcom,ipq6018-wifi
       - qcom,wcn6750-wifi
@@ -102,6 +103,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq9574-wifi
               - qcom,ipq8074-wifi
               - qcom,ipq6018-wifi
     then:
@@ -220,6 +222,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq9574-wifi
               - qcom,ipq8074-wifi
               - qcom,ipq6018-wifi
     then:
-- 
2.45.1


