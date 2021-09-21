Return-Path: <SRS0=KY21=OL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DF3C433F5
	for <ath11k@archiver.kernel.org>; Tue, 21 Sep 2021 16:03:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 073F260FE6
	for <ath11k@archiver.kernel.org>; Tue, 21 Sep 2021 16:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 073F260FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUHuTeMcPbxMh9kOdsVYchKJ02fYtchs+BhE7LLGpF4=; b=TgEGiMT6c/zj4b
	7MytqgmjrgAMhycTKSAa0aA5siyb5lKJVVqjGyOyNATw3kkZ7XMPQZVVtkKThPx5514CAOssJgDWO
	sBPOhhf/Ud8qC/RZ4JSy5k54G+zScW5tIwksQiLu39I5nw/QtUkqhc5joFVjY/GShJO2BiBPcldgO
	Fs5MsBekmzmwNEbqOyQmIr40PTsQfJeq8oYTN9NgcD0FYIq4WBzoCJLnnMxNyugp75w62S9rnT0QS
	Hv0MJwq+nu2nrCV/DHzwe+N2WC/oUWxWQ1wB+FO3fv6DPlb/6qKudvoXvHvbLNEv1aQYgiNWBQnqE
	ByW8mTjMWzwY+87ppxFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSiEd-0053pq-7a; Tue, 21 Sep 2021 16:03:07 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSi7s-0050NJ-RS
 for ath11k@lists.infradead.org; Tue, 21 Sep 2021 15:56:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632239768; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=R2SYqKJghX3Q9JXD5f+M78ix3or9lR3EMnYoy1HL7R8=;
 b=JiLRm5T2iQEy5yqJ9/uToC1zAHQDGcEJEnrQ26hnH4m2/z+jkP/al9AfeCXo03juExcfH+pv
 O3DOBTZhEua7tEu3UZoeD0p/RK8MkeXJ4q2M3ttkI40XX5vss7gZoOrTEjDnXcn7g1NQiKN+
 YV2e0Y+Os5/IBWWKlldbRARdMq4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 614a008a8b04ef85893b2e3e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 15:55:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DDEE7C4360D; Tue, 21 Sep 2021 15:55:54 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E4765C43460;
 Tue, 21 Sep 2021 15:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E4765C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Miles Hu <milehu@codeaurora.org>,
 Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: Re: [PATCH 2/3] ath11k: add separate APIs for monitor mode
References: <20210721162053.46290-1-jouni@codeaurora.org>
 <20210721162053.46290-3-jouni@codeaurora.org>
 <877dfaukjq.fsf@codeaurora.org>
Date: Tue, 21 Sep 2021 18:55:49 +0300
In-Reply-To: <877dfaukjq.fsf@codeaurora.org> (Kalle Valo's message of "Tue, 21
 Sep 2021 16:26:17 +0300")
Message-ID: <87tuidudmi.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_085608_977877_244F4E16 
X-CRM114-Status: GOOD (  15.91  )
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

Kalle Valo <kvalo@codeaurora.org> writes:

>> +vdev_stop:
>> +	reinit_completion(&ar->vdev_setup_done);
>> +
>> +	ret = ath11k_wmi_vdev_stop(ar, vdev_id);
>> +	if (ret) {
>> +		ath11k_warn(ar->ab, "failed to stop monitor vdev %i after start failure: %d\n",
>> +			    vdev_id, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = ath11k_mac_vdev_setup_sync(ar);
>> +	if (ret)
>> +		ath11k_warn(ar->ab, "failed to synchronize setup for vdev %i stop: %d\n",
>> +			    vdev_id, ret);
>
> I added return ret here for consistency..
>
>> +	return ret;
>
> I don't thinks this is right, in an error path (vdev_stop label) we
> return 0? I changed this to -EIO.
>
>> +static int ath11k_mac_monitor_vdev_stop(struct ath11k *ar)
>> +{
>> +	int ret;
>> +
>> +	lockdep_assert_held(&ar->conf_mutex);
>> +
>> +	reinit_completion(&ar->vdev_setup_done);
>> +
>> +	ret = ath11k_wmi_vdev_stop(ar, ar->monitor_vdev_id);
>> +	if (ret)
>> +		ath11k_warn(ar->ab, "failed to request monitor vdev %i stop: %d\n",
>> +			    ar->monitor_vdev_id, ret);
>> +
>> +	ret = ath11k_mac_vdev_setup_sync(ar);
>> +	if (ret)
>> + ath11k_warn(ar->ab, "failed to synchronize monitor vdev %i stop:
>> %d\n",
>> +			    ar->monitor_vdev_id, ret);
>> +
>> +	ret = ath11k_wmi_vdev_down(ar, ar->monitor_vdev_id);
>> +	if (ret)
>> +		ath11k_warn(ar->ab, "failed to put down monitor vdev %i: %d\n",
>> +			    ar->monitor_vdev_id, ret);
>> +
>> +	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac monitor vdev %i stopped\n",
>> +		   ar->monitor_vdev_id);
>> +	return ret;
>> +}
>
> I was not sure what's the idea of error path handling here, we print
> warnings but still continue the normal execution. I changed this so that
> we bail out in the first error and if everything goes well we return 0.

I found quite a few missing error checks, too many to list here but
fixed in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=8b2f8d11422e7909ff02db456cda41728f621de4

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=5ff318be206b3d2a0bfdcfaf0ac52cc3b4ecdeae

Please double check, compile tested only.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
