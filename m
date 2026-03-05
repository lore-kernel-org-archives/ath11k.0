Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9571FF30946
	for <ath11k@archiver.kernel.org>; Thu,  5 Mar 2026 12:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+cxzkSZ3M+R2V/9tQMeQCEUMvs0PpleX3r3RBKDl/Y=; b=ybyBUR5x/HaY3AyhZSJViKiUn9
	JZhJ0fktf8O/wNva6Q82rTxazNNtFqWUYTC5bj5Jpxx1KmnqrIIJ8Y7wM+0XxvcvSZyhT/8o8urdm
	Y6IR5pKdpbZdyVDmotPTMsoMc6bTLptTI0yERd6peJjvnIt5MF9GJqW4RWiQVf/s8Z8QBPzsAmoJd
	Wb+K8vQ+tdtynOqDNTBrSfb8PeBKuml858kYfoUD4/nJIBWNdHLki1tkAOYPE5M8j/fSFblENUbgq
	8oFUtKCErQKD6pWeFfj1tWyNEUKEZO3H/L2RIK4ih7p0ETh80BdXKbmtB3WgAXLONxQjTuWXBJcAW
	LbNh0pvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy866-00000001oEr-001s;
	Thu, 05 Mar 2026 12:46:34 +0000
Received: from forward501a.mail.yandex.net ([178.154.239.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy862-00000001oDx-2Ml7
	for ath11k@lists.infradead.org;
	Thu, 05 Mar 2026 12:46:33 +0000
Received: from mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:740e:0:640:bd25:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id 4D77D823E0;
	Thu, 05 Mar 2026 15:46:19 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id GkoOk8DGGuQ0-8HIWslk2;
	Thu, 05 Mar 2026 15:46:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1772714778; bh=E+cxzkSZ3M+R2V/9tQMeQCEUMvs0PpleX3r3RBKDl/Y=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=iFVGS4rzjVrUnrJHeSxCWAcrpFVN6fJQs/Lp/9RRWr5HNeYgLt21eZYTXhlWYxxdU
	 25Mms++x7xhOxEK3b4czNsyHzYtcZYmnjJldj3pAxiiaKuM7MZkvUzqPyi3Kd/ePTO
	 G3AJVsAKcXIr3ZIby9DBdFqYlXkJJdDGOnidMayY=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Message-ID: <facd539e-916f-4511-bc25-61c79433aed7@0upti.me>
Date: Thu, 5 Mar 2026 15:46:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Add quirk entry for Thinkpad T14s Gen3 AMD
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, tiwai@suse.de
Cc: ath11k@lists.infradead.org, jeff.johnson@oss.qualcomm.com,
 linux-wireless@vger.kernel.org, mpearson-lenovo@squebb.ca
References: <875xaypnkz.wl-tiwai@suse.de>
 <b410fa3f-0241-4805-afb0-efb950e04bd2@0upti.me>
 <09b6b13b-2b88-49b2-b865-f70996708c01@oss.qualcomm.com>
 <c63b4cc0-3157-432c-a83b-c638e8c8d665@oss.qualcomm.com>
Content-Language: en-US
From: Ilya K <me@0upti.me>
In-Reply-To: <c63b4cc0-3157-432c-a83b-c638e8c8d665@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_044630_786107_5ACDE28D 
X-CRM114-Status: GOOD (  17.51  )
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

On 2026-01-12 05:37, Baochen Qiang wrote:
> 
> 
> On 1/12/2026 10:35 AM, Baochen Qiang wrote:
>>
>>
>> On 1/11/2026 6:47 PM, Ilya K wrote:
>>> Hey folks,
>>>
>>> Sorry for bumping an old-ish thread, but I've had the same issue on a T13 Gen3 machine as well (model 21CG), and there seems to be no better solution in sight.
>>>
>>> Also, here's another instance of what I'm pretty sure is the same issue: https://lore.kernel.org/ath11k/6268b094-5a40-40d8-8461-9c9b0f9e1ae3@oss.qualcomm.com/T/#t
>>>
>>> Can this get landed at least as a temporary workaround? Also, should I submit the 21CG quirk as a separate patch?
>>
>> I had an off list discussion with Takashi, and based on the logs collected I don't think
>> this is not a suspend/resume issue, or even this is not a STA side issue.
> 
> my bad:
> 
> s/this is not/this is/
> 
>>
>> Before we conclude whether your issue is the same or not, can you please describe your
>> issue in detail? specifically is it an unexpected wakeup or is it reconnection failure
>> after a normal wakeup?
>>
> 

I've had a bit of an off list conversation with Baochen about this a while ago, but I just saw https://lore.kernel.org/ath11k/20260214212452.782265-38-sashal@kernel.org/T/#u landed, and I still haven't had time to get more data on the affected machine, but it has been rock solid with the quirk added locally, across updated and different APs. Maybe it makes sense to add the quirk at least for the time being? I'll try to get some debug time in the coming weeks, but free time is hard to come by lately :(

