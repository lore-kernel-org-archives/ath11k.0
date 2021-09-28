Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32984C433EF
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 06:56:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0485760EE2
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 06:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0485760EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TtS7fgLX7MUrOzceCqfjKwIfHAYTITecqa+2QxCcn/U=; b=mHDQsdrLK/JDCd
	H5UWmvwM1c0g0vlDhpm0EtR4/bZMh1u/Gwp9pxEu+FsiKrsf2bJuJB48AqBT/tnaTnSr2XNcX6rN7
	B5l+PbU5mKt1GzENz2EALlDLL2E0yBIaBKKqOuZ3q34s3EZrckYgRQzBS6l2bcuGD8QU7WSTCZlyj
	XVrti0kjGJfUJIjtk1h24Js48fK4ohD3kUnH3l8Kl2XwQnHLnfYtL4U7jnEkvWO26ObpvWPk6CKX2
	FtP72CSNGZcOMd6ziZU/K4gsF/b9dAp+t0G6SjJ5qjR2bhhqKxDXe2QYX64seYeO3H+ycnu0O/tOn
	sL4OVE2390/YGDSJc3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV72l-005vSQ-Sk; Tue, 28 Sep 2021 06:56:47 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV72e-005vNE-CX
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 06:56:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632812205; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=iSoNn9rVBBCwIwnakNyJsEuzM1QdDkG7wWg95OqmLuo=;
 b=locEoOc/azBUle9CkF0LK98CIL6GeH45uy3CGyYBfWLWo7qyziCBqE5N0GVOXRKd/ii0hRpI
 i5FcpM075wJdplIYvp4zsA7DrE1DVbrIF8o94wDkkW1WDsxtmMljxpoUBvxf+l9ATiyWOByR
 K2towOkrxNZhpJMdPATqaRPmiKs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6152bc969ffb4131494eaf6c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 06:56:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 79258C43460; Tue, 28 Sep 2021 06:56:21 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D567FC4338F;
 Tue, 28 Sep 2021 06:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D567FC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: akolli@codeaurora.org
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/3] ath11k: add htt cmd to enable full monitor mode
References: <20210721171905.61838-1-jouni@codeaurora.org>
 <20210721171905.61838-2-jouni@codeaurora.org>
 <87tuiaryhk.fsf@codeaurora.org>
 <f01c7797e7072687ab6014ccba431eb9@codeaurora.org>
Date: Tue, 28 Sep 2021 09:56:13 +0300
In-Reply-To: <f01c7797e7072687ab6014ccba431eb9@codeaurora.org> (akolli's
 message of "Mon, 27 Sep 2021 09:49:45 +0530")
Message-ID: <87sfxpqjci.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_235645_246979_D963EB52 
X-CRM114-Status: GOOD (  15.55  )
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

akolli@codeaurora.org writes:

> On 2021-09-24 17:12, Kalle Valo wrote:
>> Jouni Malinen <jouni@codeaurora.org> writes:
>>
>>> From: Anilkumar Kolli <akolli@codeaurora.org>
>>>
>>> Add a new hw_param full_monitor_mode to enable full monitor support
>>> for
>>> QCN9074. HTT_H2T_MSG_TYPE_RX_FULL_MONITOR_MODE cmd is sent to the
>>> firmware to enable the full monitor mode.
>>
>> Nowhere it's explained what "full monitor mode" means from an user's
>> point of view. Can someone give a high level summary what advantages
>> this feature has? For example, more frames delivered to user space or
>> what?
>
> Yes, more frames delivered with full monitor mode. The advantage with
> full monitor mode is, hardware has status buffers available for all
> the MPDUs in mon_dst_ring. Both status buffer and MPDUs from
> mon_dst_ring is used to build the frame.

Users, and developers outside of the wireless domain, have no clue what
"MPDUs in mon_dst_ring" means, just as an example. Can you give a higher
level summary of this feature and what benefit it brings, please? I'll
then add that to the commit log.

For example, what kind of frames are we now able to deliver to the user
space (which we before couldn't) and are there still some types of
frames which we are not delivering?

In other words, instead of technical low level jargon I'm looking for a
summary in plain english which is understandable by everyone.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
