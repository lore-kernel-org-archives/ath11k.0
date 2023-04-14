Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEBBC77B78
	for <ath11k@archiver.kernel.org>; Fri, 14 Apr 2023 21:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qV8ZXi9Ku+6yN7fmbx/n7ElS9PBAfBpx7RYmWq5+zNk=; b=DADLJry/bQl0zl
	OHLNZaMd79PBTYnt7U+JDbYPeU1QmezL9Wy3Fe38xuT7AAsvCuToc7IUDI/2lnVODol8UaS1D9/9l
	4MVoJ16FcbkLB3THKrQcoofhmHj+BPBfl9hwD4UkwdKGzpRL6plxnYTp4lmWEOS4DnvDE+qv1qXgK
	k/SopBfS7sJHtD3A2cf2YYlnkbCTXsOf0RAeF8vfaciQpiKw/ZSf9u2Rg7qafdEnyaJNO7QLPqZEy
	wgG3e+NCqTIaFaigoHKKKnh+TAKG2KbcbjF7o4HLmzwQXIS2BOLtnyEhR1FMu+kR5npLqHi4gnVvF
	Dw48ms5XcYQ/i4hiu6Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnQtw-00AaaP-33;
	Fri, 14 Apr 2023 21:24:12 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnQtu-00AaZE-0g
	for ath11k@lists.infradead.org;
	Fri, 14 Apr 2023 21:24:11 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2a7b02615f1so535291fa.0
        for <ath11k@lists.infradead.org>; Fri, 14 Apr 2023 14:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681507447; x=1684099447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3L0ATs2K15l9KRiiuDKNOs5Kicmg+FttDgu2qaNiHk=;
        b=r3IQeT7/hjmVw1V1jC+isz9z9kdwxJ3mht6m/lu8GQwCjPmwoLCpfXqhMvsge61d8S
         5r6XwNKntpTT5kkI48rSOsfyDkRQpc5UFdx8wox0SjourRS1tPgw4VAnIUtqC7MURSO6
         kFregwbsNpCn/nPLpr+qg4w5sDHsb1z2BwzFj9Pts/yYihvTGpclni/4RIskockWh1fl
         v5XdcF0db7oidNvT79jhsgD1D5SlwdrDuI0szUckcCEJt1naA2R+/cPIdDKCaNR409NJ
         xuQCkp1kmiXGs4Cyc4V8UtPi6a2V3aoMF7mK/sWHlsC+jy65NcZsuRXxuqo3KPIYGnJi
         wQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681507447; x=1684099447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3L0ATs2K15l9KRiiuDKNOs5Kicmg+FttDgu2qaNiHk=;
        b=FR1QZ/Ns+WClI45J5T6FAOTkXCgpoiwwY9nh9VV8h/1sotusC5sMJFQ4hV8pnY35AU
         4yCgfS3M0oOzEeqlRxm0cwBTqEXMtr7aOBkN3MtIQruRnkbeYgM/lpbmh1iPppueQ0a1
         onuz9QW6aqZTIphQidbXtJSIIAdj27PaMNejHF5KrDu+qDwL1DnRay1kO3/rn7H7UJgU
         vxheT5xpTwGKGSNfJGx8A0kVLEIQILvKraDk29LMUbwSVac8hLL5xvz+BKpADXmM4J5x
         a+nfhik6mXCGonts+PyTjJEnGkTm6cX4f/pTgUfvW4qm/NUeZ3l2s8tDqAmU2gjHCm9/
         JQ4w==
X-Gm-Message-State: AAQBX9ea8L3xSnwhpX4Tf78vV2NEw2TEEBxK1ihF8JwY70CkzWj9TDOK
	Cm4cL/0oRxEgPGEaLw+/LYg=
X-Google-Smtp-Source: AKy350a96dPHO1SUt34Z40J/9mcdMAfyS39vxkGCFffQ7Zo1OiM4D/9sVmoeIjsndPIyNRD7Ty9IOw==
X-Received: by 2002:a19:a40e:0:b0:4e8:3f38:7d21 with SMTP id q14-20020a19a40e000000b004e83f387d21mr54986lfc.28.1681507447134;
        Fri, 14 Apr 2023 14:24:07 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id m11-20020a056512014b00b004ecad67a925sm961263lfo.66.2023.04.14.14.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 14:24:06 -0700 (PDT)
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
Subject: [PATCH 2/3] wifi: ath11k: look for DT node for each radio
Date: Fri, 14 Apr 2023 23:23:55 +0200
Message-Id: <20230414212356.9326-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414212356.9326-1-zajec5@gmail.com>
References: <20230414212356.9326-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_142410_248543_F4D70978 
X-CRM114-Status: GOOD (  11.74  )
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
