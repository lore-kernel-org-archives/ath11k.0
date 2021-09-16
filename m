Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85349C433EF
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 16:35:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FF6161929
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 16:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FF6161929
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmCbf0S+ThTmO1o2WlM1nA4E4aBlqAe1fIIdS2u8E+w=; b=LTH4kSpTztWme0
	uflzlx7mXbwXH+II8eFflFCaShqJf81rcfI60Wz2/qfsDNEFN/KkbDn7UDk8JtX7+lsPp1qzM9CXL
	7V0PIBxPzAFZcFveQO1vOtkPF0GgxJNnFNzgpZ1posPSDq5iXEDH3m+1afME+jQJFujRnTnxb9Ea3
	h4z5g1yJNgaInewmSj1PjLvhEwq9vFIsI5Yh0mcubPeXXBAP+2xMWGU4Yk5M7bGvSWnjz2M11+bkU
	q9q5ywDFvtsNtSYhbvGLjQ5HjKFaXZXyfkYSm9DOSTuXvWtWxbicHAtlIArcUnaM0fvCQe7PQUcIY
	c7OEIO3SSq9dk9Hy9bTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQuMN-00Bi27-1D; Thu, 16 Sep 2021 16:35:39 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQuMJ-00Bhzo-5u
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 16:35:36 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so7953040pjr.1
 for <ath11k@lists.infradead.org>; Thu, 16 Sep 2021 09:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gt+r7rB7pOJSQ7W9DGYo66pY6w1yXmUEGm3iewZagGs=;
 b=YOO6pC2z+QRaJL2FP1+cetlhoPONSQZg7eY2yLDK8roGPWbc9sigaVpjLo8GpopAEt
 6dpX5ls6QlvN8297Oc21azN16SHcgPDMJcitwRcy5ANGXg3bnVq3Rlc7QGoiwCwDQOsi
 JNRPNZabX30oyA2uOTy4d0YnMNkpTLESRpv498IMBHqFIS9ZtJLpLwMudRhZqv9+4ZyD
 W0F7vw7P+YsluTgr+ojS0mc5DXmGSLwQKhwpk7PYW4vV3cTbrCrXJqPWDxuqZYo6NQuv
 ZvsPwmplyQK4fMp5EMraC3ntygo3wZs+GpSUOYXxvIn4Nr1DmeIDAlH9qcIQ80FO7PCN
 l4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gt+r7rB7pOJSQ7W9DGYo66pY6w1yXmUEGm3iewZagGs=;
 b=F0QFoJRXixI/EaGk6rHQ/jk3eksTuaErPdbo9twW6a2sZtZoXzoOrfW5jCo3JLXS4V
 nl+/VRug//1/6deTT2g+oq/KVlp7PORM5p1Tcv2Iu9dCYtBF9kqOOMGaKeTGr29zFMJj
 KMSNenaIjX3+mR65EW4v6nwuKTfgoBwk+vTETz0nhFdGc2h0aPiA0/wfh3Lj2x8z4egn
 x/Dwgf7xm1isaD1d2ZI5GjjaFAiVV4cvkQVcSoJicUe83BJhV4LQ60s22ts2qOdIbVHA
 94EIaulYSfUt3U75iVoHJfKV/DWURH791z7VBlPPS8pp0OPeGrzUBBmYb1TSogvUJvwk
 DLDw==
X-Gm-Message-State: AOAM530ndvm0zOspoMU+xZw0ilei3VFtbRveAo4yj0UrcqZVYlFMlen4
 r/mtoHwPxNBpRGLUGa7Xbvn/8bWKPBKM
X-Google-Smtp-Source: ABdhPJwLv1/q2iNeC58++mRrmPhb6MJdsEz0qlcZ2ADeRpdVKbb2FXjiUMui5WtQU9sga1edO/Q9Vg==
X-Received: by 2002:a17:90a:ea8b:: with SMTP id
 h11mr7127110pjz.124.1631810134300; 
 Thu, 16 Sep 2021 09:35:34 -0700 (PDT)
Received: from thinkpad ([117.193.213.12])
 by smtp.gmail.com with ESMTPSA id m28sm3751263pgl.9.2021.09.16.09.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 09:35:33 -0700 (PDT)
Date: Thu, 16 Sep 2021 22:05:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20210916163529.GA9027@thinkpad>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_093535_302387_70978846 
X-CRM114-Status: GOOD (  11.09  )
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

T24gVGh1LCBTZXAgMTYsIDIwMjEgYXQgMDE6MTg6MjJQTSArMDIwMCwgTG9pYyBQb3VsYWluIHdy
b3RlOgo+IExlIGpldS4gMTYgc2VwdC4gMjAyMSDDoCAxMzoxMiwgTWFuaXZhbm5hbiBTYWRoYXNp
dmFtIDwKPiBtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4gYSDDqWNyaXQgOgo+IAoK
Wy4uLl0KCj4gPiBJZiB0aGluZ3Mgc2VlbXMgdG8gd29yayBmaW5lIHdpdGhvdXQgdGhhdCBwYXRj
aCwgdGhlbiBpdCBpbXBsaWVzIHRoYXQKPiA+IHNldHRpbmcgTTAKPiA+IHN0YXRlIHdvcmtzIGR1
cmluZyByZXN1bWUuIEkgdGhpbmsgd2Ugc2hvdWxkIGp1c3QgcmV2ZXJ0IHRoYXQgcGF0Y2guCj4g
Pgo+ID4gTG9pYywgZGlkIHRoYXQgcGF0Y2ggZml4IGFueSBpc3N1ZSBmb3IgeW91IG9yIGl0IHdh
cyBhIGNvc21ldGljIGZpeCBvbmx5Pwo+IAo+IAo+IEl0IGZpeGVzIHNkeCBtb2RlbSByZXN1bWlu
ZyBpc3N1ZSwgd2l0aG91dCB0aGF0IHdlIGRvbuKAmXQga25vdyBtb2RlbSBuZWVkcwo+IHRvIGJl
IHJlaW5pdGlhbGl6ZWQuCj4gCgpPa2F5LiBUaGVuIGluIHRoYXQgY2FzZSwgdGhlIHJlY292ZXJ5
IG1lY2hhbmlzbSBoYXMgdG8gYmUgYWRkZWQgdG8gdGhlIGF0aDExawpNSEkgY29udHJvbGxlci4K
CklmIHRoYXQncyB0b28gbXVjaCBvZiB3b3JrIGZvciBLYWxsZSwgdGhlbiBJJ2xsIGxvb2sgaW50
byBpdC4gQnV0IEkgbWlnaHQgZ2V0CnRpbWUgb25seSBhZnRlciBQbHVtYmVycy4KClRoYW5rcywK
TWFuaQoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
