Return-Path: <SRS0=+KM5=PI=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33C9C433EF
	for <ath11k@archiver.kernel.org>; Wed, 20 Oct 2021 08:16:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EBBD60FD9
	for <ath11k@archiver.kernel.org>; Wed, 20 Oct 2021 08:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EBBD60FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2XD+VWMrlgfVUCjmm2hNRZvXIENSNdM5wNJAfdrq6c=; b=SEx1tYEoVSiFan
	L//ehEItuToHVxf6gYi4xfEkutP8gEFn0/PF2PV5eVa/T/Rpwl0tZnr3bGwgwjKcQwMX3WD/xLuvx
	8lwiD/FHfLQbjG2K/FSKGr9ug1FWHyY5ujMFJ/tXz+vqufBu05ySKIHci1S2PRpa6v+DGmQcUmqAx
	eJDrr2BJDkc1Gg23OEi/09efkuAdgS8yxlqxe4702YO25j9XakER4bBC8pSVcqMRo0pR9SGyvnKeC
	vPbboKCGD+c7Yc2uvjrITAGDrkE88nMd2imIISJc41020z3phao6kU9W8T0kjd91UxACTsFQJmP6g
	ZYMy1vWoWKogcLsok6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md6lw-003oZn-8w; Wed, 20 Oct 2021 08:16:28 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md6ls-003oZ1-7y
 for ath11k@lists.infradead.org; Wed, 20 Oct 2021 08:16:27 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634717785; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=0DL3DJwkgkS7ufNhQKn+u+0Ba5FSWwx8vGS95DGOeWc=;
 b=G73ZWnZtr/B5TFrnbvT43qbz0cbi80kUNwX1pqlyqnRwOkFUVLqpWqJsUpHQxCtJMvq6fN8s
 cdgFeAnbZnr3zd0/9uuVi+Ei1HF6nJhjtscnw8+VFf10zRSZDa0B3ueBuj/rsZlXKdWlapXI
 VzYG0Z9IoMvxKKRnECzpp7l6Dbg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 616fd04dbc302969587f613b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Oct 2021 08:16:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 31B72C4360C; Wed, 20 Oct 2021 08:16:13 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C768C4338F;
 Wed, 20 Oct 2021 08:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3C768C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Mark Herbert <mark.herbert42@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: High battery usage with ath11k on Dell 9310
References: <c2c790a6-b86a-6664-e147-bc642e00e325@gmail.com>
 <e5da99ce-a8a0-24b9-9e05-5f575456fb94@gmail.com>
Date: Wed, 20 Oct 2021 11:16:10 +0300
In-Reply-To: <e5da99ce-a8a0-24b9-9e05-5f575456fb94@gmail.com> (Mark Herbert's
 message of "Wed, 13 Oct 2021 19:37:48 +0300")
Message-ID: <87tuhcf6wl.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_011625_839605_7AC466CF 
X-CRM114-Status: GOOD (  12.12  )
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

Mark Herbert <mark.herbert42@gmail.com> writes:

> I've tried to apply
> [PATCH] ath11k: enable power save in station mode
>
> It did not apply over the ath-next but being applied manually drivers
> compiled and I can now reach PC8 state. And it stays pretty much time
> there -88% if laptop is idle. So I hope if this patch will make it to
> the main tree it will solve one of the bugs.

Thanks for testing, I'll prioritise this patch so that it's applied
quickly.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
