Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34771C10DC3
	for <ath11k@archiver.kernel.org>; Tue,  5 Dec 2023 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8ebzcMcZayI4A5Oq6WllcYHipTm1e/Logd22qjVG4w=; b=Tnqi4CjPf3+1hm2B4ryZXW/9NO
	e5tyusxa1PfYPr3/MDk9ZR6dbooBTeR6YcqLwYG+BZPBjvT1qnJpNxnPhYJJulmzyUc+4H4vybcY2
	cEPUSpIl/eJqFwlZ7ZN/8n7x5XlekURMYMYlHN66VaubXv60h1br7HIVrfPIPqmIpBTIC5AxQGmQt
	NSIrd9vCWp4gYy604OCy1mI4BAoGlesNppMXTNv9nKUXKU+g7tVCCoDkSwB7REUGDCABx9MipAnYP
	F5pvs1n1w7Ls+cxSigMJhukX1tCihn9hYx5NJVJ24E4XaYqu43a5GDfGhSk4kczF4I0cObifQyH5Y
	hs32fjuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAYWA-007tzY-1Z;
	Tue, 05 Dec 2023 16:43:30 +0000
Received: from smtp-42aa.mail.infomaniak.ch ([2001:1600:4:17::42aa])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAYW5-007twB-2e
	for ath11k@lists.infradead.org;
	Tue, 05 Dec 2023 16:43:28 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Sl5vG1DsPzMq3T8;
	Tue,  5 Dec 2023 16:43:22 +0000 (UTC)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Sl5vF634lzMpp9t;
	Tue,  5 Dec 2023 17:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ik.me; s=20200325;
	t=1701794602; bh=yff8Rp4hYYJKnC7G7dv6eE1tsniyzhUfvP76W3KRSdo=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=E8Aaq+V/1lT1NBMZtBuuA9VHBLNHwrbXcL0EHyokEwWtKLMcKCAcnxOHHYWbl2aQH
	 aKD5isTXl1LHWRk35qlaONFZR+mFtVEf4tXlKwl/BfVXTDbZTFXef8flllI6HJv0cN
	 JciAd5LC2qBcAbhKhrndLc9PmY1WgBq44tc9TjBg=
Subject: Re: bizarre network problem on kernel 6.6.4
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
References: <39e47336-79f6-5465-7768-a405e2ee3b0a@ik.me>
 <87zfyoq25t.fsf@kernel.org>
From: Fourhundred Thecat <400thecat@ik.me>
Message-ID: <3730972c-15fd-04ea-8335-16518bea56e3@ik.me>
Date: Tue, 5 Dec 2023 17:43:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87zfyoq25t.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_084326_560017_2CE72609 
X-CRM114-Status: GOOD (  14.94  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 05/12/2023 13.11, Kalle Valo wrote:
> Fourhundred Thecat <400thecat@ik.me> writes:
> 
>> I have the most bizarre network problem on my laptop that I have ever
>> seen, and I don't even know where to start:
>>
>> This is lenovo T14s Gen 4, using qualcomm driver ath11k_pci
>>
>> Previously I was using kernel 6.6.1 and wireless network was working fine.
>>
>> Now I compiled kernel 6.6.4 with identical config, and when I boot it,
>> wireless network does not work:
> 
> Did you verify that booting back to 6.6.1 fixes the problem? That would
> rule out that this isn't due to some external reasons (user space or
> network)
> 
> If you can verify that 6.6.1 always works and 6.6.4 always fails I would
> just try to git bisect the issue. It shouldn't take too long.

yes. I verified multiple times that 6.6.1 works, and 6.6.4 has this problem.

I am not really familiar with git bisect, and I am also not a kernel
developer.

But I tried checking out linux kernel git repository, switched to tag
6.6. and looked inside drivers/net/wireless/ath/ath11k trying to spot
any change. But git log shows last change on 2023-08-30, whereas kernel
6.6.4 was released few days ago




