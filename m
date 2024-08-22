Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80462C52D7C
	for <ath11k@archiver.kernel.org>; Thu, 22 Aug 2024 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADJ9JPy12I9F571KjrBoKcZrdx2pDDNKEnKu86lcRsc=; b=r4KPYGUhA/jlXARFNptZplNrxY
	2JaDPDNPvcr5wSzT9Xz/EMXC8h8rz1lR2mYGpfho8NQSaIDVz19wn4rNIruy5Lmr4Fy4fH8rFywd8
	5sWOJjIUDd/B2HzR3BvPPSf3bNuwQ02mjNcPYQ9bJmlqIC/w0g908L0sBKymK19yh1nEGxw6bQkJU
	ePG8ai1UfKBNoQLqRQC0SwGAwM+jXxoUiyVsKecLo96nh1764D3uO9K6e1niFMat0aNcOIkseaET1
	oVuxGPCnwoom0cwZC0VkaBzHYPaQVfGmVA/S2ns5olrzZnfUv8l7nkHcMDjobI1O5MNYvrfj0gzNb
	BIhxWm4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shB0s-0000000Dfpk-3DXM;
	Thu, 22 Aug 2024 16:50:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shB0p-0000000DfnX-30u3
	for ath11k@lists.infradead.org;
	Thu, 22 Aug 2024 16:50:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C515A407F4;
	Thu, 22 Aug 2024 16:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD69CC4AF0F;
	Thu, 22 Aug 2024 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724345413;
	bh=+fNrTItCT2YwGN+dojlHcg8wSI5mEQWYNR8QSA6wH8A=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=C4K59aSinf7Nds94klrGvAj7XbveK9nhD9+YPIZcrhQt0XDARKVvYbm8YycxSTcRz
	 dlkkFQqwGUlsIHD8w1CpiOQuAIYOwxedeMXs+SeWyklLe10NDOOp39VXZ5YEyt4G/9
	 nK839XUKK3IW8Fx3sp53XeLPsOQAu/Y6bPI3gYmSgfuytNHmHQkEXcK817VWeWb3ct
	 ZFSuKCR54xd78exXaX+y6+z+ds0dpZq9tqpal1lMrvRAZQeiPt1/A0kAoFQjKEfSLg
	 gNtQLNrkR8Cr+k5dA3ODvt760gkncNUeO5VGOgmLU6kYzTDrmqpi5Np64pd+7q4YoP
	 bcNPc8qA/TOIw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,  Jeff Johnson
 <jjohnson@kernel.org>,  <linux-wireless@vger.kernel.org>,
  <ath11k@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH][next] wifi: ath11k: Avoid
 -Wflex-array-member-not-at-end warnings
References: <ZrZB3Rjswe0ZXtug@cute>
	<8d31adac-fd43-4cf9-8fc8-655b359a573c@quicinc.com>
Date: Thu, 22 Aug 2024 19:50:09 +0300
In-Reply-To: <8d31adac-fd43-4cf9-8fc8-655b359a573c@quicinc.com> (Jeff
	Johnson's message of "Fri, 9 Aug 2024 19:21:10 -0700")
Message-ID: <871q2gwlha.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_095015_992781_B58DDF7B 
X-CRM114-Status: GOOD (  21.58  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 8/9/2024 9:20 AM, Gustavo A. R. Silva wrote:
>
>> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
>> getting ready to enable it, globally.
>> 
>> Move the conflicting declaration to the end of the structure. Notice
>> that `struct ieee80211_chanctx_conf` is a flexible structure --a
>> structure that contains a flexible-array member.
>> 
>> Also, remove a couple of unused structures.
>> 
>> Fix the following warnings:
>> drivers/net/wireless/ath/ath11k/core.h:409:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>> drivers/net/wireless/ath/ath11k/dp.h:1309:24: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>> drivers/net/wireless/ath/ath11k/dp.h:1368:24: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>> 
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>  drivers/net/wireless/ath/ath11k/core.h |  4 +++-
>>  drivers/net/wireless/ath/ath11k/dp.h   | 23 -----------------------
>>  2 files changed, 3 insertions(+), 24 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
>> index df24f0e409af..e283415dccf3 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.h
>> +++ b/drivers/net/wireless/ath/ath11k/core.h
>> @@ -406,11 +406,13 @@ struct ath11k_vif {
>>  	bool wpaie_present;
>>  	bool bcca_zero_sent;
>>  	bool do_not_send_tmpl;
>> -	struct ieee80211_chanctx_conf chanctx;
>>  	struct ath11k_arp_ns_offload arp_ns_offload;
>>  	struct ath11k_rekey_data rekey_data;
>>  
>>  	struct ath11k_reg_tpc_power_info reg_tpc_info;
>> +
>> +	/* Must be last - ends in a flexible-array member. */
>> +	struct ieee80211_chanctx_conf chanctx;
>
> there is something illogical about this since the vif is allocated using
> sizeof() and hence there will never be memory allocated for the flexible
> array, and it is assigned using either struct assignment or memcpy using the
> struct size which (fortunately) would not transfer the flexible array contents:
> 		arvif->chanctx = *ctx;
>
> 		memcpy(&arvif->chanctx, ctx, sizeof(*ctx));
>
> since ath11k doesn't actually use the drv_priv[] I guess this change is OK, it
> is just strange to me.
>
> also makes me wonder why ath11k keeps a copy of the chanctx instead of just
> getting it from the underlying ieee80211_link_data. but that is outside the
> scope of this discussion.

Yeah, this doesn't look right. I don't think a driver should be copying
struct ieee80211_chanctx_conf like that. I think I'll add a comment
about this to the code:

/* FIXME: Driver should not copy struct ieee80211_chanctx_conf,
 * especially because it has a flexible array. Find a better way.
 */

Thoughts?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html

