Return-Path: <SRS0=XSrc=HF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D97C433DB
	for <ath11k@archiver.kernel.org>; Wed,  3 Feb 2021 19:29:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94D2464E39
	for <ath11k@archiver.kernel.org>; Wed,  3 Feb 2021 19:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94D2464E39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DD5CSU8ZveSUxq407v7i/Jgl9ojyMfAZPxHsPwSt5JM=; b=1YVHIGEpygI280xyVvPLBmNKg
	/R9hdcSUm6zpOMEXuuY2LaMYDNt/oxPK3a2X3kZV6t73tqhh+eWF9vB5+TSWdNpEutzW3YGqUFLT8
	Qpwu/HfmhN4gf/Q5fzhIHAt6MSc4RkVMMiHZNJAzcc0QXrWivMSEqm4TvN//EMYRwWOd30GIi8lqS
	nZu9lwmTgOZz96DApGVOCDYr3ElNNwd1+dU65ZzIPIg+Y08655M8nAD0vYWYRsMO4HSUlZOCl9L2S
	74E/yEPkL0bb4ML1ITKprhxd8PyzBOPopBXSuLMC+/o0LDN30oAa36MYQ3Xv0f3eU90DyDyFrVqoZ
	9qzCN1now==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Nqb-0001rh-Mz; Wed, 03 Feb 2021 19:29:53 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7NqZ-0001pf-2o
 for ath11k@lists.infradead.org; Wed, 03 Feb 2021 19:29:52 +0000
Received: by mail-pg1-x533.google.com with SMTP id c132so446358pga.3
 for <ath11k@lists.infradead.org>; Wed, 03 Feb 2021 11:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=iiosoeqvZZM3bn/8qyuaFKyxIlwkumJhKeaE0qsY8nc=;
 b=Onmq0gObz39UFdM048agTK0US8MnjQTd3TP1ihWh6JZbCm/JyAApe1pgu/R4eavYhU
 Ag4QUH11CinXtbxR8Rnnc1RpG/NMvG1m+M57/Km0VbDpF5UCUiN/BKR99fYTO45GkK1G
 iAWA5yxxM6hb//MmTA9vEiq+5CfrM9b8fxlKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iiosoeqvZZM3bn/8qyuaFKyxIlwkumJhKeaE0qsY8nc=;
 b=a0ucLDuBdGynxx7Junhn/6SjPmKDrcvVc7oI+DqlOsdAaRNATggcdSYZnpYZpPHqht
 V+nIZbzdUJW8OSAPO1EEGDZ/t73JrE9Fojagd/WXTT96YzQzhZBVMoUPvI4NdpzxXfbr
 6qkGlESserWpJdxmybrqJh0ocx+p/XQfU7BDarLvuqeLpw0Kd52FEhuM0TnntmDnKhvH
 /G/ONRBxMGX4Yr1X8SfR4Z5oxlUoEonzb4hzi1hueWbaoFWO4ZsTYcZaRcjf5dmJICoK
 Z9wZM8jrWruVLFscdlzq1WFBqv0VA1D33cbFAKuWaMuz3i+tumS52hfvDXQycN2oavh5
 /ZCQ==
X-Gm-Message-State: AOAM530yI7KzMFH/8ol6YnUxud9LSDeJFVepVYTxkHgEEihWPCRNVwN/
 IOPqTpbPIqgnSL4UGhz7KCSk4w==
X-Google-Smtp-Source: ABdhPJyn9O3w3fkrzFlCGEkRxscPsCJoIGaxAw1uvbMtuPTlTvEpbRHHMWHBDWq7eR3kTE0ql0RgKQ==
X-Received: by 2002:aa7:9596:0:b029:1be:28cc:cfe8 with SMTP id
 z22-20020aa795960000b02901be28cccfe8mr4278881pfj.49.1612380587114; 
 Wed, 03 Feb 2021 11:29:47 -0800 (PST)
Received: from [192.168.4.200]
 (107-196-182-50.lightspeed.sntcca.sbcglobal.net. [107.196.182.50])
 by smtp.gmail.com with ESMTPSA id 101sm2777067pjo.38.2021.02.03.11.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 11:29:46 -0800 (PST)
Subject: Re: [PATCH] ath11k: Update tx descriptor search index properly
To: Karthikeyan periyasamy <periyasa@codeaurora.org>
References: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
 <959ea12a-e35b-5867-c55e-7f62e2956b09@eero.com>
 <d6cbfd2aff787faa3be69252b2677df9@codeaurora.org>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <08ef5e10-de7a-fe13-d23a-d1afa1dbd0e5@eero.com>
Date: Wed, 3 Feb 2021 11:29:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d6cbfd2aff787faa3be69252b2677df9@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_142951_265436_710E29BA 
X-CRM114-Status: GOOD (  13.97  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Ck9uIDEvMjYvMjEgNjo0NiBQTSwgS2FydGhpa2V5YW4gcGVyaXlhc2FteSB3cm90ZToKPiBPbiAy
MDIwLTEyLTE5IDAwOjUzLCBQZXRlciBPaCB3cm90ZToKPj4gT24gMTIvMTgvMjAgNzoyNCBBTSwg
S2FydGhpa2V5YW4gUGVyaXlhc2FteSB3cm90ZToKPj4+IFR4IGRlc2NyaXB0b3Igc2VhcmNoIGlu
ZGV4IGZpZWxkIHNob3VsZCBiZSB1cGRhdGVkIHdpdGggaHcgcGVlciBpZAo+Pj4gYW5kIG5vdCBi
eSBBU1QgSGFzaC4gSW5jb3JyZWN0IHNlYXJjaCBpbmRleCBjYXVzZXMgdGhyb3VnaHB1dCAKPj4+
IGRlZ3JhZGF0aW9uCj4+PiBpbiBhbGwgdGhlIHBsYXRmb3Jtcy4gc28gdXBkYXRlZCB0aGUgc2Vh
cmNoIGluZGV4IGZpZWxkIHdpdGggaHcgcGVlciAKPj4+IGlkLAo+Pj4gd2hpY2ggaXMgYSBjb21t
b24gY2hhbmdlIGFwcGxpY2FibGUgZm9yIGFsbCB0aGUgcGxhdGZvcm1zLgo+Pj4KPj4+IFRlc3Rl
ZC1vbjogSVBRODA3NCBodzIuMCBBSEIgV0xBTi5ISy4yLjQuMC4xLTAxNDkyLVFDQUhLU1dQTF9T
SUxJQ09OWi0xCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMWsvcGVlci5jIAo+Pj4gYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3BlZXIu
Ywo+Pj4gaW5kZXggYjY5ZTdlYi4uZjQ5YWJlZmEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTFrL3BlZXIuYwo+Pj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDExay9wZWVyLmMKPj4+Cj4+PiBAQCAtMzA5LDcgKzMxMCwxMSBAQCBpbnQgYXRo
MTFrX3BlZXJfY3JlYXRlKHN0cnVjdCBhdGgxMWsgKmFyLCAKPj4+IHN0cnVjdCBhdGgxMWtfdmlm
ICphcnZpZiwKPj4+IMKgwqDCoMKgwqDCoMKgIHBlZXItPnBkZXZfaWR4ID0gYXItPnBkZXZfaWR4
Owo+Pj4gwqDCoMKgwqDCoCBwZWVyLT5zdGEgPSBzdGE7Cj4+PiAtwqDCoMKgIGFydmlmLT5hc3Rf
aGFzaCA9IHBlZXItPmFzdF9oYXNoOwo+Pj4gKwo+Pj4gK8KgwqDCoCBpZiAoYXJ2aWYtPnZpZi0+
dHlwZSA9PSBOTDgwMjExX0lGVFlQRV9TVEFUSU9OKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgYXJ2
aWYtPmFzdF9oYXNoID0gcGVlci0+YXN0X2hhc2g7Cj4+PiArwqDCoMKgwqDCoMKgwqAgYXJ2aWYt
PmFzdF9pZHggPSBwZWVyLT5od19wZWVyX2lkOwo+Pj4gK8KgwqDCoCB9Cj4+Cj4+IEhvdyBhYm91
dCBub24gU1RBVElPTiB0eXBlPwo+Pgo+Cj4gbm8gbmVlZCBvZiBjb25maWd1cmluZyB0aGUgYXN0
X2lkeCwgYXN0X2hhc2ggZmllbGQgZm9yIG5vbiBzdGF0aW9uIAo+IHR5cGUuIEl0cyByZWNvbW1l
bmRlZCBieSBIVy9GVyB0ZWFtLgo+CkNhbiB5b3UgYWRkIHRoaXMgY29tbWVudCBpbiBjb21taXQg
bWVzc2FnZT8KCkFsc28gY291bGQgeW91IGluY2x1ZGUgdGhlIGFuc3dlciB0byAid2hhdCBjb25k
aXRpb25zIHlvdSBvYnNlcnZlZCB0aGUKdGhyb3VnaHB1dCBkZWdyYWRhdGlvbj8iIGluIGNvbW1p
dCBtZXNzYWdlIHRvbz8KCgpUaGFua3MsCgpQZXRlcgoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0
CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
