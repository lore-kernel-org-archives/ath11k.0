Return-Path: <SRS0=lr6B=NS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27248C432BE
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 12:47:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D387B60560
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 12:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D387B60560
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hhr6QSglW0etuNB+ebXA3ZyLIt7estS77P7xll3w4N0=; b=ESlDeu/U/KJWQL
	9rjF0vqS8bXrVW43ysAVfgDtdK+g3j3ZR2C6aiG2z/5vyTWvnVJSOP/wsUcA7QZgdfasFu7Ou4EuR
	CtLbjhXldX/21Fhk5Zb/rUhIXrXk/AVH2UwlUKmyZtRG6Xk96yrvJfNe6Fx50TH3Nhc23YxN1h5Z+
	WRENNStmE4Kbo2w+/0knvV8nPK9y5YPWVdB6Bh5e2nS6ZQ9PkcWewinRDy7hf/Hk7FM6LUls9E+9I
	w7oezxbvFmtYAIR1BBjE35qZ9rjrcBJhty+dnlTiw67wL2odrstAUFyqMFge0LUyRziquFzgtZ33C
	Jiw5JkcdfLRtkqMf4vxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJbGE-00CSDS-JF; Fri, 27 Aug 2021 12:47:06 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJbG9-00CSCr-2I
 for ath11k@lists.infradead.org; Fri, 27 Aug 2021 12:47:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630068420; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=uG5FVSn/f9JM1ZVPwji494DZnJkYhEBJ3nhkVaTww/A=;
 b=Do+S8OcdJhKi2rS47WG6guuMQOlwrIgmNTWcskswiT1Yad1axG34TYT8+H+czGiHYyApyjTM
 yRKFNAd2kT3oxyUuAH3WyTfEsQnnqNaqE4T/CxWj1IoJCWN5wBx4c2L3poClzwQU+sNe6mal
 Dn8w6gqtyNFa6HqVWUq/BqRi2Hw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6128dec3d6653df767c76acb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Aug 2021 12:46:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1E51AC4360D; Fri, 27 Aug 2021 12:46:59 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D754C4338F;
 Fri, 27 Aug 2021 12:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4D754C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Wren Turkal <wt@penguintechs.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>,
 Nicolas Schichan <nschichan@freebox.fr>
Subject: Re: [regression] Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org>
 <843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr>
 <87tujgqcth.fsf@codeaurora.org> <87mtp47073.fsf_-_@codeaurora.org>
 <YSenaxWzxRkYkucv@kroah.com>
Date: Fri, 27 Aug 2021 15:46:50 +0300
In-Reply-To: <YSenaxWzxRkYkucv@kroah.com> (Greg Kroah-Hartman's message of
 "Thu, 26 Aug 2021 16:38:35 +0200")
Message-ID: <87k0k75a2t.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_054701_182211_1D2952E5 
X-CRM114-Status: GOOD (  23.54  )
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

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

>> I did some investiation and I suspect that commit ce78ffa3ef16 ("net:
>> really fix the build...")[1] is for handling a conflict between net-next
>> and char-misc-next trees related to Loic's commit 0092a1e3f763 ("bus:
>> mhi: Add inbound buffers allocation flag"). Greg mentions this in a
>> commit[2]:
>> 
>> commit 813272ed5238b37c81e448b302048e8008570121
>> Merge: de0534df9347 36a21d51725a
>> Author:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> 
>>     Merge 5.14-rc5 into char-misc-next
>>     
>>     We need the fixes in here as well, and resolves some merge issues with
>>     the mhi codebase.
>> 
>> If my assumption is correct when I propose that we revert commit
>> ce78ffa3ef16 for v5.14, AFAICS it's not really needed for v5.14 (commit
>> 0092a1e3f763 is in -next, not in Linus' tree yet) and commit
>> ce78ffa3ef16 breaks ath11k. And the conflict between net-next and
>> char-misc-next can be then later fixed during the merge window.
>> 
>> Will this work for everyone? If no objections, I'll submit the revert to
>> Linus later today. We are getting really close to final v5.14 release so
>> not much time left to fix this.
>> 
>> Just to reiterate why the urgency: commit ce78ffa3ef16 broke ath11k in
>> v5.14-rc5, users have reported (and I have confirmed) that at least
>> QCA6390 support is broken but I suspect all Qualcomm Wi-Fi 6 devices
>> supported by ath11k are currently broken.
>
> No objection from me for reverting that, if it fixes the problems you
> are seeing for 5.14-final.

Thanks!

> The goal was for the mhi changes to go through the networking tree in
> the first place, I don't see how this got out of sync.
>
> If this is reverted, some help on how to resolve the merge issues it
> will cause would be appreciated.

Yes, I'll help with this. I see that Stephen already reported the
reappeared merge issue. It's just that I'm not familiar with inner
workings of the MHI subsystem, but I can test code etc.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
