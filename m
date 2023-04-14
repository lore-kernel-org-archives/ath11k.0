Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF259C77B71
	for <ath11k@archiver.kernel.org>; Fri, 14 Apr 2023 21:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPb+P4EEWiXEPVML2sUvKv9ZLf/PNnVDMy1jGsr66lc=; b=OD3mR7xdh1C83k
	mCPRXYPBGitKw6gCrLrTwgoZxla5CwMQUZbf70nEQwlNR8XWaLWsIhT59yNIhh2ISeeuDBpev7LzH
	dIpPUNvt+eq9aPLck3JL1CxxZmpJqFa7MzP4PbiIP6lron2d4KebtCLrLKtNp/sp/EEY/rfUCV39C
	s2WWfrlkLfQHg//oyfL+iV1WsLW1HXzTC7aBghjKsDCaewxKPIpcBXBnFJCGmlayj2xG6jYcx1H+P
	4u6ZU25JoTq92ckTJ33EKFum+gdT0iWMDaK5oGK4hv6AwhWvQb3l7BrTDxOE95lD0mmdAY1/oRzgB
	NgRAljGu/JgJ2DS8UP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnQu0-00Aac7-1M;
	Fri, 14 Apr 2023 21:24:16 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnQtx-00AaZY-1d
	for ath11k@lists.infradead.org;
	Fri, 14 Apr 2023 21:24:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4ec90a48453so62916e87.1
        for <ath11k@lists.infradead.org>; Fri, 14 Apr 2023 14:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681507449; x=1684099449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EiDytvabdYN54DIeMJTMZ/ViwsZyEhMHyZ0a9MJx4o=;
        b=f4bXWIVQdBvGSTrlBLVpdjpmOpLlf/2zdUUYvWsYmqr1oM2sa0uOWGdPjMUDAYU19/
         9FRa/pjk5Bh3ItGibXEqYg/jPR8uXoOme2v5qsFilkyI+hJuLgtAaAP9vRbRD8YPJ9TP
         TpQqaHKYS5JmhzpF/ivSf9LXQccZOYBd1u4hUxOGwpamErBL0Cep+J/a0+Wzl1LRhsXm
         jWv/tCmWNbN8VVWD7Zo+g7mvIMoZqGYJgXlSuc4an0E+nlmGC6kqB1X3Cnjq0IEAEZvq
         IRQerQ4SWmll4wSfdfNPParLM5LNk7Abli51mYfUvneX2An3VzgOyeQvd75oQzfsFTTK
         9e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681507449; x=1684099449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EiDytvabdYN54DIeMJTMZ/ViwsZyEhMHyZ0a9MJx4o=;
        b=N5qrIrjy/51O1jqNWRGIy2lLrVLcIAqYWAMJDKkOdxd04dMIDbsunkOFq6JbaglN9P
         7QpL24GPg3wiqjZ1c3z2bvMZk1ODy5Un+BjXH3xT73n4RX2/X+9O9bBJfh+gwCiev0wz
         rNkFPrIJ55V83qRRAVj+kCATrRQOeo40T+uu3VFrJupm0JbaLfvwICPCsIKBK6LyHJN0
         8CQy7E1yNnrf16ZMbkPuwlQ03rtgR+i4A6vfVgg4aBW+jfMV0ZyrR9KjCiFB3gcQPQOT
         A5Z1PbctMdkbbKh7RhskVXuJ1mzLqPVzofDQMBvITjm4c42C5eZ6GOcxgS4Y2tBD3fXI
         zFOw==
X-Gm-Message-State: AAQBX9erIo4H9zrxttTMPWSLTVd50hJyjRkIgmE/8HVk51MLF9V0UWdO
	R9P63N6Ro9Vyz6uyRcBVLvw=
X-Google-Smtp-Source: AKy350ZI1VywWQcvXG6FwGA8wlIsDCE6CZLzEI5r5l8KCp0+nQsf0jYJpptE+LEBb49w6SKevH1t1w==
X-Received: by 2002:a19:7003:0:b0:4db:3605:9bd3 with SMTP id h3-20020a197003000000b004db36059bd3mr55621lfc.17.1681507449498;
        Fri, 14 Apr 2023 14:24:09 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id m11-20020a056512014b00b004ecad67a925sm961263lfo.66.2023.04.14.14.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 14:24:09 -0700 (PDT)
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
Subject: [PATCH 3/3] wifi: ath11k: support reading radio MAC from DT
Date: Fri, 14 Apr 2023 23:23:56 +0200
Message-Id: <20230414212356.9326-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414212356.9326-1-zajec5@gmail.com>
References: <20230414212356.9326-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_142413_545871_FE3A3EF8 
X-CRM114-Status: GOOD (  13.73  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKT24gc29tZSBkZXZpY2Vz
IChtb3N0IHJvdXRlcnMpIE1BQyBpcyBzdG9yZWQgaW4gYW4gTlZNRU0gY2VsbC4gU3VwcG9ydApy
ZWFkaW5nIGl0LgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgotLS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgfCAxNSArKysr
KysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMg
Yi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jCmluZGV4IGFkNWEyMmQxMmJk
My4uNjU1MGJiNWIyZWNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTFrL21hYy5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMKQEAg
LTgsNiArOCw3IEBACiAjaW5jbHVkZSA8bGludXgvZXRoZXJkZXZpY2UuaD4KICNpbmNsdWRlIDxs
aW51eC9iaXRmaWVsZC5oPgogI2luY2x1ZGUgPGxpbnV4L2luZXRkZXZpY2UuaD4KKyNpbmNsdWRl
IDxsaW51eC9vZl9uZXQuaD4KICNpbmNsdWRlIDxuZXQvaWZfaW5ldDYuaD4KICNpbmNsdWRlIDxu
ZXQvaXB2Ni5oPgogCkBAIC05MjkyLDcgKzkyOTMsNyBAQCBpbnQgYXRoMTFrX21hY19yZWdpc3Rl
cihzdHJ1Y3QgYXRoMTFrX2Jhc2UgKmFiKQogCXN0cnVjdCBhdGgxMWtfcGRldiAqcGRldjsKIAlp
bnQgaTsKIAlpbnQgcmV0OwotCXU4IG1hY19hZGRyW0VUSF9BTEVOXSA9IHswfTsKKwl1OCBkZXZp
Y2VfbWFjX2FkZHJbRVRIX0FMRU5dID0gezB9OwogCiAJaWYgKHRlc3RfYml0KEFUSDExS19GTEFH
X1JFR0lTVEVSRUQsICZhYi0+ZGV2X2ZsYWdzKSkKIAkJcmV0dXJuIDA7CkBAIC05MzA1LDE4ICs5
MzA2LDIyIEBAIGludCBhdGgxMWtfbWFjX3JlZ2lzdGVyKHN0cnVjdCBhdGgxMWtfYmFzZSAqYWIp
CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCWRldmljZV9nZXRfbWFjX2FkZHJlc3MoYWIt
PmRldiwgbWFjX2FkZHIpOworCWRldmljZV9nZXRfbWFjX2FkZHJlc3MoYWItPmRldiwgZGV2aWNl
X21hY19hZGRyKTsKIAogCWZvciAoaSA9IDA7IGkgPCBhYi0+bnVtX3JhZGlvczsgaSsrKSB7CisJ
CXU4IHJhZGlvX21hY19hZGRyW0VUSF9BTEVOXTsKKwogCQlwZGV2ID0gJmFiLT5wZGV2c1tpXTsK
IAkJYXIgPSBwZGV2LT5hcjsKLQkJaWYgKGFiLT5wZGV2c19tYWNhZGRyX3ZhbGlkKSB7CisJCWlm
ICghb2ZfZ2V0X21hY19hZGRyZXNzKGFyLT5ucCwgcmFkaW9fbWFjX2FkZHIpKSB7CisJCQlldGhl
cl9hZGRyX2NvcHkoYXItPm1hY19hZGRyLCByYWRpb19tYWNfYWRkcik7CisJCX0gZWxzZSBpZiAo
YWItPnBkZXZzX21hY2FkZHJfdmFsaWQpIHsKIAkJCWV0aGVyX2FkZHJfY29weShhci0+bWFjX2Fk
ZHIsIHBkZXYtPm1hY19hZGRyKTsKIAkJfSBlbHNlIHsKLQkJCWlmIChpc196ZXJvX2V0aGVyX2Fk
ZHIobWFjX2FkZHIpKQorCQkJaWYgKGlzX3plcm9fZXRoZXJfYWRkcihkZXZpY2VfbWFjX2FkZHIp
KQogCQkJCWV0aGVyX2FkZHJfY29weShhci0+bWFjX2FkZHIsIGFiLT5tYWNfYWRkcik7CiAJCQll
bHNlCi0JCQkJZXRoZXJfYWRkcl9jb3B5KGFyLT5tYWNfYWRkciwgbWFjX2FkZHIpOworCQkJCWV0
aGVyX2FkZHJfY29weShhci0+bWFjX2FkZHIsIGRldmljZV9tYWNfYWRkcik7CiAJCQlhci0+bWFj
X2FkZHJbNF0gKz0gaTsKIAkJfQogCi0tIAoyLjM0LjEKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlz
dAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
