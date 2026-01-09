Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0D0D232DA
	for <ath11k@archiver.kernel.org>; Fri,  9 Jan 2026 04:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJPG8HYsRBUMTKq3yYRj3COPO6PhtTiFs6OmvlSy5Iw=; b=T1TO0Q9+pP21cmdg12WbH5IIW2
	zGBXmIOKz8WmHkjqhyRa5S320L0a5vIwtH5KqcD475ACvqsOgWncOaLtKbSZOVstmqDRUmOG65TEW
	dOXY0UPeIO2vkRqbEpTPQ9vo/5P6rZN8wnwxPfneIur/HnwCr40zRXCdfKWzucbqLqp7C9xfoa078
	yTaSPjnxpjK/IXA6339fcrn/ruk6Qazh1fot7k1mOlrMDMhrsA1v4gmYLd1V1UoZziUL5FYAowzGp
	1nO45yPAC5Vb3inEmOEvVYCHDoMzo6gCLBWrw/U6SbyUon3nMuAAaFoo8SR7/nE47WVev80JPuEA6
	YJx4gA+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve4N2-00000001KtF-3elg;
	Fri, 09 Jan 2026 04:45:08 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve4N0-00000001Ks6-0SrS
	for ath11k@lists.infradead.org;
	Fri, 09 Jan 2026 04:45:08 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7c6d3676455so2007933a34.2
        for <ath11k@lists.infradead.org>; Thu, 08 Jan 2026 20:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933905; x=1768538705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJPG8HYsRBUMTKq3yYRj3COPO6PhtTiFs6OmvlSy5Iw=;
        b=bI/CjCODfC2zlwD3yU4RdpUh+Xeng9iUVasFT2pnrQ8eDl5TuHsgUsW3fKZZqubG1U
         mG7ktTLwkbbnhVOPMJQYBCDzhT3cB5whNZSbBp/YQgIdal5Q3IG0h52yoXNXNiVODESG
         RP/viMmEq+n/7Lfxc/lWXz2LenH01P2TwjLIvAdGEcvq5fkF3AEbfvFbQwfz7bgRRrGC
         ui82VeKue0/PxQllLoQ7nTtb96uerNbG8HBrTr3YfF7O+wycwYZB+drUwf4X4yNYIyxO
         esG52Fo9YB7LZo3VF0yKc3vTJVqwbmEFqecX6twqpQqMTZAk5JjgrHci9Dm1M8qtCSxx
         0UDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933905; x=1768538705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kJPG8HYsRBUMTKq3yYRj3COPO6PhtTiFs6OmvlSy5Iw=;
        b=Ym/xQJH7deZ1/rhHQpHqWdW/RS5nroTY+u/iv/vR7CaOnE2FcWiXXutfy7/Yh7/+x8
         x04DZ1qCjOtEtRSYqLRqcqzHbdd18HNl/eaJaLDri/esZSNCDDI85EXZhoHOJ4otfRjs
         9v57rgH2OcZCcQkwwEqeM7CffR7GXpy2GM0Kp2SaBjpiWBSrCXakpNEagqwqqlb4BSJz
         Dr5Cnil7Z/Hi8bDYG0D8v4hRjttRsQESf3kf7tBJmxSytb92tr/T4J6gWD+p4CBhPj/s
         +luM9RQMji64z6FgJO/oAeEjOL7pozVFTmxpugyLOqPmIWoYCRFpKa59bplR5SfGtO1G
         MzHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj2b8iMGLzKhxWsGZPWuA+VTcGdXRLz2tEPKvR5UFs5b+8DOtOjdv55qVGJ157QVE1jUA93+o=@lists.infradead.org
X-Gm-Message-State: AOJu0YznW/hHmgB7F/fovtTdLU61g/NgY5HefxtDb5+RNvCyFHSb62YC
	Ol6o/JDjfOXXfISbsOVrqNQ7rxvaQcWzrW3so1q/AHnJXFJEEMKmVSm6
X-Gm-Gg: AY/fxX5V8awHzSU/CQ/3h+WNydeNQi3eujV13x0jKVQ7vZ9cK1zs48GI27IlgaCO0xx
	3ZhFzSKKZafdEbP71KYPGcXL+esm3EwhkgweL77mBGblcAQVh67JSm/t1kiAHIB7pJFjfglJnRZ
	ZuaXF9MWHdSPwY9NdP2w8Q/bhX73Tu4CUkXz8zRVgVyAttDjKDAjxtSE3LHyroR1DlZdWiJNDes
	t4TXUjoXVn/eVaN1bxDR4Xc+GRCzbkXfsUutlar2fxHHfp0rhdy1+klU16NNSAunze0RSCQYBL9
	w0aR3gbUgEmLWr93K5vyzE5k7XyhxVFjF2pL19AWyfFzG4DnVSKZWlHQdMKHDq3OfARXRDb+wX3
	9h8TD7r6tTzZqRJEwkFnXnNpeDSQhjq+04W12OkBH+nCIor46Mg8pdonps/44u+zXgf36qXAGYi
	EKzzqNvvYqKLz6cDjAHqb0I2m3eB7ZaruVozfzA5A0wJiA4QBt8JBIVSfADAN1PibRA9hCu3k/Q
	Ory8bkbs9zK2LHNHQSgAzW4DPlnwc9PdUQpx1k=
X-Google-Smtp-Source: AGHT+IE6wRQtca1hyce9+QhI7Rf2o0Jk0Cj8P2ShkldcfBNSsrVRhd9DNnZB/kaAAlL3WYBTPdAf/A==
X-Received: by 2002:a05:6830:2b26:b0:7ce:5287:494d with SMTP id 46e09a7af769-7ce52876fc2mr5062598a34.17.1767933904785;
        Thu, 08 Jan 2026 20:45:04 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce47802551sm6683515a34.1.2026.01.08.20.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:45:03 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt: bindings: net: ath11k: add IPQ9574 compatible
Date: Thu,  8 Jan 2026 22:44:53 -0600
Message-ID: <20260109044457.3074510-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109044457.3074510-1-mr.nuke.me@gmail.com>
References: <20260109044457.3074510-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_204506_855431_53C4102F 
X-CRM114-Status: UNSURE (   7.76  )
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
Changes since v1:
 - place compatible strings after instead of before ipq8074
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index c089677702cf..5efb2ce0a6be 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq8074-wifi
+      - qcom,ipq9574-wifi
       - qcom,ipq6018-wifi
       - qcom,wcn6750-wifi
       - qcom,ipq5018-wifi
@@ -103,6 +104,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq8074-wifi
+              - qcom,ipq9574-wifi
               - qcom,ipq6018-wifi
     then:
       properties:
@@ -221,6 +223,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq8074-wifi
+              - qcom,ipq9574-wifi
               - qcom,ipq6018-wifi
     then:
       required:
-- 
2.45.1


