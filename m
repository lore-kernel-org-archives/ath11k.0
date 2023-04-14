Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2080AC77B73
	for <ath11k@archiver.kernel.org>; Fri, 14 Apr 2023 21:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7C0IMHdrL6+4zuZKy+MwkQPkuiAbCe3/2ldHlQ4D6D8=; b=oXBuxus2EaTwF4
	hK/rqCTGsAlo3M+9dB5GxB5BRraBGULp7s9XOlVhGnKgplcB4J/0wcF6cE19uoNS75CNIHOTbX9Le
	gbf/O1YdoqYbeRZUyhgg0tt42gqausa3AYGe8TN0IuEbj2DpIkJ+rz4JlnZk3rqaHNkk+aYsSsfLD
	2DCuUToc6CZoO4jY2pBNL3DFCLdbh9q8VdFavbNi8IT4pN5C0KaR6Vniuo0wjTM0f9RBz/dmQecL4
	AUO7FU393+hyeA1KankhjnEdGFJTC5ewtB34Jp/5e6OvBhdX0D13J5nUTcX0ADNPuSsIZ2V4tZVYs
	cYH8Hm04E68TdXSvbCdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnQtu-00AaZm-1a;
	Fri, 14 Apr 2023 21:24:10 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnQts-00AaZ5-0p
	for ath11k@lists.infradead.org;
	Fri, 14 Apr 2023 21:24:09 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2a8b766322bso529211fa.1
        for <ath11k@lists.infradead.org>; Fri, 14 Apr 2023 14:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681507445; x=1684099445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDb9suLeMmDXYkFPInhtMzdY2pA7Y5KvvTt2BcPxE3I=;
        b=awJPcKfBAXLyWGxTwZm6y9UX+aY2BzjtCmOBus1CqQSkyNeQmmz8nRUGk+jPEazoAI
         g3KuRBvU5rrAsXmDGBmFuO9pSpLWu3Sm03rSo3UPUmfIHIJnSUU9y3hshLAkfUbvumH2
         OWt2PigY/fd2XyBxf/0M6sj9sTVe4GW/XeE3/t94C+fWs7OuF0p5XScS7R0L+m+88Du6
         o9mRM59+CUVTQlvxmZ9f4Z7KQ5H3s7UuCcHHqOiX5AXt4MnR7vRWX232seX7WMKZpxQJ
         dF8ddCCxGe0MT0L7YRZjfTzeBU+wM1JXNBSLC9ih/4ZSbUeekZwq8JsBZorCJrdqXvaK
         fImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681507445; x=1684099445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDb9suLeMmDXYkFPInhtMzdY2pA7Y5KvvTt2BcPxE3I=;
        b=T3Nl6IZ8wn3RBt2M524PEy9ulEr4rhs/MnDNFbEW7z2aS6WWt2+dK4MAnIVqqutCjP
         vkzlQLp8coJItE6GXpvH7Ft/r1+TTf6L4nlAyk5nwUS7d1zyUdSMuIWLCTH4kg7IqZoe
         L7dY9IQ/UQu1RUZzUu1eVUHqNNEzIWLZsFsgh1NVYSRHY7f4khsm1oauOQK9508kPGCf
         8NoUlI2utV0U/ud21O+LEuD5Mcwtj5KAcIOVALKprVaOb5vH3w42PQvIJQmeLzh5Ow1s
         3jbumsouPmRy4fBR4jzIUYOvAA2+KHFSivxX+mqTkLbtm6gpbd+Afoz4M5RiS2b1lEWD
         kF1g==
X-Gm-Message-State: AAQBX9cS3JTxialtLuOiFJVtBPLZ2wG/82i8CJ+q8C6ucCXWQ0pSqVNO
	bC/YEhsAVb1v/+aXc7wdsyoI3+81IGE=
X-Google-Smtp-Source: AKy350ar4o6C12qHdo/3lHnjJ1p/y0xMDLyWJ0mQBOVvayVlRK4Gx9xII2Txxl0wFlnvqyYKcHOAxA==
X-Received: by 2002:ac2:554a:0:b0:4ec:89d3:a8ae with SMTP id l10-20020ac2554a000000b004ec89d3a8aemr60754lfk.47.1681507445270;
        Fri, 14 Apr 2023 14:24:05 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id m11-20020a056512014b00b004ecad67a925sm961263lfo.66.2023.04.14.14.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 14:24:04 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/3] dt-bindings: net: wireless: qcom,ath11k: allow describing radios
Date: Fri, 14 Apr 2023 23:23:54 +0200
Message-Id: <20230414212356.9326-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_142408_299552_E0367D47 
X-CRM114-Status: UNSURE (   9.12  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKUXVhbGNvbW0gYXRoMTFr
IGNoaXBzZXRzIGNhbiBoYXZlIHVwIHRvIDMgcmFkaW9zLiBFYWNoIHJhZGlvIG1heSBuZWVkIHRv
CmJlIGFkZGl0aW9uYWxseSBkZXNjcmliZWQgYnkgaW5jbHVkaW5nIGl0cyBNQUMgb3IgYXZhaWxh
YmxlIGZyZXF1ZW5jeQpyYW5nZXMuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJh
ZmFsQG1pbGVja2kucGw+Ci0tLQogLi4uL2JpbmRpbmdzL25ldC93aXJlbGVzcy9xY29tLGF0aDEx
ay55YW1sICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI2IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbmV0L3dpcmVsZXNzL3Fjb20sYXRoMTFrLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbmV0L3dpcmVsZXNzL3Fjb20sYXRoMTFrLnlhbWwKaW5kZXggN2Q1Zjk4MmEz
ZDA5Li5lZDY2MGQ1NjNlMDkgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9uZXQvd2lyZWxlc3MvcWNvbSxhdGgxMWsueWFtbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3dpcmVsZXNzL3Fjb20sYXRoMTFrLnlhbWwKQEAgLTc4
LDYgKzc4LDI0IEBAIHByb3BlcnRpZXM6CiAgICAgaXRlbXM6CiAgICAgICAtIGNvbnN0OiB3bGFu
LXNtcDJwLW91dAogCitwYXR0ZXJuUHJvcGVydGllczoKKyAgIl5yYWRpb0BbMC0yXSQiOgorICAg
IHR5cGU6IG9iamVjdAorCisgICAgYWxsT2Y6CisgICAgICAtICRyZWY6IGllZWU4MDIxMS55YW1s
IworCisgICAgcHJvcGVydGllczoKKyAgICAgIG52bWVtLWNlbGxzOgorICAgICAgICBpdGVtczoK
KyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBOVk1FTSBjZWxsIHdpdGggdGhlIE1BQyBhZGRyZXNz
CisKKyAgICAgIG52bWVtLWNlbGwtbmFtZXM6CisgICAgICAgIGl0ZW1zOgorICAgICAgICAgIC0g
Y29uc3Q6IG1hYy1hZGRyZXNzCisKKyAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisK
IHJlcXVpcmVkOgogICAtIGNvbXBhdGlibGUKICAgLSByZWcKQEAgLTM3OCw2ICszOTYsMTQgQEAg
ZXhhbXBsZXM6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICJ3Ym0yaG9zdC10eC1jb21wbGV0
aW9ucy1yaW5nMSIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICJ0Y2wyaG9zdC1zdGF0dXMt
cmluZyI7CiAgICAgICAgIHFjb20scnByb2MgPSA8JnE2djVfd2Nzcz47CisgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDE+OworICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKKworICAgICAgICBy
YWRpb0AwIHsKKyAgICAgICAgICAgIHJlZyA9IDwweDA+OworICAgICAgICAgICAgbnZtZW0tY2Vs
bHMgPSA8Jm1hYz47CisgICAgICAgICAgICBudm1lbS1jZWxsLW5hbWVzID0gIm1hYy1hZGRyZXNz
IjsKKyAgICAgICAgfTsKICAgICB9OwogCiAgIC0gfAotLSAKMi4zNC4xCgoKLS0gCmF0aDExayBt
YWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
