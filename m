Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7E6C25B74
	for <ath11k@archiver.kernel.org>; Tue, 21 May 2024 05:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPEaplQ3alcSR53ZVD7zRu5MawQ6uavqv0srnSdqLpo=; b=uW4u1Z6zI4U7kLr4f049LksY7M
	Z7ItpbI2I4vZDMVLYaodAqthBNNreomdbIDlyu8LFH/Ob0mTP5O4nNy//ZGhh3uXVYvCUbte5wpQ7
	jsdze2zqPvTIqLULbeD50NfM6XVwFR+iLQUprmSQ7MwLvP9TMd8sAqOgqpVUmD6g6cWB4Uy+KJQmn
	nb7osRyhubd+1M9z5shF1KzM8DbJdCVuENlzF6sScwJjN5RqC4XnXpmw4R07jVshzFJgnmxf1WGJy
	kJUte0QWFHygx9vZjA3HYrA28PnP2UnghqQVm4SnHhEv3jisMgGdHphopoaQ86pe85ROEd20gv6QE
	SQY9N6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9HnK-0000000GMQL-0bKV;
	Tue, 21 May 2024 05:12:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9HnH-0000000GMOg-07kk
	for ath11k@lists.infradead.org;
	Tue, 21 May 2024 05:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D1DB2CE0159;
	Tue, 21 May 2024 05:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBF2C2BD11;
	Tue, 21 May 2024 05:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716268328;
	bh=Q2qSgSFB8UjUWqO4soRX61IynMlBYuFv6ez7nS2cXUw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=IzZjeT0qfaxJDdzUz5sSmQwN5xPZ91I5zjgDLcvYICifOQ+Aju783jPmAR0k4SZ1x
	 5dQuYG3nwCpVVEFF6QpNlKEszDGjnG7Dm62e7R5ymJJE5UU5TCtOP7ZwWlH07LgOfc
	 4WwBZR3G2jg3m0qM8EnN5umrigbN8ysDEKAh7IdRvqyQ1Ljpp27VxabUuyHc5+UGYw
	 KSVRRRQJTKdingDYhc3SekvVHDdSux7uB/cvlrc758Uq6cj+GMhJXytok6gNCLqQGS
	 UApivuFPPdX8dAjOPBONp6wko7LLCArfcKvMODpMETPIbfidi8eDPSf2CWC8RLWFxE
	 Z04AokbZ32/fQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  <regressions@lists.linux.dev>
Subject: Re: [PATCH v2] wifi: ath11k: move power type check to ASSOC stage
 when connecting to 6 GHz AP
References: <20240424064019.4847-1-quic_bqiang@quicinc.com>
	<87wmo0k71i.fsf@kernel.org>
	<3dc28f34-45cc-4e14-b9ea-1f7b78a6a591@quicinc.com>
	<87h6esebu8.fsf@kernel.org>
	<b6b23a29-78ef-4e4f-8042-e13833fcb1ec@quicinc.com>
Date: Tue, 21 May 2024 08:12:05 +0300
In-Reply-To: <b6b23a29-78ef-4e4f-8042-e13833fcb1ec@quicinc.com> (Baochen
	Qiang's message of "Tue, 21 May 2024 09:52:06 +0800")
Message-ID: <878r03eoka.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_221211_338143_BD87B1E7 
X-CRM114-Status: UNSURE (   9.38  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 5/20/2024 11:34 PM, Kalle Valo wrote:
>> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>>> On 5/11/2024 5:54 PM, Kalle Valo wrote:
>>>
>>>> Oh, this fell through the cracks. Commit bc8a0fac8677 was introduced in
>>>> v6.9-rc1 so I should have sent this to v6.9 but it's too late now. I'll
>>>> need to queue this for v6.10 via wireless tree.
>>>>
>>>> Adding the regression also to regzbot:
>>>>
>>>> #regzbot introduced: bc8a0fac8677
>>>> #regzbot title: ath11k: connection to 6 GHz AP fails
>>>>
>>> Hi Kalle, with an upcoming patch this regression is expected to be fixed:
>>>
>>> https://lore.kernel.org/all/20240506214536.310434f55f76.I6aca291ee06265e3f63e0f9024ba19a850b53a33@changeid/#t
>>>
>>> So here the ath11k fix would not be needed any more once above patch got merged.
>> 
>> What happens if we apply both patch 'wifi: ath11k: move power type check
>> to ASSOC stage when connecting to 6 GHz AP' and patchset 'wifi:
>> mac80211: build TPE handling'? In other words, do they conflict from
>> functionality point of view?
>
> No functional conflict, 6 GHz AP connection would also succeed with
> both of them applied.

Ok, thanks. In that case I would like take patch 'wifi: ath11k: move
power type check to ASSOC stage when connecting to 6 GHz AP' to
ath-current branch from which it will go to v6.10. Is that ok for
everyone?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

