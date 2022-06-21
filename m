Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE081CCA482
	for <ath11k@archiver.kernel.org>; Tue, 21 Jun 2022 13:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0p5FRhuTMoy10U/gtWK/y3jW31gyl5aWmZT4MyNGHuo=; b=4gv3cIhANliOmS
	gP20n7ndKSaFTPLMBw3PDkZQaU6sLWyTNfZudw4APVsivlR/JMkibsliPxt4RCqvcD2H7T8dERm8q
	wEDrhrH3Is+4RLOaIQwyOxJ3w7uVLaIUZH3UupO8MCkbChsHu2RX/EBJXVvXPe3RFheiM2yDvE4LP
	0JNc3WdUBYrZYJI2Oq1b9Dng3ZvZPRfViddohf2j8yssin0qoNMEQkWa0UolraiC+ETwQfyLx9tiY
	jwgGcpzAQSlWz788d/1r2ot/8g1lEMAEsXGC1rlEO1RYC3R9JC9UnI1x6NysMYWIXc+tcVXWcGRaO
	rwljX1NuDaiW3PWLp+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3eKD-005mab-RL; Tue, 21 Jun 2022 13:53:49 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3eKB-005mZ6-28
	for ath11k@lists.infradead.org; Tue, 21 Jun 2022 13:53:48 +0000
Received: by mail-ej1-x636.google.com with SMTP id u12so27651719eja.8
        for <ath11k@lists.infradead.org>; Tue, 21 Jun 2022 06:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=roHXTUL4tKXVN//IvEXVUmOPrGKI2A3Q1fTOEiNxRiE=;
        b=P5XX+bTiGw5qp8eSMfarTWvbuYZdIdE/DXb5iSZ8X4x/m9/szH6t40nyGlna8U8T7E
         e9zqDZ2c7I5374q+h+4xdhLKoMxCMXy3CAWe5PUGt+/SxouSYiYMbhXYZaCNnxA5CkCY
         wi99hSVxmqCBzZLtZw2muvN23Rdb1KEyGYIJIvFZH7iVLeIhtRqfGWXyMoDw5YUHH5oD
         reUW+m5SeNYHj1VmO1rijqrQE5gJ5MsjHrO4BSn/hsJsuqzPkXFLkIx1iAHJVbD2a3GB
         GbnykMSfI7VYnn1KOuERBdm+67sGyC/kkCevOwELffMJ8DnRu1lw4miR8viQYylwXpR9
         Vb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=roHXTUL4tKXVN//IvEXVUmOPrGKI2A3Q1fTOEiNxRiE=;
        b=qKMNx6+ffHOlcWX8Wc9ZC59pVpawhB23Jx6F5ZPeZ8K7eOu13f6QubM4GxVWAksT9A
         ws0r98O3kwGPa/I9jgDlw0mKNO7x6yDpGobyYu2Eh7YuNmBBHz3H2vEJbVTmIcAUS44G
         FmqOtVF+n3+HI9nztG8kBOIoW0i/DRP8ljUddjWxJlqtHGKb2blU7OLDmIAXD8PCRg/Y
         U0z4byjV9QX9yyP43brPRXBnBeYhZvrKWZsyG8wzuVinub9qkN2TEQp//HUx0BWj8cHS
         9c6kVL1gBqVQF1JS2leia30GZQQpObRJmo3gVQNmMMwqvtixcLah9f1KURS5ePDZ1LP3
         pe6g==
X-Gm-Message-State: AJIora/W3HW3ka/usY88ww8XzZU4h8qK8gdWNgFUq2nKu0wrcnFRZn8p
	r2XLjFgilvbDBXLJOdoWq5w=
X-Google-Smtp-Source: AGRyM1sczfnqeoBRL2JVbKBxe9KgCynS8OEYJM73QMnSa2Iy5BIRI4fRPUdc2rdfo7pOMxyFAXFyuw==
X-Received: by 2002:a17:906:c7c8:b0:70c:a62c:d0e8 with SMTP id dc8-20020a170906c7c800b0070ca62cd0e8mr25422461ejb.545.1655819623364;
        Tue, 21 Jun 2022 06:53:43 -0700 (PDT)
Received: from fedora.robimarko.hr (dh207-99-158.xnet.hr. [88.207.99.158])
        by smtp.googlemail.com with ESMTPSA id fy11-20020a1709069f0b00b007104b37aab7sm7325408ejc.106.2022.06.21.06.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 06:53:42 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 1/2] dt-bindings: net: wireless: ath11k: add new DT entry for board ID
Date: Tue, 21 Jun 2022 15:53:38 +0200
Message-Id: <20220621135339.1269409-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_065347_166420_D1E84276 
X-CRM114-Status: GOOD (  12.04  )
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

bus + qmi-chip-id + qmi-board-id and optionally the variant are currently
used for identifying the correct board data file.

This however is sometimes not enough as all of the IPQ8074 boards that I
have access to dont have the qmi-board-id properly fused and simply return
the default value of 0xFF.

So, to provide the correct qmi-board-id add a new DT property that allows
the qmi-board-id to be overridden from DTS in cases where its not set.
This is what vendors have been doing in the stock firmwares that were
shipped on boards I have.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index a677b056f112..fe6aafdab9d4 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -41,6 +41,14 @@ properties:
         * reg
         * reg-names
 
+  qcom,ath11k-board-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Board ID to override the one returned by the firmware or the default
+      0xff if it was not set by the vendor at all.
+      It is used along the ath11k-calibration-variant to mach the correct
+      calibration data from board-2.bin.
+
   qcom,ath11k-calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
     description:
-- 
2.36.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
