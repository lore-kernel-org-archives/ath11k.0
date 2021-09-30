Return-Path: <SRS0=03FT=OU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B691C433F5
	for <ath11k@archiver.kernel.org>; Thu, 30 Sep 2021 06:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A13615E1
	for <ath11k@archiver.kernel.org>; Thu, 30 Sep 2021 06:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15A13615E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2NYcEtbTQLhTudJ6TDFDHZo7NuJ+osUkSgh0He46Cg=; b=PmznqwAzVUwlX33dAt5/hKHP/D
	IYgmDtdXonpwyghjSRVqL7ybX2WKQQs8lq2fqpMb1HVn/irEdXMfjUE7pls2WsCl/oiYuY4znSTJg
	waAlwetuxLpT43smBVBCC2fnz3F6D363zhE+1fz+6cQqX/B7CZlXlREVt2caDS2nU/zAA1Sxfzzed
	VMGpcoWb/l5NIpXXuKkG+byytSdk4IelcxK/rhXkI1jl6BoCx36Q+z/t07L73yGHQ8Y4zZH7w3Ooo
	/3vu1jk16Hm+SlaulKXIxJaYdd9DycJ/Kn22s1s/GzV5icYgtaJLngc0KbzhVBL4U2rJIdZcPOG2M
	S1HwU1Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVprT-00D6PN-Rd; Thu, 30 Sep 2021 06:48:07 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVprQ-00D6Ox-0B
 for ath11k@lists.infradead.org; Thu, 30 Sep 2021 06:48:06 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632984485; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UdtFKohGY9GDd/sV+AtOBOv4obD/FjRb2InDBqRodek=;
 b=DJ1K7jYjXLCFrMZYdR0TiiFfeOJxiuGj4B3QZKXOAaZ38tTIcYArZo3lNeBGprHVeyGF1zjl
 G4PzmVxOa7/04biENfXkWsio0wydPE5dCnTzy+8IPVcAvMHOPjEaalRTOOOuehdNZsDHNOP2
 IOIwFiTxW3CiPUz11mU8VxXhWM4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61555d99713d5d6f9601b1d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Sep 2021 06:47:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6EC91C43460; Thu, 30 Sep 2021 06:47:52 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1316DC4338F;
 Thu, 30 Sep 2021 06:47:51 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 30 Sep 2021 12:17:51 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/3] ath11k: add htt cmd to enable full monitor mode
In-Reply-To: <87sfxpqjci.fsf@codeaurora.org>
References: <20210721171905.61838-1-jouni@codeaurora.org>
 <20210721171905.61838-2-jouni@codeaurora.org>
 <87tuiaryhk.fsf@codeaurora.org>
 <f01c7797e7072687ab6014ccba431eb9@codeaurora.org>
 <87sfxpqjci.fsf@codeaurora.org>
Message-ID: <190d91d77d24c708291111710d4667b0@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_234805_583685_4A3A56C4 
X-CRM114-Status: GOOD (  18.57  )
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

On 2021-09-28 12:26, Kalle Valo wrote:
> akolli@codeaurora.org writes:
> 
>> On 2021-09-24 17:12, Kalle Valo wrote:
>>> Jouni Malinen <jouni@codeaurora.org> writes:
>>> 
>>>> From: Anilkumar Kolli <akolli@codeaurora.org>
>>>> 
>>>> Add a new hw_param full_monitor_mode to enable full monitor support
>>>> for
>>>> QCN9074. HTT_H2T_MSG_TYPE_RX_FULL_MONITOR_MODE cmd is sent to the
>>>> firmware to enable the full monitor mode.
>>> 
>>> Nowhere it's explained what "full monitor mode" means from an user's
>>> point of view. Can someone give a high level summary what advantages
>>> this feature has? For example, more frames delivered to user space or
>>> what?
>> 
>> Yes, more frames delivered with full monitor mode. The advantage with
>> full monitor mode is, hardware has status buffers available for all
>> the MPDUs in mon_dst_ring. Both status buffer and MPDUs from
>> mon_dst_ring is used to build the frame.
> 
> Users, and developers outside of the wireless domain, have no clue what
> "MPDUs in mon_dst_ring" means, just as an example. Can you give a 
> higher
> level summary of this feature and what benefit it brings, please? I'll
> then add that to the commit log.
> 
> For example, what kind of frames are we now able to deliver to the user
> space (which we before couldn't) and are there still some types of
> frames which we are not delivering?
> 
> In other words, instead of technical low level jargon I'm looking for a
> summary in plain english which is understandable by everyone.

Full monitor mode is hardware enhancement for QCN9074. With this more 
frames are delivered to mac80211.

In earlier hardware like IPQ8074, on each interrupt, reap complete 
monitor status ring.
For each PPDU_DONE status, reap monitor destination ring, this needs 
more processing on driver.

With full monitor, on Interrupt, there is no need to reap the complete 
monitor status ring.
Instead only one PPDU is reap from monitor destination ring and 
corresponding PPDU status is reaped.

In older approach, in noisy environments status buffers are missing for 
few PPDU, even in that case
Host reaps monitor destination ring, which is not needed and these 
frames are dropped.

In full monitor mode, for all MPDUs in a PPDU, status is guaranteed, 
this is achieved in hardware using lock-stepping.
So more frames delivered to mac80211 and more fames seen in sniffer. "

- Anil.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
