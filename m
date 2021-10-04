Return-Path: <SRS0=ILlp=OY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FEEC433EF
	for <ath11k@archiver.kernel.org>; Mon,  4 Oct 2021 04:23:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DAC461184
	for <ath11k@archiver.kernel.org>; Mon,  4 Oct 2021 04:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DAC461184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8XocoXhw3zGReTI8R87wrnjiT0/DxSGEsiYV+pTT7A=; b=TT3mUvETwQNt/cXDXfNBuJ/kGe
	DoTXsr7YDzVPqXGXjgmssPSZ6poraHMZWTLBIO45D3h0hMUIImciDP9iQtT0HicUEaWuRkoROtD7k
	3058HPo8Fmi3zzCxaSk2aWOyAXlM5Pr2taDqIFEtKFdyVBH4KpZd2gq2MFjb4TRerrKprsMciRnjf
	kG87i9lxrzKfaVpaL3S4d/5OVQJBX29ytbAiNFqIVskLYJpy5WiOJxcZj37vkLLCIby+/zx/cXhvq
	bi+aWbFfbM2LyuoOnaqZS0tiyA2EgmKcaOgv10W7l7gIWyGKRMO+fetGRobLUdxmCy34CrNDiYfog
	bgmqQeVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXFVn-0052lO-8H; Mon, 04 Oct 2021 04:23:35 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXFVj-0052kX-UN
 for ath11k@lists.infradead.org; Mon, 04 Oct 2021 04:23:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633321411; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TgM8C0DI9hcG2ezxrSOzrJIHZklp8GdLdGqApBfSTaE=;
 b=ETWi4cCpIrYzlooPg4W+f8Sdo5h479JLvc/o9HnZPCFpAlhNC4V+Y8nsgwNKrYYsnsN13jVw
 mJymDxEeuNxynGokh9L0iOrq5YakUxen/5HjaSM4p9TWJkTobdB9Y7l3ZBFSM/OKD8seSMbr
 3ULtuWTzQGWfz3o8DboDhMztnWA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 615a81b8a5a9bab6e88d2117 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 04:23:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E054FC43616; Mon,  4 Oct 2021 04:23:19 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 05445C4338F;
 Mon,  4 Oct 2021 04:23:18 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 04 Oct 2021 09:53:18 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, akolli=codeaurora.org@codeaurora.org
Subject: Re: [PATCH 1/3] ath11k: add htt cmd to enable full monitor mode
In-Reply-To: <190d91d77d24c708291111710d4667b0@codeaurora.org>
References: <20210721171905.61838-1-jouni@codeaurora.org>
 <20210721171905.61838-2-jouni@codeaurora.org>
 <87tuiaryhk.fsf@codeaurora.org>
 <f01c7797e7072687ab6014ccba431eb9@codeaurora.org>
 <87sfxpqjci.fsf@codeaurora.org>
 <190d91d77d24c708291111710d4667b0@codeaurora.org>
Message-ID: <88d088e700888eb9c97eb5c2984af65f@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_212332_107228_D66EE60B 
X-CRM114-Status: GOOD (  19.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-09-30 12:17, Anilkumar Kolli wrote:
> On 2021-09-28 12:26, Kalle Valo wrote:
>> akolli@codeaurora.org writes:
>> 
>>> On 2021-09-24 17:12, Kalle Valo wrote:
>>>> Jouni Malinen <jouni@codeaurora.org> writes:
>>>> 
>>>>> From: Anilkumar Kolli <akolli@codeaurora.org>
>>>>> 
>>>>> Add a new hw_param full_monitor_mode to enable full monitor support
>>>>> for
>>>>> QCN9074. HTT_H2T_MSG_TYPE_RX_FULL_MONITOR_MODE cmd is sent to the
>>>>> firmware to enable the full monitor mode.
>>>> 
>>>> Nowhere it's explained what "full monitor mode" means from an user's
>>>> point of view. Can someone give a high level summary what advantages
>>>> this feature has? For example, more frames delivered to user space 
>>>> or
>>>> what?
>>> 
>>> Yes, more frames delivered with full monitor mode. The advantage with
>>> full monitor mode is, hardware has status buffers available for all
>>> the MPDUs in mon_dst_ring. Both status buffer and MPDUs from
>>> mon_dst_ring is used to build the frame.
>> 
>> Users, and developers outside of the wireless domain, have no clue 
>> what
>> "MPDUs in mon_dst_ring" means, just as an example. Can you give a 
>> higher
>> level summary of this feature and what benefit it brings, please? I'll
>> then add that to the commit log.
>> 
>> For example, what kind of frames are we now able to deliver to the 
>> user
>> space (which we before couldn't) and are there still some types of
>> frames which we are not delivering?
>> 
>> In other words, instead of technical low level jargon I'm looking for 
>> a
>> summary in plain english which is understandable by everyone.
> 
> Full monitor mode is hardware enhancement for QCN9074. With this more
> frames are delivered to mac80211.
> 
> In earlier hardware like IPQ8074, on each interrupt, reap complete
> monitor status ring.
> For each PPDU_DONE status, reap monitor destination ring, this needs
> more processing on driver.
> 
> With full monitor, on Interrupt, there is no need to reap the complete
> monitor status ring.
> Instead only one PPDU is reap from monitor destination ring and
> corresponding PPDU status is reaped.
> 
> In older approach, in noisy environments status buffers are missing
> for few PPDU, even in that case
> Host reaps monitor destination ring, which is not needed and these
> frames are dropped.
> 

Radiotap header is constructed from monitor status buffer tlvs. Since 
there is
no update of status buffer for few PPDU, complete 80211 frame is not 
formed and
is dropped in ath11k.

> In full monitor mode, for all MPDUs in a PPDU, status is guaranteed,
> this is achieved in hardware using lock-stepping.
> So more frames delivered to mac80211 and more fames seen in sniffer. "
> 


- Anil.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
