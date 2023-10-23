Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33396C001E0
	for <ath11k@archiver.kernel.org>; Mon, 23 Oct 2023 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/Qpls+u/Yr9uFr+GnC6W7ZkHDGEyFRfC4T1flIqrII=; b=vyiAe+9cy/refh
	J/ODlBATqeyI3gq9KHRVIgyTADOnAj1g4fZ3GLu+nMcSKdJ9NGZkk33udM4jmf1uyrHX3wEN3+6Ae
	1NpuBEzKSfTYZj6qW68QnUNta1LjmSLYB171bMKUejUpmashKQnaCUzrJ58omgch2imDbHasLQelv
	32hjVRIMTQacGoDhZGnUk9UcQMtSyQiYWgbXBZWF2ExSTcN7k7EpFoT//rUxShaH1uSw2fO1BRIRr
	6ZPQ6n8lpiUePyc0u1PzjObECXX4SjnC9xe8jwqNYP884o1T590pAwk4j6Y5AjIWMZ4md/+E0Qi44
	W1ZuLZfp4uEQ49b45u0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quxtZ-007qUT-1O;
	Mon, 23 Oct 2023 16:35:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quxtW-007qU0-1Q
	for ath11k@lists.infradead.org;
	Mon, 23 Oct 2023 16:35:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id BD39FB81F5A;
	Mon, 23 Oct 2023 16:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E69C433C9;
	Mon, 23 Oct 2023 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698078908;
	bh=z/DCLi0DVxRZGKD8QbwXTy5kBGxr+cf0zVmfbB8Cf00=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=MN8kT2OGJCGjAegt9/YWxHxzuWvY/ZkWSHBmKUruxyR3MCg9VM8RHc247Izsje3GF
	 Dcci5idXEMyAOL4/hs+4FnTT3Z3tZMtiImArX07ANu1J/22xJusH5NCBNWS3ESOBUR
	 VZifRPtCC6vYIk6NjX+pfEKKYxX5c94i/s+OgYnuPuJsijRM3tNLDfbWVd8ju6vHFl
	 Hi9dqOCBQEcpuWEHaZ+NK+7FbFWxXIUu4q7OpbKP63EavcSGpqinNWYc8iMa43E6z8
	 65kGZPdwB0j7eI5uqXig7kZACAfPRRNqMgqc0pPnaImDIC5N4LJQr4Ts9Y6IU2yRSn
	 WhWw094PpQcjQ==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath11k@lists.infradead.org>
Subject: Re: ath11k: QCA6390 hw2.0: firmware crashing on ath.git master branch
References: <87edhu3550.fsf@kernel.org> <87o7gpz9ti.fsf@kernel.org>
	<7fe2972e-81fd-551e-4b61-ea804c60b0fd@quicinc.com>
Date: Mon, 23 Oct 2023 19:35:05 +0300
In-Reply-To: <7fe2972e-81fd-551e-4b61-ea804c60b0fd@quicinc.com> (Aloka Dixit's
	message of "Mon, 23 Oct 2023 08:18:23 -0700")
Message-ID: <87a5s9z492.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_093510_624914_CCB09168 
X-CRM114-Status: GOOD (  14.83  )
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

> On 10/23/2023 7:34 AM, Kalle Valo wrote:
>
>> + aloka
>> Kalle Valo <kvalo@kernel.org> writes:
>> I found a reliable way to reproduce the firmware crash. I connect to
>> my
>> home network, then do 'sudo service connman stop' and boom, the firmware
>> has crashed. I suspect it has nothing to do with connman, most likely a
>> simple disconnect will suffice but I didn't bother to test that.
>> I did a git bisect and it points to Aloka's recent commit. Luckily
>> the
>> commit is only in ath-next so far and not in any release. My plan is to
>> submit a revert by tomorrow so that we get this fixed before pulling
>> ath-next into wireless-next.
>> e149353e6562f3e3246f75dfc4cca6a0cc5b4efc
>> commit e149353e6562f3e3246f75dfc4cca6a0cc5b4efc
>> Author:     Aloka Dixit <quic_alokad@quicinc.com>
>> AuthorDate: Mon Oct 9 10:13:54 2023 +0300
>> Commit:     Kalle Valo <quic_kvalo@quicinc.com>
>> CommitDate: Tue Oct 10 10:23:02 2023 +0300
>>      wifi: ath11k: call ath11k_mac_fils_discovery() without
>> condition
>> 
>
> Oh, I'm so sorry about that.

No worries, this is why we do testing :)

Once again this proves why eating your own dog food is so important[1].

> Please revert the commit, I will check what is happening and get back.
> You haven't faced this issue with the same change in ath12k right?

My ath12k testing is still quite limited. I also didn't see this on my
ath11k test box with WCN6855 but I haven't investigated this in detail.
So far I have only seen this with QCA6390.

[1] https://en.wikipedia.org/wiki/Eating_your_own_dog_food

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
