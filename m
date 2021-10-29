Return-Path: <SRS0=n+kH=PR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3150C433EF
	for <ath11k@archiver.kernel.org>; Fri, 29 Oct 2021 16:02:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D1CF610E8
	for <ath11k@archiver.kernel.org>; Fri, 29 Oct 2021 16:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D1CF610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wI29ILCDVQ16y2h82X1tpTvcrAaY7Aa2/29th9aCEvM=; b=E6iV95Na5Wg5a/
	jJ603vSMQrZMTt/QQHW6PlOj+V0M4DUnJ8/1cejCqCFRCp3q4mEK0bOiLkZmi2gQOMDZQARdRw9M+
	4OZsiw8NRRQZSyibrBCLopLnv91sdjVI0Jdr59R6Oyog+t7Q/uBzTtWqSn1pL1v/IFh9LgGDp+6Kl
	mcAYIQ1GqHgVmViXVVs8rWn5o6MuaqGAWgSsOU2pgrnKYXiTR1ZPlh45dl/HFik5Ub+oYuwQ8v8sz
	gYmuKN/iknwCcI5UCnSChfG+SKD+psxhJ0cMJVqAKFrm4RPsmYpH8EauQLOATyyrFeiAlks0VS2/O
	n9jgJ5Kps0X93dMMXn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgUKX-00BPZ9-Qd; Fri, 29 Oct 2021 16:02:09 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgUKU-00BPYW-DS
 for ath11k@lists.infradead.org; Fri, 29 Oct 2021 16:02:07 +0000
Received: by mail-lf1-x131.google.com with SMTP id u11so22002274lfs.1
 for <ath11k@lists.infradead.org>; Fri, 29 Oct 2021 09:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=woQUrDbyVZOcXIT3iB4y4XrHg1vzzWPNauYTQlFamsA=;
 b=dhqE0tpfgHSzOvatZumum4wVK2Ni4XIeLfT1qImAcJIBq2taTP5Zp/OmTDlUSEofQZ
 4hALkElH5ncVkvxJvXRr+l7B/5afi/BPTLrDj9SD3f2cYr067YgB/VMmd1Oa8Xh3gg8i
 Ujqs29ScMZydZQ32cPbNkxA8ASHIHzr+30l0Nk7ljNEf7ca9PKdHDQfJXp7Xx65if5Ep
 SKsAGjqP3tlCVNrSMTAKeLEtBRlxp8ABeLT5AKH6aJgL1rngFAd2I7vJPE1ELPoxY+Hz
 bRwQ6h01sBcukHglnad6hXZu3eP6TSilFrJMGrUF10YeIyrXjeZ4bnhgRgMDfFXlNa/7
 m+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=woQUrDbyVZOcXIT3iB4y4XrHg1vzzWPNauYTQlFamsA=;
 b=l1Bh3U31EZhluQhCAievkVDfe1DU+ZKUYCSyE/+5phFn8VcKJVk6QDuxLz++5qXufZ
 axBRORZfQXvKtAVYj8NhHogfxyTPAagDEG0KKuIvAtM1uuk4fPzH8oXeq4rEPx3GrKUY
 RNr0euNJrZdJF9b4QPRo57XrcnPkEGJVSgKPYYj4GHonku7Fj/5WCq5TwnY1N7ijJD0m
 k7egloX1yPiTYT0ERhILKWhDO/Ts+i+M1Rb8vIsj4RrzVxlohUW8Ice7kue3EEmeBtfx
 TqsEw5yqsdGm0nzP9Gykh6E1fotbls3jy1TqFGZYIqtZmusGI9w1M4wYfLu8huZM/rHw
 fnHw==
X-Gm-Message-State: AOAM5302o43qfcdLeFC+KyA+orFh+2Wc6DumaWaZJYqxuAUxn3xPuSek
 ELCTC+m96eohM7Xjd0QakIox/5VRRHs=
X-Google-Smtp-Source: ABdhPJzd7pWbgvkA6Z9VEXh3Laj9QXorg7Mzj8uyvkL1MYe4FxxK3yAipaPK+TLtsKg1sn+JTscviw==
X-Received: by 2002:a19:ae04:: with SMTP id f4mr1179425lfc.251.1635523322756; 
 Fri, 29 Oct 2021 09:02:02 -0700 (PDT)
Received: from ?IPv6:2a02:2168:88a0:5e00:a4c7:4ba3:4116:5?
 ([2a02:2168:88a0:5e00:a4c7:4ba3:4116:5])
 by smtp.gmail.com with ESMTPSA id bp16sm641728lfb.205.2021.10.29.09.02.01
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:02:01 -0700 (PDT)
From: Mark Herbert <mark.herbert42@gmail.com>
Subject: Dell XPS 9310 does not connect to network if ath11k.frame_mode=2.
To: ath11k@lists.infradead.org
Message-ID: <16afcd4e-d610-2dfc-91a4-263a17fa2748@gmail.com>
Date: Fri, 29 Oct 2021 19:02:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_090206_478044_616AF14F 
X-CRM114-Status: UNSURE (   7.68  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

RGVhciBhdGgxMWsgdGVhbSwKClNldHRpbmcgYXRoMTFrLmZyYW1lX21vZGU9McKgIG1ha2VzIHRo
aW5ncyB3b3JrIGFnYWluLsKgIE9yZGluYXJ5IHBlcnNvbmFsIAp3aWZpIHJvdXRlcnMsIHRoYXQg
d29ya3MgZmluZSB3aXRoIGFsbCBlcXVpcG1lbnQgYXQgaG9tZS4gSSBoYXZlIHRyaWVkIAp3aXRo
IHNldmVyYWwgb2YgdGhlbSAtIG5vbmUgd29ya3MuCgoKW8KgwqDCoCA5LjIyMjA2MF0gd2xhbjA6
IGF1dGhlbnRpY2F0ZSB3aXRoIGE0OmM3OjRiOmEzOjQxOjIwClvCoMKgwqAgOS4yMjIxNTNdIHds
YW4wOiBjYXBhYmlsaXRpZXMvcmVndWxhdG9yeSBwcmV2ZW50ZWQgdXNpbmcgQVAgSFQvVkhUIApj
b25maWd1cmF0aW9uLCBkb3duZ3JhZGVkClvCoMKgwqAgOS40MTMzOTRdIHdsYW4wOiBzZW5kIGF1
dGggdG8gYTQ6Yzc6NGI6YTM6NDE6MjAgKHRyeSAxLzMpClvCoMKgwqAgOS40MTc3OTJdIHdsYW4w
OiBhdXRoZW50aWNhdGVkClvCoMKgwqAgOS40MjAxMTddIHdsYW4wOiBhc3NvY2lhdGUgd2l0aCBh
NDpjNzo0YjphMzo0MToyMCAodHJ5IDEvMykKW8KgwqDCoCA5LjQyMzE1MV0gd2xhbjA6IFJYIEFz
c29jUmVzcCBmcm9tIGE0OmM3OjRiOmEzOjQxOjIwIChjYXBhYj0weDE1MzEgCnN0YXR1cz0wIGFp
ZD0xKQpbwqDCoMKgIDkuNDM5NDE2XSB3bGFuMDogYXNzb2NpYXRlZApbwqDCoCAxNC40Mzk4MTVd
IHdsYW4wOiBkZWF1dGhlbnRpY2F0aW5nIGZyb20gYTQ6Yzc6NGI6YTM6NDE6MjAgYnkgbG9jYWwg
CmNob2ljZSAoUmVhc29uOiAxNT00V0FZX0hBTkRTSEFLRV9USU1FT1VUKQoKTm8gbWF0dGVyIGhv
dyBtYW55IHRpbWVzIGkgcmV0cnkgdG8gY29ubmVjdCAtIHNhbWUgc3RvcnkuIFNldHRpbmcgCmZy
YW1lX21vZGU9MSBtYWtlcyB0aGluZ3Mgd29yayBmcm9tIHRoZSBzdGFydC4KCgoKS2luZCByZWdh
cmRzCgpNYXJrLgoKCgoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTFrCg==
