Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDD8C433F5
	for <ath11k@archiver.kernel.org>; Wed, 16 Mar 2022 10:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AW1JWAXFAAe0KTA03ng1A9M2HGyLLh4xwQ6v6ZqBzSU=; b=mnn3A1I3rXyLZk
	K6iaxE9/scGC+WFDBDCqzzPldvtHyVkckKeOYrcmjthGPU+VL4c2wPodagse1Y1voZ6AK70lPHZPA
	2bybdI0cMdMOVg5GBFDb2GMmlBaNi0PCUJhALfJOwqk01aBtMN4Hg2+JnDhVOGHHLnyJ5CCnLmJzd
	l+sp7c34Ep6RE4g3kXiZP5Bqsh0Fok5sKVZHg9cZOxFWCU/lrd6VIaatX2kP9QpZXakoZl6TKdj7H
	1Q1YRdaBSPprRpu4jMi3k1qMdp6JBLx/kVWRBnriO9+wrT/60VGeVaSVVRnKemK6c4PAqoRd4hHFQ
	ty1uLz7ENDWqJqPdgkRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUR81-00CVyr-HA; Wed, 16 Mar 2022 10:43:41 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUR7y-00CVws-Ew
 for ath11k@lists.infradead.org; Wed, 16 Mar 2022 10:43:39 +0000
Received: by mail-ed1-x534.google.com with SMTP id h1so2154515edj.1
 for <ath11k@lists.infradead.org>; Wed, 16 Mar 2022 03:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BvWV3OKRPLrOR+4WWPxXiUIc8WeUJWgTBPBrNnDPh7o=;
 b=DYMg/VRIR9RfBYXzg/VJlJNBgjBzzKkyW6kmnabz6oRQ+c4yNo4jfwgtE9g1Pb6hdj
 v5Z+0b3Q36IyI26NrtS1YayUxT0yAeQ61lDIiivZjhTLRwFrP1xoCgOX2Fit9eDuzHRs
 InjK8yo7UACSv17V27BFouussBbjztqDmIKoG1oqrXIaD/EJAiwmi5A7LfkDuAitXgpV
 4ZjECtG1ZJo38hx3+gseFhIS1006jHmdEWCGW5StGcRsPjSSJNCTPJILWgGbgOxzaKg9
 CGFYWrqVMTiD3Kv+DXeNYrJCIhWdPH7oyDpreeEIJ1/AXMsBjW9tps5FfZpPY2WHjs6F
 RG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BvWV3OKRPLrOR+4WWPxXiUIc8WeUJWgTBPBrNnDPh7o=;
 b=nkudFdrhMkZC6mvZsQ1+ghLCBjD6kva5gmZ7i2i67uXs7PkJsmAJDAuDLtpaOy3Rw9
 RPzqpRaRrkIeJr5YqlIAO4iApRoq0cKd8PjPKWQsDwNt1rGupPjO7Ym3lxNRk0nYMFTu
 I4IGn09pGIS6P5l4458+J6TkPZw5EbKNrVa+y6KL6PWfaMvqWhsCcz9zSIXqnKtGSHTe
 +dv6tDEoz54xPQwySEWqCCg85BlKCN79fxz24L43RqAVzLRWGVXTch+NpBszGfic6iyC
 DpS00hKsMUzgLk+wsWk4AQTsa/cSOJrCW2uPGb1yxdQtSGjpXEsUqgJAEuQ4RmUTMPKi
 5fFQ==
X-Gm-Message-State: AOAM530XaqxhhRr0iJWlR1+JxdrUrzpTjVBB8AQ+n7pEN9lhVuiK/s14
 eNT/tgjNBVMKr5bcHCkRegWTKYLaVEr+mA==
X-Google-Smtp-Source: ABdhPJz90mINuRQyoT8W7/g+d52sHUS5cZwmj1ONf/XRnQXu7VeK2imn9CxTDdWBltaDsPQeazCXyg==
X-Received: by 2002:a05:6402:386:b0:415:ead8:ced with SMTP id
 o6-20020a056402038600b00415ead80cedmr29576796edv.407.1647427414223; 
 Wed, 16 Mar 2022 03:43:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:cc83:eef0:f2b6:6987:9238:41ca?
 (ptr-dtfv0poj8u7zblqwbt6.18120a2.ip6.access.telenet.be.
 [2a02:1811:cc83:eef0:f2b6:6987:9238:41ca])
 by smtp.gmail.com with ESMTPSA id
 bw26-20020a170906c1da00b006c8aeca8febsm724642ejb.47.2022.03.16.03.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 03:43:33 -0700 (PDT)
Message-ID: <c0874b06-116d-7471-3b50-21099c729c3d@gmail.com>
Date: Wed, 16 Mar 2022 11:43:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] ath11k: acquire ab->base_lock in unassign when finding
 the peer by addr
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Carl Huang <cjhuang@codeaurora.org>
References: <20220314215253.92658-1-dossche.niels@gmail.com>
 <87o826pgqr.fsf@kernel.org>
From: Niels Dossche <dossche.niels@gmail.com>
In-Reply-To: <87o826pgqr.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_034338_535080_2D35562F 
X-CRM114-Status: GOOD (  12.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 3/16/22 07:13, Kalle Valo wrote:
> Niels Dossche <dossche.niels@gmail.com> writes:
> 
>> ath11k_peer_find_by_addr states via lockdep that ab->base_lock must be
>> held when calling that function in order to protect the list. All
>> callers except ath11k_mac_op_unassign_vif_chanctx have that lock
>> acquired when calling ath11k_peer_find_by_addr. That lock is also not
>> transitively held by a path towards ath11k_mac_op_unassign_vif_chanctx.
>> The solution is to acquire the lock when calling
>> ath11k_peer_find_by_addr inside ath11k_mac_op_unassign_vif_chanctx.
>>
>> Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
>> Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
> 
> On what hardware and firmware version did you test this?
> 

Hi Kalle

Thanks for your reply.
I am currently working on a static analyser to detect missing locks.
This was a reported case. I manually verified the report by looking
at the code, so that I do not send wrong information or patches.
After concluding that this seems to be a true positive, I created this patch.
However, as I do not in fact have this particular hardware, I was unable to test it.

Thanks

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
