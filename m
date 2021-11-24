Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393A2C433EF
	for <ath11k@archiver.kernel.org>; Wed, 24 Nov 2021 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUkchy1nUZdI4C/wRapeeZZHLAGuHHwS1K0zncqW7r0=; b=buXk4qTK1SgC7h
	5qRk1NtBMhgNGBgNnREYHFoOxYiVEfPDXbnyO8k8UXMsUfxJYH+a63Q0G+9T08+5p/wX1/D2TPSwU
	ovabC+l+JjAC7oCwGQ/6FXM2cXRw+wYctWaVBTTovxa4gc2lCJkkcEHWMsdfDBUvfCQgbxU85KR5m
	CShG6xM4KoJGD86bStU01NfM6GVFsu7TcOl0DA8DlORvPx1iFnOO4dqn+3MxKzC+ohZ9KJyMC4aBn
	w+JDw1D2AmSC0zfcOclRmz7a2IzKCKp2XH8szew2NkpMtv20bqLUciBB3uOA60gCl9P5AgegJFyo1
	p9mqif5ICzGeH9uKhnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpmsx-0048Ey-VL; Wed, 24 Nov 2021 07:40:08 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpmst-00489h-Ua
 for ath11k@lists.infradead.org; Wed, 24 Nov 2021 07:40:05 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637739599; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=KlBt6VrXCvps14JV6wK6+MGAbpn/eHc4WVGnRxXnBXM=;
 b=oADJpJHcdO9rookz7UZiextgp2Y2VTcDLTIG5dNRUp3ABtPXuaIv1zxQk47om4SjGRh1IjsG
 gKnKxbHFfWqpB9wWRwyIRmL5zBQCYWkytmITVCyRtBgEr/AyUsJk1sBeh7fqIiJW33Tp0EZa
 OhjvQNcmKOugSkGmF7PpfWndRhI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 619dec4edf12ba53c4e87be4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 07:39:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 12F57C43619; Wed, 24 Nov 2021 07:39:58 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CF5F1C4360D;
 Wed, 24 Nov 2021 07:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CF5F1C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: P Praneesh <ppranees@codeaurora.org>, <ath11k@lists.infradead.org>,
 <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: Re: [PATCH v3 2/3] ath11k: Refactor update channel list function
References: <1634906227-22028-1-git-send-email-ppranees@codeaurora.org>
 <1634906227-22028-3-git-send-email-ppranees@codeaurora.org>
 <0fb4fec3-4fd0-6e92-b1d9-5bffc0958e97@quicinc.com>
Date: Wed, 24 Nov 2021 09:39:50 +0200
In-Reply-To: <0fb4fec3-4fd0-6e92-b1d9-5bffc0958e97@quicinc.com> (Wen Gong's
 message of "Wed, 24 Nov 2021 11:50:05 +0800")
Message-ID: <87pmqq6lyx.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_234004_121214_DCCCB152 
X-CRM114-Status: GOOD (  13.84  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> On 10/22/2021 8:37 PM, P Praneesh wrote:
>
> ...
>
>> ---
>> ...
>> -			ch->maxpower = channel->max_power * 2;
>> -			ch->maxregpower = channel->max_reg_power * 2;
>> -			ch->antennamax = channel->max_antenna_gain * 2;
>> ...
>>   +int ath11k_wmi_update_scan_chan_list(struct ath11k *ar,
>> +				     struct scan_req_params *arg)
>> ...
>> +			ch->maxpower = channel->max_power;
>> +			ch->maxregpower = channel->max_reg_power;
>> +			ch->antennamax = channel->max_antenna_gain;
>> +
>> ...
>
> I see it also have another patch to remove the "*2" for power.
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=9212c1b9e80a869e732769a4fe7f82d392b219be
>
> ath11k: send proper txpower and maxregpower values to firmware.
>
> so are you the same reason to remove "*2" ?

I'm not quite getting what you are saying, can you elaborate more? Did
this patch break something?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
