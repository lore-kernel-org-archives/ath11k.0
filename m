Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD2AC433FE
	for <ath11k@archiver.kernel.org>; Wed, 16 Feb 2022 20:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVhZ0GxdC48raoZ8gfzg/SkRxnXbnz5OD4q6bIEBoB4=; b=NaB+mKsflxrvYr
	DhgrlB6ZqHRO5UnalQJDCZroxcc3f6Hp5biM0c/s0+aa27z2OWjkVeT83IBDHbykm2ATQyM2++Tb1
	d+mX51wb4+lej6SKdBvXobnGI2aAkWvDTMtekzdGkrGeBFI+C4tpWWYltN1NorL5iMbkaJLbLgVPR
	JmPikWgQpqqdpwxQyrf76RCdU840AHkkeOEPlisbkKkUTOlPzTSw594uHGJYPyukp/g83bEk4u3So
	cnKuyj4Y+C2XxyeDKifo3LgdTgnkkWshyOI8rmfMBs7AwJq7f8gRGT0XSm9qMCyovHbjB6sBzQ2A1
	8J5NG5lLT8xSE0GRe+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKR0G-008Kk9-Sg; Wed, 16 Feb 2022 20:34:20 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKR0E-008KjK-Ny
 for ath11k@lists.infradead.org; Wed, 16 Feb 2022 20:34:20 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d187so3087165pfa.10
 for <ath11k@lists.infradead.org>; Wed, 16 Feb 2022 12:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dUD1O3o1ifOwlrT9wCiI69FVgZyS7G64yh4bIznkTt8=;
 b=cToYCa4Q9YzpuQ8hWjqhI9GAV7hdMX5zFfA045ME9Esgzb7iXXOnP66rLDTpXnUrsH
 ZXAOBQjk3+lTbLD8wwG/XQjRIHof/WW7ZnfXUIQbSGmHV1myOfuF1iJY07seXS5BUgSt
 UWRna5Sk/M3/2NaZ6zLnXSYBj4DI3P+O7+ly0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dUD1O3o1ifOwlrT9wCiI69FVgZyS7G64yh4bIznkTt8=;
 b=cXiBf823ji09ObcIr0KNmHN82eMmRobWus8mYDAx+2nP6EwJhMXfRRR+7j1topX56+
 N9L2qxdjOPlcaWyd50wvAImI+Rr8tLFBlLsRa+DWBv6l+GqBAcmVdTEq9WUCc9eU/vJ8
 Ln3L724eDfyIQdojV3uVbFvC5rZRfdaaPc/EaaMIfRc+gaVm5GRg15acS92FbdZrMUbu
 5FNXZkkEdR712Er84Yla7ZHGBylBExTKNhKS37BYyK+8KV7dLW5az7sZgoiK1umT6lnL
 WCfIviIfcJwZwKCZpmLDTtREBgjcbFiAbBq+w+gRXhL9zP2dRTm7J67FmvMt+nQMfVY4
 ST9g==
X-Gm-Message-State: AOAM530jLZoKgZRrOfbzjxjQ9mcT6Z0q+0xqCCvrssW7wO/cp3p5Qtnh
 EFeeP4URwJfrFeyOUu0KIXt0gY2vm1LeNw==
X-Google-Smtp-Source: ABdhPJxQlIx/zpkn6DzwhHmBHxoQ/aVVFwDrNfFlAwdVpmL8Xx2laM6IKnYH6S9ktvf3oiVfYtmAgA==
X-Received: by 2002:aa7:8d08:0:b0:4e1:5fb5:b15 with SMTP id
 j8-20020aa78d08000000b004e15fb50b15mr4799283pfe.70.1645043657895; 
 Wed, 16 Feb 2022 12:34:17 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t2sm44157008pfj.211.2022.02.16.12.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 12:34:17 -0800 (PST)
Date: Wed, 16 Feb 2022 12:34:17 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ath11k: Replace zero-length arrays with
 flexible-array members
Message-ID: <202202161234.7DBAE56797@keescook>
References: <20220216194836.GA904035@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216194836.GA904035@embeddedor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_123418_805774_F3D79231 
X-CRM114-Status: UNSURE (   9.41  )
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

T24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgMDE6NDg6MzZQTSAtMDYwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBUaGVyZSBpcyBhIHJlZ3VsYXIgbmVlZCBpbiB0aGUga2VybmVsIHRvIHBy
b3ZpZGUgYSB3YXkgdG8gZGVjbGFyZQo+IGhhdmluZyBhIGR5bmFtaWNhbGx5IHNpemVkIHNldCBv
ZiB0cmFpbGluZyBlbGVtZW50cyBpbiBhIHN0cnVjdHVyZS4KPiBLZXJuZWwgY29kZSBzaG91bGQg
YWx3YXlzIHVzZSDigJxmbGV4aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZQo+IGNh
c2VzLiBUaGUgb2xkZXIgc3R5bGUgb2Ygb25lLWVsZW1lbnQgb3IgemVyby1sZW5ndGggYXJyYXlz
IHNob3VsZAo+IG5vIGxvbmdlciBiZSB1c2VkWzJdLgo+IAo+IFsxXSBodHRwczovL2VuLndpa2lw
ZWRpYS5vcmcvd2lraS9GbGV4aWJsZV9hcnJheV9tZW1iZXIKPiBbMl0gaHR0cHM6Ly93d3cua2Vy
bmVsLm9yZy9kb2MvaHRtbC92NS4xNi9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCN6ZXJvLWxlbmd0
aC1hbmQtb25lLWVsZW1lbnQtYXJyYXlzCj4gCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0tT
UFAvbGludXgvaXNzdWVzLzc4Cj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8
Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tA
Y2hyb21pdW0ub3JnPgoKLS0gCktlZXMgQ29vawoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRo
MTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMWsK
