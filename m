Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DA3C77B71
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPb+P4EEWiXEPVML2sUvKv9ZLf/PNnVDMy1jGsr66lc=; b=sIjZHhbSVTvTBS
	gp3/scSZafMjsC4C+jA3RSjImvBAUxQaHDSStFYoMVZS8zYQUwflmzkY06D5sOxT04eNP3xAz6nLx
	lI00Xu09C9BJWzO+DXcl7Iuaf2PtQmNWPkcFCrSFrpZxROeU9hAf5scX01xCdNQoMRPcwYBcSpvyh
	gEVB3DJlKBPzt7ltofxBDLeyarj2nduAG2rdXb2o9li1F+wszyCLs4DeXf2NlhYrckorZ1K5Y4Azc
	A9r/LFWh+3a7jyyNSwdYdSrHUA74Qiohv+/tV7yvGPmI6Xr8boicDMXZGBWIlEr0YXnPAb2ZZrVAu
	rXpgGOPDo3/hZSojhYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohnZ-001VWr-21;
	Tue, 18 Apr 2023 09:38:53 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohnX-001VV1-0X
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:38:52 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4ec816c9d03so2085471e87.2
        for <ath11k@lists.infradead.org>; Tue, 18 Apr 2023 02:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681810727; x=1684402727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EiDytvabdYN54DIeMJTMZ/ViwsZyEhMHyZ0a9MJx4o=;
        b=Mgp+FdmjTOO8yLjct8Ey6wAnQpaKYZlpn2pHIG/2fXHgwHj/Ymsw2LgM4jEvE+za4O
         jAp/K7vJGFvKrT3Du403FmySbg0WVdwsklAz0iRECcpDaazBXpH62uSP6gUCQG0Q+uPH
         gfhOAYxFyRewQeY9zawHDscntVwKav0mwa5QqidN9YpWT1+rwN2ck5CYjjqenxl03Tl7
         tRe4tdK6V//ly3ZSmdFwmmlHxVGg79S5O4pJvxFMywh3NuWbwReXEWVmWD0oXdylO2x7
         d/c20YL0TytiL9Amg2m/gKdQbF1YHytZTgBDbYhT91FWNjluR8A0ZG92/MlBjt5QbpZV
         2qjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681810727; x=1684402727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EiDytvabdYN54DIeMJTMZ/ViwsZyEhMHyZ0a9MJx4o=;
        b=laaqGann/xZ875Ukx8coG9nCW510MSLj3cwgW1vkSOaqGHOg8Y11A05+xeIhMvqkdv
         ZlU/2iVQaPx4MNiXEB4taqs28mDKnhylG0CDjEGDUlIBsxnC5upce1uqB/RR8dfLzefe
         32qxpThnO6LRcF0qHJwhq8gvyIFlfcp8urpGRY7eKA4KJ3Xq5J1X7aoj2lACePFqtSCR
         jH+7MjfjW280AedeiKkFU3uRUAxTXC4zd1gsKeEgV93vCp3DcGlHfjY8iSRcu6ZTjEeM
         p1eMGiyrbLMnplvnWm4H3oVRtjdicgnFcNPKHNt+oN9P4MSdur+jlIBOR1l5/Joqdrot
         JPUg==
X-Gm-Message-State: AAQBX9eedNb3jvKxo8/KSRumk8Zd8gOFZp3UP8IFCpVw0DnNiZLtwYI3
	BDMsYSkEzCYedg4SFTAMXFE=
X-Google-Smtp-Source: AKy350ZXxaKlonTpKEaCIg1QXYK9jvpC8SvvkEmTVCX2/ZXSW9v2VJsf2RGCeOgoAGtNFBxH/Rf4eA==
X-Received: by 2002:ac2:46c9:0:b0:4ed:c537:d0ca with SMTP id p9-20020ac246c9000000b004edc537d0camr1608334lfo.59.1681810727353;
        Tue, 18 Apr 2023 02:38:47 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id x27-20020a05651c105b00b002a8c2a4fe99sm967813ljm.28.2023.04.18.02.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:38:46 -0700 (PDT)
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
Subject: [PATCH V2 3/3] wifi: ath11k: support reading radio MAC from DT
Date: Tue, 18 Apr 2023 11:38:22 +0200
Message-Id: <20230418093822.24005-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418093822.24005-1-zajec5@gmail.com>
References: <20230418093822.24005-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_023851_202447_4CC90C2B 
X-CRM114-Status: GOOD (  13.74  )
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
