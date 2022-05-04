Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200A3C433F5
	for <ath11k@archiver.kernel.org>; Wed,  4 May 2022 05:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DWlKMrE8Xx9124q2i937bZ5C2KJYPZ47JtBneugESY=; b=JYkm4//N+aN2BQ
	0T/W+B7LcEyvm852F0y0W5Z517LVqrPmRVi6I8cJoUsGQOs/Wo1PATuvje6mSfFRF8X0+qUsiniQA
	hlnVplDsO3cAjjdKGgIccW3gE0D0/vNGZEBe5SPIHOUAgltqSHMnOEJ2Pu+j2IJoYyLqA8hSFMA/0
	+gZ6ykAS2gGkVe/gTKJ4BOSv1ASiChd2IJcrL2imOu2t6Tpb0/he5I6ufzbnnjYWTQBxIvZbHNufc
	yyiM6cRXRA5YnAMv/tYu0K+t7qAlws7e85sXU0AHm/ybgfgl/Mhw8JMS+CVeU3E/HyUenYfSvWRg/
	62DvNylVBJ39DY99Vsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm81l-008uPu-Gq; Wed, 04 May 2022 05:58:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm81i-008uP4-KI
 for ath11k@lists.infradead.org; Wed, 04 May 2022 05:58:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A918B823E3;
 Wed,  4 May 2022 05:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064A9C385A5;
 Wed,  4 May 2022 05:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651643895;
 bh=6rMrdFlxB2HYNIr+QgW4lkKZhphhdlcyYYgYahs6rb4=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=HNqIa9aTzg5/UfzkCn4SMjoPG6ZMqskucwV33Iz1m4dZvXfBxS3c9IMvtFN9V2adZ
 ZV2kHeFNQVdf6ftnj3Aen4W4aagphLhWzWuur9J3MweRA6TvB+tk54Qx6Ud6GlgEfB
 dqQ3y5jwzulDsBGgYjpAiAGPQSa2F6XMj7WPRhxvix3kR999/aTPRvV2dQ0UY2pPFH
 3pJLsqEI0h4UiCFfBiKARXhHlWlER3HRNA+X2OkClAtnv4wRVaLD8z4p6xlIVN+FbK
 GrumAxvhLXw5REw5WcRLfrFGWYfLY2oU55IebuTg1h9AfHd1QPZwo1kGVo62IxqeQo
 Cd62BjMwOJvow==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/2] ath11k: mac: fix too long line
References: <20220503060415.24499-1-kvalo@kernel.org>
 <f2f27831-03eb-3788-5855-649c0f33c785@quicinc.com>
Date: Wed, 04 May 2022 08:58:09 +0300
In-Reply-To: <f2f27831-03eb-3788-5855-649c0f33c785@quicinc.com> (Jeff
 Johnson's message of "Tue, 3 May 2022 08:17:55 -0700")
Message-ID: <87y1zhalfy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_225818_854145_7C5A46DC 
X-CRM114-Status: GOOD (  17.60  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 5/2/2022 11:04 PM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> checkpatch warns:
>>
>> drivers/net/wireless/ath/ath11k/mac.c:7760: line length of 91 exceeds 90 columns
>>
>> This was introduced by commit 046d2e7c50e3 ("mac80211: prepare sta handling for
>> MLO support").
>>
>> Compile tested only.
>>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/mac.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>> index c76cac5d6849..32fb0142124d 100644
>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>> @@ -7735,6 +7735,7 @@ ath11k_mac_validate_vht_he_fixed_rate_settings(struct ath11k *ar, enum nl80211_b
>>   	bool he_fixed_rate = false, vht_fixed_rate = false;
>>   	struct ath11k_peer *peer, *tmp;
>>   	const u16 *vht_mcs_mask, *he_mcs_mask;
>> +	struct ieee80211_link_sta *deflink;
>>   	u8 vht_nss, he_nss;
>>   	bool ret = true;
>>   @@ -7757,13 +7758,16 @@
>> ath11k_mac_validate_vht_he_fixed_rate_settings(struct ath11k *ar,
>> enum nl80211_b
>>   	spin_lock_bh(&ar->ab->base_lock);
>>   	list_for_each_entry_safe(peer, tmp, &ar->ab->peers, list) {
>>   		if (peer->sta) {
>> -			if (vht_fixed_rate && (!peer->sta->deflink.vht_cap.vht_supported ||
>> -					       peer->sta->deflink.rx_nss < vht_nss)) {
>> +			deflink = &peer->sta->deflink;
>
>
> is there a reason to not declare deflink here?
> then its scope of definition would equal the scope of usage

In ath10k and ath11k I have tried to avoid that and instead declare all
variables in the beginning of the function, this is to keep the code
simple. Of course there are few cases where a variable is declared in
the middle of the function, but that's just sloppy review on my part. I
feel that it's better to refactor the function into smaller functions
than start declaring variables in the middle of functions. Does that
make sense?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
