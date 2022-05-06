Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AFEC433EF
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VheaC/pol6BMfgFehKfFj9F2z0B/j/Ujiwetzr9Lbdg=; b=puHT7i/+YHrg/g
	AJdhcDERAIPucfVF2Hw7CO6F0z4zNKlhT7OZugTCRyWCIf1AwTT/8SqYSGKuiuVwQQVK98nmO8+5T
	NNf4UK2MptoBZbpI/YyPnrF66Q4setPQfmphqvj8utXyuYobewGOA7knFIg6ZiMlpfTP5zoNEeNZx
	q0RWPFlIb9wbb9b+Cf2Cjc0DdwOB0QewP3i95o3POc6+gZFn1oxYsbU4UXyBARaiZEdI+hqfdHXs1
	H3+QARpqohsFzPEVCMtNo73lJpB3xZS+2GFHcZWZYPSwsxbrCKn3NoCQB+PIU6MRf4kZZ1vBu6c2F
	JoAzkrZU5KRND8ZzDu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmttL-002GCh-RY; Fri, 06 May 2022 09:04:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmttJ-002GBh-4L
 for ath11k@lists.infradead.org; Fri, 06 May 2022 09:04:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6D6E8B83408;
 Fri,  6 May 2022 09:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF5DC385AF;
 Fri,  6 May 2022 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651827886;
 bh=TXmXKROOQFPUwAMUkpU12yOUshYWNBEx9Vmv7ZV2FKI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=KrgmwXRU2ZhuwhIeFUnMG5fPtci/0KHHUGXjBOFi74Y/55KbpnIO1dSgPs2ctDHuz
 Hsja480c1XH2UYT/o8EP7NOYTVlacDF3ssO3SB6xgW9w5ekLHUp97YQnaLBxNYdrZR
 677tL3aZl4cApDM6WePF5kcshIWTdsIcFh6s/+0S67VO9a3KTfqYHmCwyLIp5mVVZV
 i05H9lRKw9XBN6tkbnUkgNUEabLdQ2d1qX68umEW9/aSO5SIf2vAMtN+MlQCO4rQuA
 tNEMjD+GpsodCyw0fCYSQKW2mx9S49nTrm76FqsL5BKIsU6eZ9DtGwwu8vO5lillmM
 3PzGn+c+DAbLQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/2] ath11k: mac: fix too long line
References: <20220503060415.24499-1-kvalo@kernel.org>
 <f2f27831-03eb-3788-5855-649c0f33c785@quicinc.com>
 <87y1zhalfy.fsf@kernel.org>
 <1615688c-fb7d-261a-7b01-fe47c74b9597@quicinc.com>
Date: Fri, 06 May 2022 12:04:42 +0300
In-Reply-To: <1615688c-fb7d-261a-7b01-fe47c74b9597@quicinc.com> (Jeff
 Johnson's message of "Wed, 4 May 2022 09:30:35 -0700")
Message-ID: <87y1zf821h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_020449_359450_0C4AABB5 
X-CRM114-Status: GOOD (  18.16  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 5/3/2022 10:58 PM, Kalle Valo wrote:
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> pe>> is there a reason to not declare deflink here?
>>> then its scope of definition would equal the scope of usage
>>
>> In ath10k and ath11k I have tried to avoid that and instead declare all
>> variables in the beginning of the function, this is to keep the code
>> simple. Of course there are few cases where a variable is declared in
>> the middle of the function, but that's just sloppy review on my part. I
>> feel that it's better to refactor the function into smaller functions
>> than start declaring variables in the middle of functions. Does that
>> make sense?
>>
>
> This is really an academic question.
>
> In the larger kernel community I'm seeing a push to reduce the scope
> of identifiers in some cases:
> 1) declaring loop control variables within the actual loop control operation
> 2) prohibiting the access to list iterators outside the list iteration loop

Yeah, those are definitely good examples when to limit scope.

And of course this isn't a hard rule, in some cases we have to make
exceptions. For example ath11k_mac_op_bss_info_changed() and
ath11k_mac_op_sta_state() are long functions but trying to split them to
smaller functions most likely makes them harder to read. So for these
functions having variables declared within if blocks would sound like a
good idea, I think it would make the functions more readable.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
