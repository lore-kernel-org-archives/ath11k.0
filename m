Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA2FECAAA3
	for <ath11k@archiver.kernel.org>; Thu, 25 Aug 2022 21:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bB9kpRKardIAfpPJ9xHfCLFIN5K6s5HNmpj9aHNJEJk=; b=c3bvbWHaFOZBz/
	AF/XpXq4AW8Ln+bCPMvPYUWGLVR/hDvdWxon5M5EcO+3mrEMQeorkqZScphrsCe0bC/a6LrA5yKi6
	arfoWot/jLI0al0WBCCjqGcl2KzrNHKGImV+DXKi5xqI5MgdRPS9DZwQASjm9GXnIEA6OWO27V9WQ
	7Psrhkf+h23gXdEo9t5F/PtSIbU9sS+zbVee4pnYBAxL+fe4VS87IJtj6mIDNCv+ola4lCmbU7+rn
	lGGctPg/16QlVlOzsJ8hLtZK9wF4Z6hZ4d1FJg/yoalnEwnxj8VoH4F5Tf7qgKLKt3aEAiwDNMUaz
	KbyhxOVO956JSBwTH11Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRJz0-003IcD-74; Thu, 25 Aug 2022 21:01:46 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRJyx-003IYm-Tt
	for ath11k@lists.infradead.org; Thu, 25 Aug 2022 21:01:45 +0000
Received: by mail-lf1-x136.google.com with SMTP id z6so29806651lfu.9
        for <ath11k@lists.infradead.org>; Thu, 25 Aug 2022 14:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=rMhaiuia9CmujPaYL9dJRVPvKvvGMSUMUutx6AkpMQw=;
        b=VC0VsqBm6hf9b/XYfHcXBRa0OTcZlYVj3/HjJfn5w7kxJoSsCAYi0wfVeVjxZ9h532
         FWlZn6cFyJIxqPtUckpqB7t1aCWeRGMXRa/FbtxDW8A0Bhqir02pfz65pCNcexH3HZVq
         Ybohht4H4Y0iCRmS+x4RMJcU5SiLFtKrYVrPBs4CQ8RLGtvKbt5Jh9HYHDprldzOnTjW
         PtcEWBK4Z9cBjXZPf4ySpuKtbH1jzDeqDsVmIVpuqXg/gUs/z8qqgKXkKGtdT1fx+fNM
         s9kJABGGCrHoGqO5i6Qgnz/n7JT4ypUjDw/1yzlUjvJ99XvjSOcGUckDJy5GiOnE7s+e
         5ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=rMhaiuia9CmujPaYL9dJRVPvKvvGMSUMUutx6AkpMQw=;
        b=vSNdBdUi5A/DzjnWk5uVnZcGVlNpiBZe4lnQufYO0KxxgTnjswd21xeqUU62Dsp/1w
         KIELU6I0v+9vcJXz4VvgMg5TDk3BP+1Pxr0v5MWJe6r8dzcDitl4/Lg+oeimYlpHnR3A
         M8EKR5Nk9vtBYtgycYfLxoHLI+Hq4gP4Lw/3NOU97hACKKJoYV7rfCL3Pc3003tqaZyZ
         c5+i5i8VBN9yuBQgpUPGUBxsp+SgITsbz7q7g9YJFGuCd9qEVjmPpYJFhg2L4xmt5kv8
         ijvAY91Ca4al9yv3Fi9RF4zrz3D0qC1Tetf9GXL1j1u02cgnq8InOqDM6m4YZjiUo1am
         DqOA==
X-Gm-Message-State: ACgBeo0C5E8HPdQ+Kqoa9Cp7PYjPRzE6UONTEXwP0FTT7z0kYy7R4XRm
	/XLQXf5BOA5P5wHgPaxfNTA=
X-Google-Smtp-Source: AA6agR7NrWMq1nTl/P3ubkLCxRkmdp6ndW+rPAU8dNYG4VEu1Aj07c5m3A15cTGzLM7Eps0c0fI0jg==
X-Received: by 2002:a05:6512:4004:b0:492:c4f2:9451 with SMTP id br4-20020a056512400400b00492c4f29451mr1531844lfb.666.1661461300801;
        Thu, 25 Aug 2022 14:01:40 -0700 (PDT)
Received: from ?IPV6:2a02:2168:88a0:5e00:a4c7:4ba3:4116:3? ([2a02:2168:88a0:5e00:a4c7:4ba3:4116:3])
        by smtp.gmail.com with ESMTPSA id bg26-20020a05651c0b9a00b00261cc85c32fsm87243ljb.31.2022.08.25.14.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 14:01:40 -0700 (PDT)
Message-ID: <ccdb8f94-0879-2c06-5b48-25c2340d1659@gmail.com>
Date: Fri, 26 Aug 2022 00:01:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 0/4] ath11k: Enable low power mode when WLAN is not active
To: "Limonciello, Mario" <mario.limonciello@amd.com>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20220720134959.15688-1-quic_mpubbise@quicinc.com>
 <ad99d238-dc1a-3233-fc6b-0cd49e428903@amd.com>
 <6daefd60-dcbc-06e1-8091-ea225690edf8@amd.com>
 <ecce8764-1760-4617-49aa-c111305ebd55@quicinc.com>
 <7e00cc36-3a07-92e2-c60e-a3c8939b407e@amd.com>
Content-Language: en-US
From: Mark Herbert <mark.herbert42@gmail.com>
In-Reply-To: <7e00cc36-3a07-92e2-c60e-a3c8939b407e@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_140144_029572_A6743F1F 
X-CRM114-Status: UNSURE (   8.12  )
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

Pgo+PiBUaGUgY2hhbmdlcyB0aGF0IEkgaGF2ZSBwb3N0ZWQgd2lsbCBub3Qgd29yayBvbiBvdGhl
ciB0YXJnZXRzIGxpa2UgCj4+IFdDTjY4NTUgYXMgaXMuIEl0IHJlcXVpcmVzIGFkZGl0aW9uYWwg
Y2hhbmdlcyBhbmQgdGhlcmVmb3JlIGxvdHMgb2YgCj4+IHRlc3RpbmcuCj4KCldpbGwgdGhlIGNo
YW5nZXMgYmUgcG9zc2libGUgZm9yIFFDQTYzOTAgYXMgd2VsbD/CoCBDdXJyZW50bHkgdGhpcyBj
aGlwIApvbmx5IGFjdGl2YXRlcyBwb3dlciBzYXZpbmcgbW9kZSB3aGVuIGl0IGlzIGNvbm5lY3Rl
ZCwgYnV0IGJlaGF2ZXMgYmFkbHkgCndoZW4gbm90IGFzc29jaWF0ZWQgdG8gYW55IG5ldHdvcmsu
IFNvIHRoZXJlIGlzIGEgY2hhbmNlIHRoYXQgdGhpcyBraW5kIApvZiBzb2x1dGlvbiB3aWxsIGhl
bHAuCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
