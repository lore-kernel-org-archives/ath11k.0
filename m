Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A727C25B6B
	for <ath11k@archiver.kernel.org>; Thu, 26 Oct 2023 12:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WeQ2Zm3nk72WD74dbkWFB8mkTOi9VozRQPSIx7o4OjM=; b=4wl5emLK+7fjrG
	EJtj2WKgkNuS3yoEQxc6JWEz2n54eMyj1QFPFZvZ8nHaiR7R+j3kqjjU/uRMgQ5LrKG36Hv0Mwl8P
	YT5/3CwCi8ERAxs1HvMuQWnJdxXM0dUsauLSC9CnoRbiMks75RdB/+dJCAegtksH0+Lzy7LbZbsrC
	tzxgiHm2KVraT3XzfgpAhDvub/sHeKUgSc1k3a/Ql3891zhXOPzJdDeRdre71/QSqrg3+wAKD+rWW
	MKPjsAzryuTWqi4Z6tELSURuO3ki3SDmF8PKOVki5apw+T9N+Km9tNycvrl7xZsHjfLqsGEPwNlQD
	8+GUz15aGQXAa1WBHuSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvz9r-00EQ4J-2N;
	Thu, 26 Oct 2023 12:08:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvz9o-00EQ3w-1Y
	for ath11k@lists.infradead.org;
	Thu, 26 Oct 2023 12:08:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D8EE6CE3ED9;
	Thu, 26 Oct 2023 12:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80035C433C7;
	Thu, 26 Oct 2023 12:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698322090;
	bh=hTCIw+zfHBywUypFqRFQeoGbNRw5sEwao2sFHwBHQYc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Nx7OP2ZYMAH7BnkcTRH9zH2eYtaCQKIs3uPRFM4ehXx+jsZKN+t2fJjk65Khpm+qY
	 ReYYjGQncxdc2NNKp+fYXI+ghK3qUj5/RIBO66njD+zqWsPUa7tKZruig37FeM1QRq
	 +4c3KIkKfPyAsfoFFpbPwZmyWDjBAA6jijxos53g4XnTqS/yXrEwGsAma1vfKPglm/
	 lVkgapQr3RYoGcoJ27od8BkGP36zEOHNlo7gJtCaBJ2+PO9H3beuHJRgAwrFjYaJMv
	 I74+xYhe1QhXZeo6ESNaqZSN5lyMF5VEjmeIT/gm4X4tBRuDWHVkpEbQLQ89tTrLbT
	 7iXwTROLaeDLg==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath11k@lists.infradead.org>
Subject: Re: ath11k: QCA6390 hw2.0: firmware crashing on ath.git master branch
References: <87edhu3550.fsf@kernel.org> <87o7gpz9ti.fsf@kernel.org>
	<7fe2972e-81fd-551e-4b61-ea804c60b0fd@quicinc.com>
	<87a5s9z492.fsf@kernel.org>
	<680da670-292c-504b-06ca-b2fecda3995b@quicinc.com>
Date: Thu, 26 Oct 2023 15:08:07 +0300
In-Reply-To: <680da670-292c-504b-06ca-b2fecda3995b@quicinc.com> (Aloka Dixit's
	message of "Wed, 25 Oct 2023 15:31:14 -0700")
Message-ID: <87ttqdwpqw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_050812_713484_6BA8FD21 
X-CRM114-Status: GOOD (  15.99  )
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

Aloka Dixit <quic_alokad@quicinc.com> writes:

> On 10/23/2023 9:35 AM, Kalle Valo wrote:
>
>> Aloka Dixit <quic_alokad@quicinc.com> writes:
>> 
>>> On 10/23/2023 7:34 AM, Kalle Valo wrote:
>>>
>>>> + aloka
>>>> Kalle Valo <kvalo@kernel.org> writes:
>>>> I found a reliable way to reproduce the firmware crash. I connect to
>>>> my
>>>> home network, then do 'sudo service connman stop' and boom, the firmware
>>>> has crashed. I suspect it has nothing to do with connman, most likely a
>>>> simple disconnect will suffice but I didn't bother to test that.
>>>> I did a git bisect and it points to Aloka's recent commit. Luckily
>>>> the
>>>> commit is only in ath-next so far and not in any release. My plan is to
>>>> submit a revert by tomorrow so that we get this fixed before pulling
>>>> ath-next into wireless-next.
>>>> e149353e6562f3e3246f75dfc4cca6a0cc5b4efc
>>>> commit e149353e6562f3e3246f75dfc4cca6a0cc5b4efc
>>>> Author:     Aloka Dixit <quic_alokad@quicinc.com>
>>>> AuthorDate: Mon Oct 9 10:13:54 2023 +0300
>>>> Commit:     Kalle Valo <quic_kvalo@quicinc.com>
>>>> CommitDate: Tue Oct 10 10:23:02 2023 +0300
>>>>       wifi: ath11k: call ath11k_mac_fils_discovery() without
>>>> condition
>>>>
>>>
>>> Oh, I'm so sorry about that.
>> No worries, this is why we do testing :)
>> Once again this proves why eating your own dog food is so
>> important[1].
>> 
>>> Please revert the commit, I will check what is happening and get back.
>>> You haven't faced this issue with the same change in ath12k right?
>> My ath12k testing is still quite limited. I also didn't see this on
>> my
>> ath11k test box with WCN6855 but I haven't investigated this in detail.
>> So far I have only seen this with QCA6390.
>> [1] https://en.wikipedia.org/wiki/Eating_your_own_dog_food
>> 
>
> I can send ath12k patch to revert that change as well until I figure
> out why it fails in ath11k. Let me know.

That's a good question, I haven't thought of that. I haven't noticed
anything like this with ath12k so I don't think we need to revert the
ath12k patch. We can revisit this if we notice any problems on ath12k.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
