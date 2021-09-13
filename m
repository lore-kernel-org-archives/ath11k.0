Return-Path: <SRS0=KMo3=OD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58A7C433EF
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 22:38:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9AD960EC0
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 22:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9AD960EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvFY88+ayFAqx2PetrJ978gSqhLcwcNKVH/b9Z3XquI=; b=cze0rlICNo8OYG/ZRMPK3l6OwH
	ZoXYCRyqwHl4sgckKc75a//2IqcNwTEdi/AKhsKV6wlKXpxDfzXwwU90oib1am532Q9Yhnrzm0u46
	0TN97rRVHg7qVEoITYTp4Qs45vTpa4/4DX+0mNAD8xaT1xEPCaWqEtJjfJTsn3NuzLZCkROtXUDJw
	DnQnOJnj8XPcBIL6VTU1nvHEzw6ycbnmnoJv44dMQWCfpj6/JEbsSp39YeV88VYdVPWOQHeuMy7cq
	PKj5Qu+qcdR7qtKxltF26x6BvXvLAJueb8f/NDC40P02VbzyyhkxjtPj+rkdD/uPS/TxZdqn25I1w
	pJmvhR/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPuak-003S6z-Gm; Mon, 13 Sep 2021 22:38:22 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPuag-003S59-Rw
 for ath11k@lists.infradead.org; Mon, 13 Sep 2021 22:38:20 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 q11-20020a9d4b0b000000b0051acbdb2869so15581149otf.2
 for <ath11k@lists.infradead.org>; Mon, 13 Sep 2021 15:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=aOPaxnI6A5tpQcqC0wbRk7yjfq4S2ZS3ZZKpgwCQYUE=;
 b=SBe4NwHKCDPC9icGG5YGMhSLu3SzoKDnqmASyKfuqHsm5DvoIGpoTXds4Rw/IqEkBv
 ZtkRPzkrzxkdV4F1SBbsY72euSNbHMfB95ZH9xUnHXQKYW8CaxmCIXtitpr0R5LX7mwZ
 gvLUpSNdcnS6FIYV7qybQl1WfrSkG3ni36xN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=aOPaxnI6A5tpQcqC0wbRk7yjfq4S2ZS3ZZKpgwCQYUE=;
 b=z89jRaPty6/YH7D1oYg0ULjSY8J5zC/06sOEAFDJSgxqb1T+GZ5P2HeX5JhyLM7CR+
 tFtZ2Ix+EsO4n4K45rqi5fa+Z2Z67mTLSR+BmArTK2A3E/l6ZdZmeq1r9B7A2bhmQxvc
 6RhavGeKArp+yOXKI1FneW4HhvJ5Zsyj6jbEcfw/8QYeojenQ4nW9PYe1AN1+izrzpRH
 y2XAJ6kHyXgGfPrbIPwrUkaJzHM0/82QGvB0DvYTN9Bo5y2HAOsK/oNnXojFf6gMQgxU
 BxWmmjM9KY3MHcesV1kV2JdavVNBA3ZHTlvdZLR0r0CIKWr9rUR/a68j1vRwZSud/JaU
 2Kkw==
X-Gm-Message-State: AOAM5337jya4FV2yLCAJ2v+JwLomt0tNrMrckdWKqlS7ECvgPRNIsvi6
 +TVx7FEJuFhM/5FdhRuKaDN8Mg==
X-Google-Smtp-Source: ABdhPJzDM+jWZqumuY441+jgmfU8S0e0CJ+CcHwwzDZIfwPRjn3Ah9rl0cG53lzl4thRrzt+3P5giA==
X-Received: by 2002:a9d:610d:: with SMTP id i13mr11657871otj.378.1631572696961; 
 Mon, 13 Sep 2021 15:38:16 -0700 (PDT)
Received: from ?IPv6:2600:1700:38c5:675f:a482:d150:1965:8294?
 ([2600:1700:38c5:675f:a482:d150:1965:8294])
 by smtp.gmail.com with ESMTPSA id c24sm2200531otf.71.2021.09.13.15.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 15:38:16 -0700 (PDT)
Subject: Re: [PATCH 1/5] ath11k: Change DMA_FROM_DEVICE to DMA_TO_DEVICE when
 map reinjected packets
To: Jouni Malinen <jouni@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>
References: <20210913180246.193388-1-jouni@codeaurora.org>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <e0bae69d-d667-0eba-320a-b40bdfff31bb@eero.com>
Date: Mon, 13 Sep 2021 15:38:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913180246.193388-1-jouni@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_153818_960932_CA5E52F0 
X-CRM114-Status: GOOD (  11.33  )
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

Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvZHBfcnguYyBi
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvZHBfcnguYwo+IGluZGV4IDkwZGE1NjMx
NmU3ZS4uMGMyN2VlYWQzZTAyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0
aC9hdGgxMWsvZHBfcnguYwo+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsv
ZHBfcnguYwo+IEBAIC0zNDM0LDcgKzM0MzQsNyBAQCBzdGF0aWMgaW50IGF0aDExa19kcF9yeF9o
X2RlZnJhZ19yZW9fcmVpbmplY3Qoc3RydWN0IGF0aDExayAqYXIsIHN0cnVjdCBkcF9yeF90aQo+
ICAgCj4gICAJcGFkZHIgPSBkbWFfbWFwX3NpbmdsZShhYi0+ZGV2LCBkZWZyYWdfc2tiLT5kYXRh
LAo+ICAgCQkJICAgICAgIGRlZnJhZ19za2ItPmxlbiArIHNrYl90YWlscm9vbShkZWZyYWdfc2ti
KSwKPiAtCQkJICAgICAgIERNQV9GUk9NX0RFVklDRSk7Cj4gKwkJCSAgICAgICBETUFfVE9fREVW
SUNFKTsKPiAgIAlpZiAoZG1hX21hcHBpbmdfZXJyb3IoYWItPmRldiwgcGFkZHIpKQo+ICAgCQly
ZXR1cm4gLUVOT01FTTsKPiAgIAoKTmVlZCB0byB1cGRhdGUgdGhpcyBsaW5lIHRvbz8KCmVycl91
bm1hcF9kbWE6CiDCoMKgwqAgZG1hX3VubWFwX3NpbmdsZShhYi0+ZGV2LCBwYWRkciwgZGVmcmFn
X3NrYi0+bGVuICsgCnNrYl90YWlscm9vbShkZWZyYWdfc2tiKSwKIMKgwqDCoCDCoMKgwqAgwqDC
oMKgIMKgRE1BX0ZST01fREVWSUNFKTsKCgpUaGFua3MsCgpQZXRlcgoKCi0tIAphdGgxMWsgbWFp
bGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
