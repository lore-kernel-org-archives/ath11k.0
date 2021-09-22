Return-Path: <SRS0=I8HY=OM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63405C433EF
	for <ath11k@archiver.kernel.org>; Wed, 22 Sep 2021 15:53:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22C6761090
	for <ath11k@archiver.kernel.org>; Wed, 22 Sep 2021 15:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22C6761090
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IpdLhYPRiqgJkaG35mcTzg60cWBKNDxSHfuam5+tVo=; b=LrehJ/dN9f597XsGiip8m0XN7H
	vprqjI3y7pQ4Ax+A5CoalMH03kgmJkQzxQqmJS/pD05e/ym6D6hMNK56f9/GI+Gqw4bFTuKdBI/Ob
	EtJRKTnXZsss6Do7tZx3diNzmfW62qIX0oCMeyxxVqO61zn/CWc3wXvLRVvs82Ei0vsm8B/xMvvwo
	Lcis7M4u0LOHPZC7679H65hTCmsEtXYJqK0eF4Y5nBYQUP9gtuO/af/ogbwNKsqW9izp42+rvVzb9
	1ysSO35s6/6HqPFAeTT2ihM6uYcFOWvVxCx9gYZnnBd1zeL/Mr2OII1mOfoRJmMDwuG+mMQuajElp
	VuVDWM6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mT4Z9-0092FF-L6; Wed, 22 Sep 2021 15:53:47 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT4Z6-0092EO-8z
 for ath11k@lists.infradead.org; Wed, 22 Sep 2021 15:53:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632326025; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TQmo6H985l6YspKxjxGXlp8XC/Pf9PkfzoCAYLU0wAw=;
 b=o8MHzgc7Ohsr7lG0DS3NTm+O2bZ6VUqqNZ5GfsnjvozHXxt6GupWg6WDFPFh/oy6EplLzuuq
 qVGujq7EONbs7pUuHOZj8wolF8PW2vn5D/QexiIJipQRjfl8IpxqzCdLRUOQ/yRtO0C67B+S
 lm7V5sXEzJf57rrPUkkJc0NLPcc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 614b517de0f78151d62e9537 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 15:53:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3CC57C43616; Wed, 22 Sep 2021 15:53:33 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: seevalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 83B81C4360C;
 Wed, 22 Sep 2021 15:53:32 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 22 Sep 2021 21:23:32 +0530
From: Seevalamuthu Mariappan <seevalam@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Miles Hu <milehu@codeaurora.org>,
 Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: Re: [PATCH 2/3] ath11k: add separate APIs for monitor mode
In-Reply-To: <87tuidudmi.fsf@codeaurora.org>
References: <20210721162053.46290-1-jouni@codeaurora.org>
 <20210721162053.46290-3-jouni@codeaurora.org>
 <877dfaukjq.fsf@codeaurora.org> <87tuidudmi.fsf@codeaurora.org>
Message-ID: <58b100804acf0afc1c8baf4840ed65d8@codeaurora.org>
X-Sender: seevalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_085345_625371_C212A20E 
X-CRM114-Status: GOOD (  15.21  )
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

On 2021-09-21 21:25, Kalle Valo wrote:
> Kalle Valo <kvalo@codeaurora.org> writes:
> 
>>> +vdev_stop:
>>> +	reinit_completion(&ar->vdev_setup_done);
>>> +
>>> +	ret = ath11k_wmi_vdev_stop(ar, vdev_id);
>>> +	if (ret) {
>>> +		ath11k_warn(ar->ab, "failed to stop monitor vdev %i after start 
>>> failure: %d\n",
>>> +			    vdev_id, ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = ath11k_mac_vdev_setup_sync(ar);
>>> +	if (ret)
>>> +		ath11k_warn(ar->ab, "failed to synchronize setup for vdev %i stop: 
>>> %d\n",
>>> +			    vdev_id, ret);
>> 
>> I added return ret here for consistency..
>> 
>>> +	return ret;
>> 
>> I don't thinks this is right, in an error path (vdev_stop label) we
>> return 0? I changed this to -EIO.
>> 
>>> +static int ath11k_mac_monitor_vdev_stop(struct ath11k *ar)
>>> +{
>>> +	int ret;
>>> +
>>> +	lockdep_assert_held(&ar->conf_mutex);
>>> +
>>> +	reinit_completion(&ar->vdev_setup_done);
>>> +
>>> +	ret = ath11k_wmi_vdev_stop(ar, ar->monitor_vdev_id);
>>> +	if (ret)
>>> +		ath11k_warn(ar->ab, "failed to request monitor vdev %i stop: 
>>> %d\n",
>>> +			    ar->monitor_vdev_id, ret);
>>> +
>>> +	ret = ath11k_mac_vdev_setup_sync(ar);
>>> +	if (ret)
>>> + ath11k_warn(ar->ab, "failed to synchronize monitor vdev %i stop:
>>> %d\n",
>>> +			    ar->monitor_vdev_id, ret);
>>> +
>>> +	ret = ath11k_wmi_vdev_down(ar, ar->monitor_vdev_id);
>>> +	if (ret)
>>> +		ath11k_warn(ar->ab, "failed to put down monitor vdev %i: %d\n",
>>> +			    ar->monitor_vdev_id, ret);
>>> +
>>> +	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac monitor vdev %i stopped\n",
>>> +		   ar->monitor_vdev_id);
>>> +	return ret;
>>> +}
>> 
>> I was not sure what's the idea of error path handling here, we print
>> warnings but still continue the normal execution. I changed this so 
>> that
>> we bail out in the first error and if everything goes well we return 
>> 0.
> 
> I found quite a few missing error checks, too many to list here but
> fixed in the pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=8b2f8d11422e7909ff02db456cda41728f621de4
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=5ff318be206b3d2a0bfdcfaf0ac52cc3b4ecdeae
> 
> Please double check, compile tested only.

Thanks for the fixes Kalle. It looks fine and tested the same.

Regards,
Seevalamuthu M

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
