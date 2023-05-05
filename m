Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCB6C77B75
	for <ath11k@archiver.kernel.org>; Fri,  5 May 2023 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UogBVmTN/Gqbz0bfUzxhVnIzjwe11BEPk10ojwbXu3w=; b=OiIk0vnxV2DTzr
	UjVBUpRd4v0+U1oo8QVTC1oa0duRg/J4oQfzO2deFlv6vuFtmeZT2XqTETBfOGRQr19JeGgQS1iUR
	l3PCDu7pHONlzfvtk6pK7JCOZ9qyMx7wYoOOxh+7270GshS61gmLW3DqL7nrcS7h0+I8nQSMNjhsL
	vKmvOsOiYUd9S3xmMbaH53LcLAVGfhISipvUquTkgAZP8v2Eh2pJZpnfL5PcjQ9Eh1YHyr8tueP8K
	qkmmDo5mGK2erurF8Lg0diVGuiXAUvoFEM7OPIA3leq4mgK5WAyntTL96Pe/68JvLskjyyLdk8PZF
	XmzIDBUO4Yj+to2LSkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puvg5-00B0pa-1O;
	Fri, 05 May 2023 13:40:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvg3-00B0od-1o
	for ath11k@bombadil.infradead.org;
	Fri, 05 May 2023 13:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kN6+BE0WzsEaXuHEK9PFscbxyz9vQDDiHHf4+zVx63c=; b=lv2L3eSQSQxn7WAxETg8FIbbDZ
	ep/ZMh0CLzhEmE5B3ezPocLK18d6DSq8OtJ9yb0ViwxA9YRv9E1nC+4NgHQVLp7Eihn4Movd0KIPn
	XIAgIHWYPS0I5TTuuZkEAHoLvwnqxngjQmMvfCcCyDYD+ypE9fS9QfGRrYDNB3qQJeJR6OYfXWQ0p
	ccTMT0mPih5DrwOYci22gXPg3xXZXDWrwYMugDzAq8APqxOQ37/I82QLoytTgJvhYsFyVXQxQD5XG
	kDRZ4xbm6FOTcCf/thBfs3vGt/dDt/5MYt1dv9B02eAXPx1sgg0AFu1ipEIDWeZ8ocsGwQxfNhRel
	j4dixJow==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvUT-003GFa-03
	for ath11k@lists.infradead.org;
	Fri, 05 May 2023 13:28:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DDF7263E17;
	Fri,  5 May 2023 13:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A1AC433D2;
	Fri,  5 May 2023 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683293330;
	bh=/AfTIT7D3Pn1g5kTlzGw7Ho8tiDr7FeLjRkseBoo/3o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=blC5zkzYK5NGSaACLhOHGdLEwX6UA511BANCyxDWfi4RmF4+WDWmZqrdW6JlShjgX
	 F5R2c6eO+oqqtcpXNq7TQ6/BnyIzR8N1w3PjdTvCUtGQq31fAUMsB7XtdkWMqo4+Ws
	 4D1beRCCrxs2C+o2bxrzdMJF+94kZ3fJcApS6ug/vZpJPhv12rxbtyLq7u6VU+C44b
	 c5+IzTs1RVkUPYnnQmpNUide/70B6eiYqGFBCeNHv1AOcPpeqyCbwBOfRU9izG3DpF
	 t0R1OKqB1B7tWuK1qexxdQzsgEoXUExir2PPaHpQ6ivUVuVViacQPfo04/pa91X5wx
	 p31niXaet+7KA==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 4/7] wifi: ath11k: MBSSID parameter configuration in AP mode
References: <20230405221648.17950-1-quic_alokad@quicinc.com>
	<20230405221648.17950-5-quic_alokad@quicinc.com>
	<87leibqme3.fsf@kernel.org>
	<b9f98415-46f5-7b9e-ba61-9b11a4498a6c@quicinc.com>
Date: Fri, 05 May 2023 16:28:47 +0300
In-Reply-To: <b9f98415-46f5-7b9e-ba61-9b11a4498a6c@quicinc.com> (Aloka Dixit's
	message of "Mon, 1 May 2023 10:41:01 -0700")
Message-ID: <87y1m2oqk0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_142853_440532_C3739A15 
X-CRM114-Status: GOOD (  19.68  )
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

Aloka Dixit <quic_alokad@quicinc.com> writes:

> On 4/28/2023 10:37 PM, Kalle Valo wrote:
>
>> Aloka Dixit <quic_alokad@quicinc.com> writes:
>>
>>> Include MBSSID parameters in WMI vdev up operation.
>>>
>>> Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>>> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
>>> Co-developed-by: John Crispin <john@phrozen.org>
>>> Signed-off-by: John Crispin <john@phrozen.org>
>>> ---
>>
>> [...]
>>
>>> @@ -7153,8 +7161,13 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
>>>   			ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
>>>   				    ret);
>>>   +		if (arvif->vif->mbssid_tx_vif)
>>> +			tx_arvif = (struct ath11k_vif *)arvif->vif->mbssid_tx_vif->drv_priv;
>>
>> This had a warning:
>>
>> drivers/net/wireless/ath/ath11k/mac.c:7200: line length of 92 exceeds 90 columns
>>
>> In the pending branch I fixed it like this:
>>
>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>> @@ -7143,6 +7143,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
>>   {
>>          struct ath11k_base *ab = ar->ab;
>>          struct ath11k_vif *arvif, *tx_arvif = NULL;
>> +       struct ieee80211_vif *mbssid_tx_vif;
>>          int ret;
>>          int i;
>>          bool monitor_vif = false;
>> @@ -7196,8 +7197,10 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
>>                          ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
>>                                      ret);
>>   -               if (arvif->vif->mbssid_tx_vif)
>> -                       tx_arvif = (struct ath11k_vif *)arvif->vif->mbssid_tx_vif->drv_priv;
>> +               mbssid_tx_vif = arvif->vif->mbssid_tx_vif;
>> +               if (mbssid_tx_vif)
>> +                       tx_arvif = (struct ath11k_vif *)mbssid_tx_vif->drv_priv;
>> +
>>                  ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
>>                                           arvif->bssid,
>>                                           tx_arvif ? tx_arvif->bssid : NULL,
>>
>> Link to the commit:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c884238009e778a0c8202a5eb0a7f68b13200bde
>>
>
> Thank you.
>
> I saw the warning but couldn't decide between adding a new pointer
> variable and letting 2 extra characters for just one assignment.

My scripts will fail loudly if any of the ath*0k-check scripts have
warnings, so just like with compiler warnings I have a zero warnings
policy :) It would become a mess otherwise to know which warnings are
new and which are old.

> What are your thoughts on changing the scripts to allow up to 100?
> Although nl80211 and mac80211 scripts also don't allow that long currently.

Yeah, the checkpatch default is 100 right now and I have understood that
what Linus prefers. I'm just worried that increasing the max to 100
makes our code even more convoluted, it's a challenge as is.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
