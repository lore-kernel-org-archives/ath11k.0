Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9C0C77B71
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VZiG6srI8DnnyiD1LEVI1KzZQujgDtUI+uSbP7FItRo=; b=J4Qv5ArSQ9lY4L
	rxoUfsSlhAZ9dH3zNezxmqhIf1RMworLudYzaY8eid4g+Bx+l0+fiaJnoS1dte4oZkQ1J20Th+bKU
	Lt8GpVL3y8JXyadzVbqHW8oENWSKuZd2p4JeJq2JYyRmxkuGyqDoukWeJIwewgDYfP9WEKaQS2wHU
	kTCEMaToXVgXIryqedluc721rl+hlw/AYFPZTMCe/DxFITLbUtjOcoOqabwn7fbVavHCeMRZWZXf1
	M/yGOI+KswBmvH94mcHi6sg2JM37ranxRYIlU7yG3PwqbFX6WozwGJL6SLmrk5G14hWTEmFQ1OJOp
	j9l73mS7oiX9IyK6qvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohnP-001VSx-0s;
	Tue, 18 Apr 2023 09:38:43 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohnM-001VRT-26
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:38:41 +0000
Received: by mail-lj1-x233.google.com with SMTP id bz21so5646950ljb.11
        for <ath11k@lists.infradead.org>; Tue, 18 Apr 2023 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681810717; x=1684402717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lb7Hmi4qrMx3y4a0oEkH9YVxHmM21sJHrETGqqG+9Xk=;
        b=j0+H7Al1iBdQY1xKqRJyJwcwUhRfGBMDisXwRy29PxizwZTAUzpD6bW+61adKcZjCb
         6RUWyoIg2FAHyStLXH+3SffSmZMDluHYsEwQp2/yAOQklNRJ+hlmczDXSktw09yySv2l
         Tt8ER6C1f2impZbNVkRqlffjDGP9xNNcZImaK35al5VRW16bGl3u20IzQZ3A3VW77AIy
         nIfRuo7wD4qOiZhAap7BpKExmhoZ/ATgDG0OR/Zdp06lddvMmHl3jIHyNmVktyVHvY/4
         1ji/xcwUCl7VjtsQrEu4Lj/0umt5OvDHhGAAxHH+KK7IjHiIx88+WaI4Zk28CDNr6xOw
         oMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681810717; x=1684402717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lb7Hmi4qrMx3y4a0oEkH9YVxHmM21sJHrETGqqG+9Xk=;
        b=NFze/95e9Bl7vFWsyxAFl1I8y2TxLJh4k/soIMPudz+q50XUtjEEppWzG0SFZS2+il
         RBEbmpE1meMqSClLc8be9Ih/9aSVVNKSJON1Jlb1IYjDA6ZDvIY+47OnM4iL5ozstHju
         yj45iapqXk70cldmgRuuRjTAtECA0GGzhVr+vxmfQV1ZaqlRMvt++qf+Yh2BXJHplaAl
         41jl08i9R9SHSpfx8HuhfL6ANf+36KpuN4djyQ5Cmwmn7Mb3C7eFKUdem3RcOS1mpVwM
         Lnmi0a3VcB6MMqc7IC3NMoEnWpYrg6xEzqoqeRmz0NNVG84GuVtcjpAo/0sBxZI6Pgt7
         qYFQ==
X-Gm-Message-State: AAQBX9dYUOVgGfkwAuBKn5bldtjqImBay+rW20mnBsSN6S5ziVru/A2e
	8Wc7R0f/tJ5xw9VSxWpaBxqVMGCeNCc=
X-Google-Smtp-Source: AKy350Y2x+hHyvKcRq0EygCll3oxaYPxP0eJt1ReWSYTyB+WxGChHGASIbKWMjhZaV/r5vMB42Uqxw==
X-Received: by 2002:a2e:904c:0:b0:2a8:ddb0:baa6 with SMTP id n12-20020a2e904c000000b002a8ddb0baa6mr437460ljg.4.1681810717565;
        Tue, 18 Apr 2023 02:38:37 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id x27-20020a05651c105b00b002a8c2a4fe99sm967813ljm.28.2023.04.18.02.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:38:37 -0700 (PDT)
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
Subject: [PATCH V2 1/3] dt-bindings: net: wireless: qcom,ath11k: allow describing radios
Date: Tue, 18 Apr 2023 11:38:20 +0200
Message-Id: <20230418093822.24005-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_023840_688024_C4A90134 
X-CRM114-Status: UNSURE (   9.83  )
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
ZmFsQG1pbGVja2kucGw+Ci0tLQpWMjogRml4IGR0X2JpbmRpbmdfY2hlY2sgKGFkZCBhZGRyZXNz
ICsgc2l6ZSBjZWxscyAmIHJlZykKLS0tCiAuLi4vYmluZGluZ3MvbmV0L3dpcmVsZXNzL3Fjb20s
YXRoMTFrLnlhbWwgICAgfCAzNiArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MzYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9uZXQvd2lyZWxlc3MvcWNvbSxhdGgxMWsueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvd2lyZWxlc3MvcWNvbSxhdGgxMWsueWFtbAppbmRleCA3ZDVm
OTgyYTNkMDkuLjZhMDM2MzhkMjBmMSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL25ldC93aXJlbGVzcy9xY29tLGF0aDExay55YW1sCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvd2lyZWxlc3MvcWNvbSxhdGgxMWsueWFtbApA
QCAtNzgsNiArNzgsMzQgQEAgcHJvcGVydGllczoKICAgICBpdGVtczoKICAgICAgIC0gY29uc3Q6
IHdsYW4tc21wMnAtb3V0CiAKKyAgIiNhZGRyZXNzLWNlbGxzIjoKKyAgICBjb25zdDogMQorCisg
ICIjc2l6ZS1jZWxscyI6CisgICAgY29uc3Q6IDAKKworcGF0dGVyblByb3BlcnRpZXM6CisgICJe
cmFkaW9AWzAtMl0kIjoKKyAgICB0eXBlOiBvYmplY3QKKworICAgIGFsbE9mOgorICAgICAgLSAk
cmVmOiBpZWVlODAyMTEueWFtbCMKKworICAgIHByb3BlcnRpZXM6CisgICAgICByZWc6CisgICAg
ICAgIG1heEl0ZW1zOiAxCisgICAgICAgIGRlc2NyaXB0aW9uOiBSYWRpbyBpbmRleAorCisgICAg
ICBudm1lbS1jZWxsczoKKyAgICAgICAgaXRlbXM6CisgICAgICAgICAgLSBkZXNjcmlwdGlvbjog
TlZNRU0gY2VsbCB3aXRoIHRoZSBNQUMgYWRkcmVzcworCisgICAgICBudm1lbS1jZWxsLW5hbWVz
OgorICAgICAgICBpdGVtczoKKyAgICAgICAgICAtIGNvbnN0OiBtYWMtYWRkcmVzcworCisgICAg
dW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCiByZXF1aXJlZDoKICAgLSBjb21wYXRpYmxl
CiAgIC0gcmVnCkBAIC0zNzgsNiArNDA2LDE0IEBAIGV4YW1wbGVzOgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAid2JtMmhvc3QtdHgtY29tcGxldGlvbnMtcmluZzEiLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAidGNsMmhvc3Qtc3RhdHVzLXJpbmciOwogICAgICAgICBxY29tLHJwcm9j
ID0gPCZxNnY1X3djc3M+OworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAg
I3NpemUtY2VsbHMgPSA8MD47CisKKyAgICAgICAgcmFkaW9AMCB7CisgICAgICAgICAgICByZWcg
PSA8MHgwPjsKKyAgICAgICAgICAgIG52bWVtLWNlbGxzID0gPCZtYWM+OworICAgICAgICAgICAg
bnZtZW0tY2VsbC1uYW1lcyA9ICJtYWMtYWRkcmVzcyI7CisgICAgICAgIH07CiAgICAgfTsKIAog
ICAtIHwKLS0gCjIuMzQuMQoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTFrCg==
