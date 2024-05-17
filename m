Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D0EC04FFE
	for <ath11k@archiver.kernel.org>; Fri, 17 May 2024 05:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXX/LJNlxb+jNl7xd1nABibEy5mIhJB8CO3KGYEDVOM=; b=EJDRVbCKZ2MZZfuT075JIXgmBN
	sypCQJr1WhGlbxLgYkG77mryg9VYqDzmm5kxBU9XYhZsj2mB7+iAXQ2mGdCR/SOt8XAl6/5P6tN4o
	49AGGpPNg1IAGBfE8qIYnc813BWOquFXsBF358RMvVjtxwhaLO5E/tVAi9pmfoKxKGwkDaJoo9VXC
	bATl1b3ugWDNOD1rnzsc6hJbXnFzQII+w46ozkk2J5ih2pkOZJjXpQY4aAP4sMTe79drdaDfltJi8
	8aFRxL+lV75esBxbPRGFYyYBCB8GddFd2qM6HTZvJ1kVCs3Ist+IuRQr2qnromUeyyBi6+inXzBXZ
	J9YcnANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7q5r-00000006qrs-0n8Q;
	Fri, 17 May 2024 05:25:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7q5m-00000006qqt-24Jt
	for ath11k@lists.infradead.org;
	Fri, 17 May 2024 05:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2223DCE18DA;
	Fri, 17 May 2024 05:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE5DC32781;
	Fri, 17 May 2024 05:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715923506;
	bh=JsSl2F7J/c445ieKgv25hBESUFKNpCr7HFqx+pdPKWI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PXP8l53jSj/nOjJPOhRj152DaY6Ap4MFn4SnQubV5Gj8fmZfN44npd+UAEyMUnykr
	 NN6mDimXQOlJkvcJLA2oE8Pe62n5gPcXnba4X9HzSSKTT0IEj39xd51uQDldooM92N
	 DRWabe5IybEXYu6plWGaQ1RNSyGVxIqTtPoK7sahIe6DKH7sQWjrBNelkPIC3drHge
	 dWBN9JyDpIK1UP+5e+mguh22bKfmfbq/7ATs1XKZRnfR7WKM33kKxKjuTXlD68HD8Z
	 wuYAEDCQZA2EksuyOqMbQVsA5XKOaJeKgzAV7GMtaoAG6HQwN1CX4XS4sO+0PrMWlj
	 T6uWEhgXSlguw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,  Carl
 Huang <quic_cjhuang@quicinc.com>,  Luca Weiss <luca.weiss@fairphone.com>,
  <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/2] wifi: ath11k: supports 2 station interfaces
References: <20230714023801.2621802-1-quic_cjhuang@quicinc.com>
	<20230714023801.2621802-2-quic_cjhuang@quicinc.com>
	<D15TIIDIIESY.D1EKKJLZINMA@fairphone.com> <87jzk2km0g.fsf@kernel.org>
	<93c15c59-f24c-4472-ae7e-969fd1e3bfec@quicinc.com>
	<871q69lqh5.fsf@kernel.org>
	<4e21e556-527f-4d1e-aa29-cacec14155af@quicinc.com>
	<a53e2188-b982-44b7-9dfe-f5dfd6b802ca@leemhuis.info>
	<4d72f74a-b2eb-43d3-92a2-1311081ce72c@quicinc.com>
Date: Fri, 17 May 2024 08:25:03 +0300
In-Reply-To: <4d72f74a-b2eb-43d3-92a2-1311081ce72c@quicinc.com> (Jeff
	Johnson's message of "Thu, 16 May 2024 07:11:31 -0700")
Message-ID: <87fruhggcw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_222519_009468_F87BB886 
X-CRM114-Status: UNSURE (   9.75  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 5/16/2024 4:45 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 11.05.24 05:12, Carl Huang wrote:
>>> I'll send out the formal patch next week.
>> 
>> Hmmm, from here it looks like this did not happen. Did I miss something,
>> is there some reason to reevaluate things again, or did this maybe
>> simply fall through the cracks?
>
> Formal patch is still under internal review

BTW I'm also experimenting with regzbot to help me track regressions in
wireless and to avoid missing important fixes.

Thorsten, I don't know if you take wishes but it would be nice to have
in regzbot some kind of filtering per subsystem or label. Maybe
something like this:

https://linux-regtracking.leemhuis.info/regzbot/mainline/?subsystem=wireless

And then a have command for regzbot setting the subsystem (or a label).
That way I could easily see only the wireless related regressions, now
it's harder to find them from the list.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

