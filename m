Return-Path: <SRS0=w2Qz=OR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A60C433EF
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 04:19:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD92B6113A
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 04:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD92B6113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=708xkxR5JU6ydWMMFRITWg0YxsQ0bhxBAnA7TrrECe8=; b=UVOMWGuwt1bOdxaqzIsQbXUui4
	/sgppsWe5Km0ninmzBZ4l167w44bgP5r06dIU5h82Hfo9ph632GrnjPmFZK11ofhKGnr0GAncTwjQ
	z+bOO+xPYgcXfIaGesi2w6x6Wx2Ak5pPpWWwcK9XtNTq6269AQFWbwiIK8zzHzAx43uxLzR0MV2bq
	JugcfyhQbrqdWa2hu5I3PWiswektJ8zVxVYkf9XOHjCqGFwjHx2XZiSUyNPDuLRqydQJiHCVNzVbI
	22NTDcZJvQjzmb/DRiH3T3M0kfxFfEykEVnVxLz9hfTaZQMHOuSWsHLeyp5uYhyzmKNbNI9493ayI
	MMm0E1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUi7K-001Xb1-74; Mon, 27 Sep 2021 04:19:50 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUi7I-001Xab-6M
 for ath11k@lists.infradead.org; Mon, 27 Sep 2021 04:19:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632716387; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Hg92022NZ2LLcfTeTol26mPSdM56Bzl5myW+9iN1OhA=;
 b=RkB9C3YdLmzlaNoOzV3crQPZA6DUSy6J5Gmdkclu6UsPjC7Ucdy1jZApweoMxgEuRQWef4H7
 g4rtq2RoQjzNKgducBsY4RcGK0PqrYWmVXuXrwtNpSkGbgTYMFMD7M0dHs9Cy4PNmlyu6r8K
 WLccJNCoBo+pEe9dIu+yKXjTZdc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615146623cc3a01f263a9e2c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Sep 2021 04:19:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A8098C43460; Mon, 27 Sep 2021 04:19:45 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 540A5C4338F;
 Mon, 27 Sep 2021 04:19:45 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 27 Sep 2021 09:49:45 +0530
From: akolli@codeaurora.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/3] ath11k: add htt cmd to enable full monitor mode
In-Reply-To: <87tuiaryhk.fsf@codeaurora.org>
References: <20210721171905.61838-1-jouni@codeaurora.org>
 <20210721171905.61838-2-jouni@codeaurora.org>
 <87tuiaryhk.fsf@codeaurora.org>
Message-ID: <f01c7797e7072687ab6014ccba431eb9@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_211948_361655_2AC54F94 
X-CRM114-Status: GOOD (  10.55  )
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

On 2021-09-24 17:12, Kalle Valo wrote:
> Jouni Malinen <jouni@codeaurora.org> writes:
> 
>> From: Anilkumar Kolli <akolli@codeaurora.org>
>> 
>> Add a new hw_param full_monitor_mode to enable full monitor support 
>> for
>> QCN9074. HTT_H2T_MSG_TYPE_RX_FULL_MONITOR_MODE cmd is sent to the
>> firmware to enable the full monitor mode.
> 
> Nowhere it's explained what "full monitor mode" means from an user's
> point of view. Can someone give a high level summary what advantages
> this feature has? For example, more frames delivered to user space or
> what?

Yes, more frames delivered with full monitor mode. The advantage with 
full
monitor mode is, hardware has status buffers available for all the MPDUs 
in
mon_dst_ring. Both status buffer and MPDUs from mon_dst_ring is used to 
build
the frame.

Patch "ath11k: Process full monitor mode rx support" has the commit 
message.

In full monitor mode, monitor destination ring is read before monitor
status ring. mon_dst_ring has ppdu id, reap till the end of PPDU. Add
all the MPDUs to list. Start processing the status ring, if PPDU id in
status ring is lagging behind, reap the status ring, once the PPDU ID
matches, deliver the MSDU to upper layer. If status PPDU id leading,
reap the mon_dst_ring. The advantage with full monitor mode is hardware
has status buffers available for all the MPDUs in mon_dst_ring.

- Anil.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
