Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CFEC77B75
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qV8ZXi9Ku+6yN7fmbx/n7ElS9PBAfBpx7RYmWq5+zNk=; b=ldES3xTx+HTPag
	e8l9RR1TsmyOtlTAfwHhjpBcWkSAFePUidtQiZ2kXcgTfecFkce8GglHe28ZvtBWy1g2SpC03xZmm
	iD9X1L08FNHTN1eHC3y55D/eLLr8v9IZqjYp+luAr5HHEsk1DO1eG8rpR1inRIQ+YI8Mahgby5VkT
	Qcx9hI7OUh0jCpCqMuSxQ6ib588a3v6KGGvkhZLVedSRo0LAF8pXJooE1WmzahjzMJCj7KsysI2rI
	n3Ls+aY4Gbsct92n/zBmZMoVkv59u7ySSIrwGyMVl+rVQun/MIzLmpCvehtp/vAgdIPZKgOUYx/Md
	3oek5KpZMT6P50ti86Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohnV-001VVN-2f;
	Tue, 18 Apr 2023 09:38:49 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohnT-001VTQ-0w
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:38:48 +0000
Received: by mail-lj1-x22a.google.com with SMTP id j11so17198842ljq.10
        for <ath11k@lists.infradead.org>; Tue, 18 Apr 2023 02:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681810723; x=1684402723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3L0ATs2K15l9KRiiuDKNOs5Kicmg+FttDgu2qaNiHk=;
        b=nyhv9S0CNC/PjzJe5IhoxOI5OUcKQW6S/FB8RtNgOqP3iwEQkVqxo0wzEMV7CETBYi
         ZgdGmaLFOKFWOpW/gQlZcVce05Ip3BlZOc3Ssey0E3xi/OSLhlmxUl/ziXV1e+0t4SMi
         gmi/iUWo1+nNmk/FFJxuAqz5E+IFneKtFit4KIOKrcKn81EEdEmEGRVPZslOxN4iX/iG
         lvK6PrzD9RbCwBpEgpWDAwBmK61cRHUJ8i0KJ7qO79I0TEvIXm7mHsT4nFVr3fRB3Y7C
         z4wAsvpWsjOa16RLxrg8nKP6zuEmvbQUqBC8bts2Km4HGCK/AvFNkzVTO8AXLGlAjciF
         ca1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681810723; x=1684402723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3L0ATs2K15l9KRiiuDKNOs5Kicmg+FttDgu2qaNiHk=;
        b=LdejqVB1tFxWWqy6EV0FlIh885hW3pW/QALuCRlYWtxNUK97eJxVswgLqByxCXokp2
         0zpxGclded0dhM9zenHjD0B60wBZwdX+m/SrM37CGDYd40aHbBdn+Egdj5A33bI9KIj0
         3Eega/NrZj0TxVALt+02K5QTk/FSzyLqrji9UVyac0gaqjoHgZjkiiD2qv3Giw3YnsCp
         BPVEa4IPdMF6lU3dtmH69VtZtcruM8pGbOsxCKB0eT52tJY92y0D4/KI2jfKLZZKvHFG
         kygKE9VEvq4zDhF/4T7eV7znHtr3TVLcB+b+bSF0MavixjD3jkNvZEdtYNlVIHOlprm2
         3ZyQ==
X-Gm-Message-State: AAQBX9eCdVlKYpWp3pNCC5ZEX2/4FoJZ2mKgh221Rl7Fk3Vsf9QYgpld
	yZQv8RW3Lq/w2peRk0dE3M4Qosv5C1o=
X-Google-Smtp-Source: AKy350aAZVr9gDKCYEA8tQIss8/jDCz0fJfn3QG0JlbQJC+0CUZwVHCflgLzuVWWCmHnlncRScdl6g==
X-Received: by 2002:a2e:92c5:0:b0:2a8:e480:a3c8 with SMTP id k5-20020a2e92c5000000b002a8e480a3c8mr334644ljh.44.1681810723462;
        Tue, 18 Apr 2023 02:38:43 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id x27-20020a05651c105b00b002a8c2a4fe99sm967813ljm.28.2023.04.18.02.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:38:43 -0700 (PDT)
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
Subject: [PATCH V2 2/3] wifi: ath11k: look for DT node for each radio
Date: Tue, 18 Apr 2023 11:38:21 +0200
Message-Id: <20230418093822.24005-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418093822.24005-1-zajec5@gmail.com>
References: <20230418093822.24005-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_023847_330119_CF1E4947 
X-CRM114-Status: GOOD (  12.07  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVXBkYXRlZCBEVCBiaW5k
aW5nIGFsbG93cyBkZXNjcmliaW5nIGVhY2ggY2hpcCByYWRpby4KClNpZ25lZC1vZmYtYnk6IFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTFrL2NvcmUuaCB8ICAyICsrCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTFrL21hYy5jICB8IDIwICsrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTFrL2NvcmUuaCBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvY29yZS5oCmluZGV4
IDA4MzAyNzZlNTAyOC4uMWE1ODNhZGYyYWIxIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTFrL2NvcmUuaAorKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTFrL2NvcmUuaApAQCAtMTMsNiArMTMsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+
CiAjaW5jbHVkZSA8bGludXgvZG1pLmg+CiAjaW5jbHVkZSA8bGludXgvY3R5cGUuaD4KKyNpbmNs
dWRlIDxsaW51eC9vZi5oPgogI2luY2x1ZGUgPGxpbnV4L3JoYXNodGFibGUuaD4KICNpbmNsdWRl
IDxsaW51eC9hdmVyYWdlLmg+CiAjaW5jbHVkZSAicW1pLmgiCkBAIC01OTIsNiArNTkzLDcgQEAg
c3RydWN0IGF0aDExa19wZXJfcGVlcl90eF9zdGF0cyB7CiBzdHJ1Y3QgYXRoMTFrIHsKIAlzdHJ1
Y3QgYXRoMTFrX2Jhc2UgKmFiOwogCXN0cnVjdCBhdGgxMWtfcGRldiAqcGRldjsKKwlzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wOwogCXN0cnVjdCBpZWVlODAyMTFfaHcgKmh3OwogCXN0cnVjdCBpZWVl
ODAyMTFfb3BzICpvcHM7CiAJc3RydWN0IGF0aDExa19wZGV2X3dtaSAqd21pOwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYyBiL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMKaW5kZXggY2FkODMyZTBlNmI4Li5hZDVhMjJkMTJiZDMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMKKysrIGIv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYwpAQCAtOTM0NCw2ICs5MzQ0LDI1
IEBAIGludCBhdGgxMWtfbWFjX3JlZ2lzdGVyKHN0cnVjdCBhdGgxMWtfYmFzZSAqYWIpCiAJcmV0
dXJuIHJldDsKIH0KIAorc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqYXRoMTFrX21hY19maW5k
X3JhZGlvX25vZGUoc3RydWN0IGF0aDExa19iYXNlICphYiwgaW50IGkpCit7CisJc3RydWN0IGRl
dmljZV9ub2RlICpucDsKKworCWZvcl9lYWNoX2NoaWxkX29mX25vZGUoYWItPmRldi0+b2Zfbm9k
ZSwgbnApIHsKKwkJdTMyIHJlZzsKKwkJaW50IGVycjsKKworCQlpZiAoc3RyY21wKG5wLT5uYW1l
LCAicmFkaW8iKSkKKwkJCWNvbnRpbnVlOworCisJCWVyciA9IG9mX3Byb3BlcnR5X3JlYWRfdTMy
KG5wLCAicmVnIiwgJnJlZyk7CisJCWlmICghZXJyICYmIHJlZyA9PSBpKQorCQkJcmV0dXJuIG5w
OworCX0KKworCXJldHVybiBOVUxMOworfQorCiBpbnQgYXRoMTFrX21hY19hbGxvY2F0ZShzdHJ1
Y3QgYXRoMTFrX2Jhc2UgKmFiKQogewogCXN0cnVjdCBpZWVlODAyMTFfaHcgKmh3OwpAQCAtOTM2
OSw2ICs5Mzg4LDcgQEAgaW50IGF0aDExa19tYWNfYWxsb2NhdGUoc3RydWN0IGF0aDExa19iYXNl
ICphYikKIAkJYXItPmFiID0gYWI7CiAJCWFyLT5wZGV2ID0gcGRldjsKIAkJYXItPnBkZXZfaWR4
ID0gaTsKKwkJYXItPm5wID0gYXRoMTFrX21hY19maW5kX3JhZGlvX25vZGUoYWIsIGkpOwogCQlh
ci0+bG1hY19pZCA9IGF0aDExa19od19nZXRfbWFjX2Zyb21fcGRldl9pZCgmYWItPmh3X3BhcmFt
cywgaSk7CiAKIAkJYXItPndtaSA9ICZhYi0+d21pX2FiLndtaVtpXTsKLS0gCjIuMzQuMQoKCi0t
IAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
