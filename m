Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819A7C77B7A
	for <ath11k@archiver.kernel.org>; Wed, 19 Apr 2023 20:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1OxTFs81A8V0qpiFGPrb6tFxSVRdAwvStiMgWiUtMk=; b=tbf7pVwLCi2b7d
	92m+EFjQVb4wJmm7fr2GtIlAUrQ8fhJTPcqMQF6h7HO8wVC1d/sr3s/4k9JJPErHVxOvTJLX1FyOz
	K59U+inXpxxHNscsWaROZNCnLFj6FD15bwWWe04ceTc3ZM7sj4IAbiXKmaP9uVu5uhUSq0HPnevtj
	HRpC3aXwqwXsfYyc7bVNs19Fb8mLgGDPS+L/la2Bb7Mu9CVFp9Dp9jvXGbed3GYVnARSzn8f3Ubb9
	JO9S3WPg7vaOo4O+DdbWaXj6wdqq4LeSlrjKwllKdcAZmFa+xeXS2ZQO1teE+lyHXpMvbzw2N/LWd
	+HqMFSE3Uim+/EpWYVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppE3E-006Jhv-2x;
	Wed, 19 Apr 2023 20:05:12 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppE3B-006JhL-1k
	for ath11k@lists.infradead.org;
	Wed, 19 Apr 2023 20:05:10 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-505934ccc35so271649a12.2
        for <ath11k@lists.infradead.org>; Wed, 19 Apr 2023 13:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681934706; x=1684526706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O19qCOe0DTNX6gqRTl+uSUcgN/pbPN+NZIitnjjF7kU=;
        b=WpzhJ5mOLEIpKXG0XRpkqTHjOLPik2bQL9X7PsdCdaHBu/yf3B3+GVSaDYQ1MHriKX
         auq4CO/5oM0teoGCzA/49JRaU/urk1q3QCIluNfhYNMg7ePa1Obi2bc/T+/J/Gj/dtgH
         3Z0jxuVMSNLzQH4OAb9Yu/pqPSWpAXsOpeHy0vqLT82UINEy+ZimfleZQCwzi49cVmja
         wWdYYKVNDHWAOhYirwSkfKCYUFWfewrfWaUblRHf5iChOl6axhj7RV6HtrSB3J+fJPbL
         uapx2QB9WIY9P52+Bi8SmXDcuiTgt0K1snBh6/1bp+4DzpOdu8GdeW55HkE11l0TFUuv
         mczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681934706; x=1684526706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O19qCOe0DTNX6gqRTl+uSUcgN/pbPN+NZIitnjjF7kU=;
        b=mCAEdAJyqjENa0OxV0zFkZIaH5jCShQYAgNPbn5tII4q6jz1NBsIWzicJZ1XUytxgb
         Lp2IOJcEaL2Yt6kASzQlJBAswUVSN1UDSeQsd9snEWRUljrXaIZI0vYOwfu+usERmXMy
         hbPZvRar+nLyb5o008jqw3UmFBvjg4xDBjqNegbefde/cwgxlX0X5PCOnjNPchy48vmx
         Y1NOPTU81K7YGR7YZaBjpR8ZZFegFp71Pc07G8hAt619uQV+46BCbBs+ECKeqA0Wgqti
         g/WYZOwf5YuHnB60uf8jpXcysM3R0SaQPSZMmfgetJrhBTay2bph4zz/nY+fpLeS6U3h
         x7Aw==
X-Gm-Message-State: AAQBX9dOT0hMSCFKqErCETCCWAj018X9o4M07Q+hMHN/JBsYUE4gGF5g
	EhkSodqwN6Tdjg4uFhjjVQN6bg==
X-Google-Smtp-Source: AKy350aaLQ3lajWBdIxdSjFZYfHpAu1ZC15ZkICq3r8HSBuYErL71cxpOOL9pJEKVG9VG3IhfD1Qzg==
X-Received: by 2002:aa7:d882:0:b0:506:747f:3bf0 with SMTP id u2-20020aa7d882000000b00506747f3bf0mr7038464edq.8.1681934706426;
        Wed, 19 Apr 2023 13:05:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:976c:1d6c:6ed0:8935? ([2a02:810d:15c0:828:976c:1d6c:6ed0:8935])
        by smtp.gmail.com with ESMTPSA id k26-20020a056402049a00b0050841de16e9sm440030edv.64.2023.04.19.13.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 13:05:05 -0700 (PDT)
Message-ID: <4366b07b-a144-5e7f-ec41-1f58491b36f5@linaro.org>
Date: Wed, 19 Apr 2023 22:05:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V2 1/3] dt-bindings: net: wireless: qcom,ath11k: allow
 describing radios
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Kalle Valo <kvalo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Robert Marko <robimarko@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20230418093822.24005-1-zajec5@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418093822.24005-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_130509_598502_27FDD6A1 
X-CRM114-Status: UNSURE (   9.40  )
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

T24gMTgvMDQvMjAyMyAxMTozOCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEZyb206IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBRdWFsY29tbSBhdGgxMWsgY2hpcHNl
dHMgY2FuIGhhdmUgdXAgdG8gMyByYWRpb3MuIEVhY2ggcmFkaW8gbWF5IG5lZWQgdG8KPiBiZSBh
ZGRpdGlvbmFsbHkgZGVzY3JpYmVkIGJ5IGluY2x1ZGluZyBpdHMgTUFDIG9yIGF2YWlsYWJsZSBm
cmVxdWVuY3kKPiByYW5nZXMuCgpUaGUgYmluZGluZyBsb29rcyBmaW5lLCBidXQgSSB3b25kZXIg
d2hhdCBpcyB0aGUgcmFkaW8gaGVyZT8gSXQgZmVlbHMKbGlrZSBvbmUgYW50ZW5uYSwgZS5nLiAy
LjQgb3IgNSBHSHosIGJ1dCB5b3UgYWRkZWQgJHJlZiB0bwppZWVlODAyMTEueWFtbCB3aGljaCBp
cyB1c2VkIGZvciBlbnRpcmUgZGV2aWNlLiBXaGF0IGlzIHRoZSAicmFkaW8iIGhlcmU/Cgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0K
PiBWMjogRml4IGR0X2JpbmRpbmdfY2hlY2sgKGFkZCBhZGRyZXNzICsgc2l6ZSBjZWxscyAmIHJl
ZykKPiAtLS0KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKLS0gCmF0aDExayBtYWlsaW5nIGxp
c3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
